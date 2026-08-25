import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/auth_forgot_password_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';

part 'forgot_password_bloc.freezed.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(
    this._authForgotPasswordUsecase, {
    required this.email,
    required this.userType,
  }) : super(ForgotPasswordState(email: email)) {
    on<_Submit>(_onSubmit);
  }

  final AuthForgotPasswordUsecase _authForgotPasswordUsecase;
  final String email;
  final AuthUserType userType;

  String get _roleApiValue => switch (userType) {
    AuthUserType.ventor => 'ventor',
    AuthUserType.lissener => 'listener',
  };

  FutureOr<void> _onSubmit(
    _Submit event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    if (state.isSubmitting || state.emailSent) {
      return;
    }

    emit(state.copyWith(isSubmitting: true, errorMessage: ''));

    final locale =
        VentingMobLocalizationsHolder.currentLanguageCode
            .toLowerCase()
            .startsWith('ar')
        ? 'ar'
        : 'en';

    final result = await _authForgotPasswordUsecase(
      email: email.trim().toLowerCase(),
      role: _roleApiValue,
      locale: locale,
    ).run();

    result.match(
      (error) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message: 'ForgotPasswordBloc: forgot-password failed',
        );
        emit(
          state.copyWith(isSubmitting: false, errorMessage: _mapError(error)),
        );
      },
      (_) {
        emit(
          state.copyWith(
            isSubmitting: false,
            errorMessage: '',
            emailSent: true,
          ),
        );
      },
    );
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    return VentingMobLocalizationsHolder.current.common_unknown_error;
  }
}
