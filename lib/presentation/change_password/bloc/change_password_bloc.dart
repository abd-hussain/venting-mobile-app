import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/auth_change_password_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';

part 'change_password_bloc.freezed.dart';
part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  ChangePasswordBloc(this._authChangePasswordUsecase)
    : super(const ChangePasswordState()) {
    on<_Submit>(_onSubmit);
  }

  final AuthChangePasswordUsecase _authChangePasswordUsecase;

  Future<void> _onSubmit(
    _Submit event,
    Emitter<ChangePasswordState> emit,
  ) async {
    if (state.isSubmitting) return;

    emit(const ChangePasswordState(status: ChangePasswordStatus.submitting));

    try {
      final result = await _authChangePasswordUsecase(
        currentPassword: event.currentPassword,
        newPassword: event.newPassword,
      ).run();

      if (emit.isDone) return;

      result.match(
        (error) {
          final message = _mapError(error);
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'ChangePasswordBloc: change-password failed — $message',
          );
          emit(
            ChangePasswordState(
              status: ChangePasswordStatus.failure,
              errorMessage: message,
            ),
          );
        },
        (_) {
          emit(const ChangePasswordState(status: ChangePasswordStatus.success));
        },
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message: 'ChangePasswordBloc: unexpected change-password error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        ChangePasswordState(
          status: ChangePasswordStatus.failure,
          errorMessage: _mapError(error),
        ),
      );
    }
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    try {
      return VentingMobLocalizationsHolder.current.common_unknown_error;
    } on Object {
      return 'Something went wrong. Please try again.';
    }
  }
}
