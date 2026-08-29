import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_me_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/clear_auth_session_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this.ventingPreferences,
    this._authMeUsecase,
    this._getCachedAuthMeUsecase,
    this._clearAuthSessionUsecase, {
    Duration minimumSplashDuration = const Duration(milliseconds: 4200),
  }) : _minimumSplashDuration = minimumSplashDuration,
       super(const SplashState()) {
    on<_CheckAuthenticationStatus>(_onCheckAuthenticationStatus);
  }

  final VentingPreferences ventingPreferences;
  final AuthMeUsecase _authMeUsecase;
  final GetCachedAuthMeUsecase _getCachedAuthMeUsecase;
  final ClearAuthSessionUsecase _clearAuthSessionUsecase;
  final Duration _minimumSplashDuration;

  FutureOr<void> _onCheckAuthenticationStatus(
    _CheckAuthenticationStatus event,
    Emitter<SplashState> emit,
  ) async {
    final stopwatch = Stopwatch()..start();
    try {
      final onboardingShown = ventingPreferences.getValue(
        SavedConstants.onboardingShown,
        false,
      );

      final accessToken = _readAccessToken();
      _logTokenStatus(accessToken);

      if (!onboardingShown && accessToken.isEmpty) {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitNeedOnboarding(emit);
        return;
      }

      if (!onboardingShown && accessToken.isNotEmpty) {
        await ventingPreferences.setValue(SavedConstants.onboardingShown, true);
      }

      if (accessToken.isEmpty) {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitNeedAuthenticate(emit);
        return;
      }

      final result = await _authMeUsecase().run();

      await result.match(
        (error) async {
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'SplashBloc: /v1/auth/me failed',
          );

          final persisted = _resolvePersistedAuthMe();
          if (persisted != null) {
            await _ensureMinimumSplashDuration(stopwatch);
            _emitRouteForAuthMe(emit, persisted, fromCache: true);
            return;
          }

          if (_isAuthFailure(error)) {
            await _clearAuthSessionUsecase();
            await _ensureMinimumSplashDuration(stopwatch);
            _emitNeedAuthenticate(emit);
            return;
          }

          await _ensureMinimumSplashDuration(stopwatch);
          _handleError(error, emit);
        },
        (response) async {
          await _ensureMinimumSplashDuration(stopwatch);
          _emitRouteForAuthMe(emit, response.data);
        },
      );
    } catch (e) {
      if (_hasAccessToken()) {
        final persisted = _resolvePersistedAuthMe();
        if (persisted != null) {
          await _ensureMinimumSplashDuration(stopwatch);
          _emitRouteForAuthMe(emit, persisted, fromCache: true);
          return;
        }
      }

      await _ensureMinimumSplashDuration(stopwatch);
      _handleError(e, emit);
    }
  }

  void _emitRouteForAuthMe(
    Emitter<SplashState> emit,
    AuthMeData authMe, {
    bool fromCache = false,
  }) {
    if (fromCache) {
      LoggerManagerBase.logInfo(
        message: 'SplashBloc: routing from cached /v1/auth/me',
      );
    }

    final userType = _mapRole(authMe.role);
    emit(state.copyWith(userEmail: authMe.email));

    if (!authMe.registration_complete) {
      if (userType == AuthUserType.ventor) {
        emit(
          state.copyWith(
            userEmail: authMe.email,
            processState: const SplashProcessState.needVentorRegistration(),
          ),
        );
        return;
      }

      emit(
        state.copyWith(
          userEmail: authMe.email,
          processState: const SplashProcessState.needListenerRegistration(),
        ),
      );
      return;
    }

    if (userType == AuthUserType.lissener) {
      switch (authMe.listener_profile_status) {
        case 'under_review':
          emit(
            state.copyWith(
              userEmail: authMe.email,
              processState:
                  const SplashProcessState.listenerProfileUnderReview(),
            ),
          );
          return;
        case 'rejected':
          emit(
            state.copyWith(
              userEmail: authMe.email,
              processState: const SplashProcessState.listenerProfileRejected(),
            ),
          );
          return;
        case 'incomplete':
        case null:
          emit(
            state.copyWith(
              userEmail: authMe.email,
              processState: const SplashProcessState.needListenerRegistration(),
            ),
          );
          return;
        case 'approved':
        default:
          break;
      }
    }

    emit(
      state.copyWith(
        userEmail: authMe.email,
        processState: SplashProcessState.autherizedForApp(userType: userType),
      ),
    );
  }

  AuthUserType _mapRole(String role) => switch (role) {
    'listener' => AuthUserType.lissener,
    _ => AuthUserType.ventor,
  };

  bool _isAuthFailure(Object error) {
    if (error is MainAPIException) {
      return error.type == 'auth' || error.code == 401;
    }
    return false;
  }

  Future<void> _ensureMinimumSplashDuration(Stopwatch stopwatch) async {
    stopwatch.stop();
    final remaining = _minimumSplashDuration - stopwatch.elapsed;
    if (!remaining.isNegative) {
      await Future.delayed(remaining);
    }
  }

  String _readAccessToken() {
    return ventingPreferences.getValue(SavedConstants.accessToken, '').trim();
  }

  bool _hasAccessToken() => _readAccessToken().isNotEmpty;

  AuthMeData? _resolvePersistedAuthMe() {
    return _getCachedAuthMeUsecase() ?? _authMeFromLocalPreferences();
  }

  AuthMeData? _authMeFromLocalPreferences() {
    final email = ventingPreferences
        .getValue(SavedConstants.alreadyUser, '')
        .trim();
    final userType = ventingPreferences
        .getValue(SavedConstants.userType, '')
        .trim()
        .toLowerCase();
    if (email.isEmpty || userType.isEmpty) {
      return null;
    }

    final registrationComplete =
        ventingPreferences
            .getValue(SavedConstants.compleateRegistration, '')
            .trim()
            .toLowerCase() ==
        'true';
    final role = userType == 'lissener' ? 'listener' : 'ventor';

    return AuthMeData(
      id: '',
      email: email,
      role: role,
      registration_complete: registrationComplete,
      listener_profile_status: registrationComplete && role == 'listener'
          ? 'approved'
          : null,
    );
  }

  void _logTokenStatus(String accessToken) {
    LoggerManagerBase.logInfo(
      message:
          'Access token status: ${accessToken.isEmpty ? 'EMPTY' : 'EXISTS'}',
    );
  }

  void _emitNeedAuthenticate(Emitter<SplashState> emit) {
    LoggerManagerBase.logInfo(
      message: 'SplashBloc: no valid session - navigating to welcome',
    );

    emit(
      state.copyWith(processState: const SplashProcessState.needAuthenticate()),
    );
  }

  void _emitNeedOnboarding(Emitter<SplashState> emit) {
    emit(
      state.copyWith(processState: const SplashProcessState.needOnboarding()),
    );
  }

  void _handleError(Object error, Emitter<SplashState> emit) {
    LoggerManagerBase.logErrorMessage(
      error: error,
      message: 'Error checking authentication status',
    );

    emit(
      state.copyWith(
        processState: const SplashProcessState.error(),
        errorMessage: VentingMobLocalizationsHolder
            .current
            .failed_to_check_authentication_status,
      ),
    );
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    LoggerManagerBase.logErrorMessage(
      error: error,
      message: 'SplashBloc error',
      stackTrace: stackTrace,
    );
    super.addError(error, stackTrace);
  }
}
