import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(
    this.zainPreferences, {
    Duration minimumSplashDuration = const Duration(milliseconds: 4200),
  }) : _minimumSplashDuration = minimumSplashDuration,
       super(const SplashState()) {
    on<_CheckAuthenticationStatus>(_onCheckAuthenticationStatus);
  }

  final VentingPreferences zainPreferences;
  final Duration _minimumSplashDuration;

  FutureOr<void> _onCheckAuthenticationStatus(
    _CheckAuthenticationStatus event,
    Emitter<SplashState> emit,
  ) async {
    final stopwatch = Stopwatch()..start();
    try {
      // Check onboarding status first
      final onboardingShown = zainPreferences.getValue(
        SavedConstants.onboardingShown,
        false,
      );

      if (!onboardingShown) {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitNeedOnboarding(emit);
        return;
      }

      final compleateRegistration = zainPreferences.getValue(
        SavedConstants.compleateRegistration,
        "false",
      );

      if (compleateRegistration == "false") {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitNeedAuthenticate(emit);
        return;
      }

      // Check if user exists in preferences
      final alreadyUser = _getAlreadyUser(zainPreferences);

      if (alreadyUser.isEmpty) {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitNeedAuthenticate(emit);
        return;
      }

      // Check authentication status
      final isAuthenticated = _isUserAuthenticated(zainPreferences);

      if (isAuthenticated) {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitAuthorizedForApp(emit);
      } else {
        await _ensureMinimumSplashDuration(stopwatch);
        _emitNeedAuthenticate(emit);
      }
    } catch (e) {
      await _ensureMinimumSplashDuration(stopwatch);
      _handleError(e, emit);
    }
  }

  Future<void> _ensureMinimumSplashDuration(Stopwatch stopwatch) async {
    stopwatch.stop();
    final remaining = _minimumSplashDuration - stopwatch.elapsed;
    if (!remaining.isNegative) {
      await Future.delayed(remaining);
    }
  }

  String _getAlreadyUser(VentingPreferences preferences) {
    return preferences.getValue(SavedConstants.alreadyUser, "");
  }

  bool _isUserAuthenticated(VentingPreferences preferences) {
    final accessToken = preferences.getValue(SavedConstants.accessToken, "");

    _logTokenStatus(accessToken);

    return accessToken.isNotEmpty;
  }

  void _logTokenStatus(String accessToken) {
    LoggerManagerBase.logInfo(
      message:
          'Access token status: ${accessToken.isEmpty ? 'EMPTY' : 'EXISTS'}',
    );
  }

  void _emitAuthorizedForApp(Emitter<SplashState> emit) {
    emit(
      state.copyWith(processState: const SplashProcessState.autherizedForApp()),
    );
  }

  void _emitNeedAuthenticate(Emitter<SplashState> emit) {
    LoggerManagerBase.logInfo(
      message:
          'SplashBloc: User needs authentication - token empty/invalid or registration incomplete',
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
      message: "Error checking authentication status",
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
      message: "SplashBloc error",
      stackTrace: stackTrace,
    );
    super.addError(error, stackTrace);
  }
}
