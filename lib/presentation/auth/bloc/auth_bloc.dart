import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_check_email_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/social_sign_in_result.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/app/social_sign_in_repository.dart';
import 'package:venting_mobile_app/domain/usecase/auth_check_email_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_social_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_apple_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/sign_in_with_google_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/auth/auth_destination.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/auth/auth_session_routing.dart';
import 'package:venting_mobile_app/utils/session_expired_handler.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._signInWithGoogleUsecase,
    this._signInWithAppleUsecase,
    this._authCheckEmailUsecase,
    this._authSocialUsecase,
    this._authMeUsecase,
    this._ventingPreferences, {
    required this.userType,
  }) : super(const AuthState()) {
    on<_SignInWithGoogle>(_onSignInWithGoogle);
    on<_SignInWithApple>(_onSignInWithApple);
    on<_ClearError>(_onClearError);
  }

  final SignInWithGoogleUsecase _signInWithGoogleUsecase;
  final SignInWithAppleUsecase _signInWithAppleUsecase;
  final AuthCheckEmailUsecase _authCheckEmailUsecase;
  final AuthSocialUsecase _authSocialUsecase;
  final AuthMeUsecase _authMeUsecase;
  final VentingPreferences _ventingPreferences;
  final AuthUserType userType;

  String get _roleApiValue => switch (userType) {
    AuthUserType.ventor => 'ventor',
    AuthUserType.lissener => 'listener',
  };

  FutureOr<void> _onClearError(_ClearError event, Emitter<AuthState> emit) {
    if (state.errorMessage.isEmpty) {
      return null;
    }
    emit(state.copyWith(errorMessage: ''));
  }

  FutureOr<void> _onSignInWithGoogle(
    _SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    if (state.isLoadingGoogle || state.isLoadingApple) {
      return;
    }
    emit(
      state.copyWith(
        isLoadingGoogle: true,
        errorMessage: '',
        destination: null,
      ),
    );
    await _completeSocialSignIn(
      emit,
      signInResultFuture: _signInWithGoogleUsecase().run(),
      loadingGoogle: true,
    );
  }

  FutureOr<void> _onSignInWithApple(
    _SignInWithApple event,
    Emitter<AuthState> emit,
  ) async {
    if (state.isLoadingGoogle || state.isLoadingApple) {
      return;
    }
    emit(
      state.copyWith(isLoadingApple: true, errorMessage: '', destination: null),
    );
    await _completeSocialSignIn(
      emit,
      signInResultFuture: _signInWithAppleUsecase().run(),
      loadingApple: true,
    );
  }

  Future<void> _completeSocialSignIn(
    Emitter<AuthState> emit, {
    required Future<Either<Exception, SocialSignInResult>> signInResultFuture,
    bool loadingGoogle = false,
    bool loadingApple = false,
  }) async {
    try {
      final signInResultEither = await signInResultFuture;
      final signInError = signInResultEither.fold<Object?>(
        (e) => e,
        (_) => null,
      );
      if (signInError != null) {
        if (signInError is SocialSignInCancelledException) {
          if (!emit.isDone) {
            emit(
              _clearLoading(
                loadingGoogle: loadingGoogle,
                loadingApple: loadingApple,
              ),
            );
          }
          return;
        }
        if (!emit.isDone) {
          emit(
            _clearLoading(
              loadingGoogle: loadingGoogle,
              loadingApple: loadingApple,
              errorMessage: _mapError(signInError),
            ),
          );
        }
        return;
      }

      final signInResult = signInResultEither.fold<SocialSignInResult?>(
        (_) => null,
        (result) => result,
      );
      if (signInResult == null) {
        if (!emit.isDone) {
          emit(
            _clearLoading(
              loadingGoogle: loadingGoogle,
              loadingApple: loadingApple,
              errorMessage:
                  VentingMobLocalizationsHolder.current.common_unknown_error,
            ),
          );
        }
        return;
      }

      final email = signInResult.email?.trim().toLowerCase();
      if (email != null && email.isNotEmpty) {
        final checkEmailResult = await _authCheckEmailUsecase(
          email: email,
          role: _roleApiValue,
        ).run();

        final checkEmailError = checkEmailResult.fold<Object?>(
          (e) => e,
          (_) => null,
        );
        if (checkEmailError != null) {
          LoggerManagerBase.logErrorMessage(
            error: checkEmailError,
            message: 'AuthBloc: check-email failed before social auth',
          );
          if (!emit.isDone) {
            emit(
              _clearLoading(
                loadingGoogle: loadingGoogle,
                loadingApple: loadingApple,
                errorMessage: _mapError(checkEmailError),
              ),
            );
          }
          return;
        }

        final checkEmailData = checkEmailResult.fold<AuthCheckEmailData?>(
          (_) => null,
          (response) => response.data,
        );
        if (checkEmailData != null) {
          final accountRole = checkEmailData.role?.trim();
          if (checkEmailData.exists &&
              accountRole != null &&
              accountRole.isNotEmpty &&
              accountRole.toLowerCase() != _roleApiValue) {
            if (!emit.isDone) {
              emit(
                _clearLoading(
                  loadingGoogle: loadingGoogle,
                  loadingApple: loadingApple,
                  errorMessage: VentingMobLocalizationsHolder.current
                      .email_registration_role_mismatch(accountRole),
                ),
              );
            }
            return;
          }
        }
      }

      // Drop any prior session so social /me never attaches a stale Bearer,
      // and a social 401 cannot trigger refresh → force-logout to welcome.
      await _clearLocalTokens();

      final sessionResult = await _authSocialUsecase(
        signInResult: signInResult,
        role: _roleApiValue,
      ).run();

      final sessionError = sessionResult.fold<Object?>((e) => e, (_) => null);
      if (sessionError != null) {
        LoggerManagerBase.logErrorMessage(
          error: sessionError,
          message: 'AuthBloc: social auth failed',
        );
        if (!emit.isDone) {
          emit(
            _clearLoading(
              loadingGoogle: loadingGoogle,
              loadingApple: loadingApple,
              errorMessage: _mapError(sessionError),
            ),
          );
        }
        return;
      }

      final session = sessionResult.fold<AuthSessionResponseModel?>(
        (_) => null,
        (value) => value,
      );
      if (session == null) {
        if (!emit.isDone) {
          emit(
            _clearLoading(
              loadingGoogle: loadingGoogle,
              loadingApple: loadingApple,
              errorMessage:
                  VentingMobLocalizationsHolder.current.common_unknown_error,
            ),
          );
        }
        return;
      }

      await _persistSessionTokens(session);
      // Prevent a racey /me 401 → refresh fail from bouncing to welcome
      // before the auth destination screen is shown.
      SessionExpiredHandler.suppressNavigationFor(const Duration(seconds: 20));
      final sessionUser = session.data.user;

      // Route from the session immediately (same as email auth). Waiting on
      // /me here kept the spinner spinning; a /me 401 then force-logged out.
      if (!emit.isDone) {
        emit(
          _clearLoading(
            loadingGoogle: loadingGoogle,
            loadingApple: loadingApple,
            destination: AuthSessionRouting.destinationForSessionUser(
              sessionUser,
            ),
          ),
        );
      }
      unawaited(_refreshAuthMeInBackground());
    } on Object catch (error) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'AuthBloc: social sign-in failed unexpectedly',
      );
      if (!emit.isDone) {
        emit(
          _clearLoading(
            loadingGoogle: loadingGoogle,
            loadingApple: loadingApple,
            errorMessage: _mapError(error),
          ),
        );
      }
    }
  }

  AuthState _clearLoading({
    required bool loadingGoogle,
    required bool loadingApple,
    String errorMessage = '',
    AuthDestination? destination,
  }) {
    return state.copyWith(
      isLoadingGoogle: loadingGoogle ? false : state.isLoadingGoogle,
      isLoadingApple: loadingApple ? false : state.isLoadingApple,
      errorMessage: errorMessage,
      destination: destination,
    );
  }

  Future<void> _refreshAuthMeInBackground() async {
    final meResult = await _authMeUsecase().run();
    meResult.fold((error) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message:
            'AuthBloc: background /v1/auth/me failed '
            '(session routing already done)',
      );
    }, (_) {});
  }

  Future<void> _clearLocalTokens() async {
    await _ventingPreferences.remove(SavedConstants.accessToken);
    await _ventingPreferences.remove(SavedConstants.refreshToken);
  }

  Future<void> _persistSessionTokens(AuthSessionResponseModel session) async {
    await _ventingPreferences.setValue(
      SavedConstants.accessToken,
      session.data.access_token,
    );
    await _ventingPreferences.setValue(
      SavedConstants.refreshToken,
      session.data.refresh_token,
    );
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) {
        return localized;
      }
      if (error.message.isNotEmpty) {
        return error.message;
      }
    }
    return VentingMobLocalizationsHolder.current.common_unknown_error;
  }
}
