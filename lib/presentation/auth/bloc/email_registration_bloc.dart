import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_check_email_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/auth_check_email_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_login_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_me_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_register_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/auth/auth_destination.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/auth/auth_session_routing.dart';
import 'package:venting_mobile_app/utils/session_expired_handler.dart';

part 'email_registration_bloc.freezed.dart';
part 'email_registration_event.dart';
part 'email_registration_state.dart';

enum EmailAuthMode {
  /// Check-email has not succeeded yet.
  unknown,

  /// Email is new → create account (#1).
  register,

  /// Email exists → sign in (#2).
  login,
}

class EmailRegistrationBloc
    extends Bloc<EmailRegistrationEvent, EmailRegistrationState> {
  EmailRegistrationBloc(
    this._authCheckEmailUsecase,
    this._authRegisterUsecase,
    this._authLoginUsecase,
    this._authMeUsecase,
    this._ventingPreferences, {
    required this.userType,
  }) : super(const EmailRegistrationState()) {
    on<_EmailChanged>(_onEmailChanged);
    on<_CheckEmail>(_onCheckEmail);
    on<_Submit>(_onSubmit);
  }

  final AuthCheckEmailUsecase _authCheckEmailUsecase;
  final AuthRegisterUsecase _authRegisterUsecase;
  final AuthLoginUsecase _authLoginUsecase;
  final AuthMeUsecase _authMeUsecase;
  final VentingPreferences _ventingPreferences;
  final AuthUserType userType;

  String get _roleApiValue => switch (userType) {
    AuthUserType.ventor => 'ventor',
    AuthUserType.lissener => 'listener',
  };

  void _onEmailChanged(
    _EmailChanged event,
    Emitter<EmailRegistrationState> emit,
  ) {
    final email = event.email.trim().toLowerCase();
    // Keep login/register *or* error for this email (avoids reset→recheck loop).
    if (email.isNotEmpty && email == state.checkedEmail) {
      return;
    }
    if (state.authMode == EmailAuthMode.unknown &&
        state.errorMessage.isEmpty &&
        state.submitErrorMessage.isEmpty &&
        !state.isCheckingEmail &&
        !state.isSubmitting &&
        state.checkedEmail.isEmpty) {
      return;
    }

    emit(const EmailRegistrationState());
  }

  FutureOr<void> _onCheckEmail(
    _CheckEmail event,
    Emitter<EmailRegistrationState> emit,
  ) async {
    final email = event.email.trim().toLowerCase();
    if (email.isEmpty) {
      return;
    }

    if (!_isValidEmail(email)) {
      emit(
        EmailRegistrationState(
          checkedEmail: email,
          errorMessage: VentingMobLocalizationsHolder
              .current
              .email_registration_invalid_email,
        ),
      );
      return;
    }

    if (state.isCheckingEmail || state.isSubmitting) {
      return;
    }
    // Already resolved this email (success or error) — do not re-hit the API.
    if (email == state.checkedEmail && state.checkedEmail.isNotEmpty) {
      return;
    }

    emit(const EmailRegistrationState(isCheckingEmail: true));

    final result = await _authCheckEmailUsecase(
      email: email,
      role: _roleApiValue,
    ).run();

    result.match(
      (error) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message: 'EmailRegistrationBloc: check-email failed',
        );
        emit(
          EmailRegistrationState(
            checkedEmail: email,
            errorMessage: _mapError(error),
          ),
        );
      },
      (response) {
        final data = response.data;
        final checked = data.email.trim().toLowerCase();
        final accountRole = data.role?.trim();

        if (data.exists &&
            accountRole != null &&
            accountRole.isNotEmpty &&
            accountRole.toLowerCase() != _roleApiValue) {
          emit(
            EmailRegistrationState(
              checkedEmail: checked,
              checkEmailData: data,
              errorMessage: VentingMobLocalizationsHolder.current
                  .email_registration_role_mismatch(accountRole),
            ),
          );
          return;
        }

        emit(
          EmailRegistrationState(
            authMode: data.exists
                ? EmailAuthMode.login
                : EmailAuthMode.register,
            checkedEmail: checked,
            checkEmailData: data,
          ),
        );
      },
    );
  }

  FutureOr<void> _onSubmit(
    _Submit event,
    Emitter<EmailRegistrationState> emit,
  ) async {
    if (state.isSubmitting || state.isCheckingEmail) {
      return;
    }
    final authMode = state.authMode;
    if (authMode == EmailAuthMode.unknown) {
      return;
    }

    final email = event.email.trim().toLowerCase();
    final password = event.password;
    if (email.isEmpty || password.isEmpty) {
      return;
    }

    emit(
      state.copyWith(
        isSubmitting: true,
        submitErrorMessage: '',
        destination: null,
      ),
    );

    try {
      final sessionResult = authMode == EmailAuthMode.login
          ? await _authLoginUsecase(
              email: email,
              password: password,
              role: _roleApiValue,
            ).run()
          : await _authRegisterUsecase(
              email: email,
              password: password,
              role: _roleApiValue,
            ).run();

      final sessionError = sessionResult.fold<Object?>((e) => e, (_) => null);
      if (sessionError != null) {
        LoggerManagerBase.logErrorMessage(
          error: sessionError,
          message: authMode == EmailAuthMode.login
              ? 'EmailRegistrationBloc: login failed'
              : 'EmailRegistrationBloc: register failed',
        );
        if (!emit.isDone) {
          emit(
            state.copyWith(
              isSubmitting: false,
              submitErrorMessage: _mapError(sessionError),
            ),
          );
        }
        return;
      }

      final session = sessionResult.fold<AuthSessionResponseModel?>(
        (_) => null,
        (s) => s,
      );
      if (session == null) {
        if (!emit.isDone) {
          emit(
            state.copyWith(
              isSubmitting: false,
              submitErrorMessage:
                  VentingMobLocalizationsHolder.current.common_unknown_error,
            ),
          );
        }
        return;
      }

      await _persistSession(session);
      SessionExpiredHandler.suppressNavigationFor(const Duration(seconds: 20));

      final sessionUser = session.data.user;
      // Route immediately from the session (same as social). Waiting on /me
      // after a successful login kept the spinner spinning / kicked users out.
      final destination = AuthSessionRouting.destinationForSessionUser(
        sessionUser,
        listenerProfileStatus: state.checkEmailData?.listener_profile_status,
      );
      LoggerManagerBase.logInfo(
        message:
            'EmailRegistrationBloc: auth ok → $destination '
            '(registration_complete=${sessionUser.registration_complete}, '
            'role=${sessionUser.role})',
      );

      if (!emit.isDone) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitErrorMessage: '',
            destination: destination,
          ),
        );
      }
      unawaited(_refreshAuthMeInBackground());
    } on Object catch (error) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'EmailRegistrationBloc: submit failed unexpectedly',
      );
      if (!emit.isDone) {
        emit(
          state.copyWith(
            isSubmitting: false,
            submitErrorMessage: _mapError(error),
          ),
        );
      }
    }
  }

  Future<void> _refreshAuthMeInBackground() async {
    final meResult = await _authMeUsecase().run();
    meResult.fold((error) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message:
            'EmailRegistrationBloc: background /v1/auth/me failed '
            '(session routing already done)',
      );
    }, (_) {});
  }

  Future<void> _persistSession(AuthSessionResponseModel session) async {
    final user = session.data.user;
    await _ventingPreferences.setValue(
      SavedConstants.accessToken,
      session.data.access_token,
    );
    await _ventingPreferences.setValue(
      SavedConstants.refreshToken,
      session.data.refresh_token,
    );
    await _ventingPreferences.setValue(SavedConstants.alreadyUser, user.email);
    await _ventingPreferences.setValue(
      SavedConstants.compleateRegistration,
      user.registration_complete.toString(),
    );
    await _ventingPreferences.setValue(
      SavedConstants.userType,
      user.role == 'listener' ? 'lissener' : 'ventor',
    );
  }

  bool _isValidEmail(String email) =>
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(email);

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
