import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/auth_delete_account_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/auth_logout_usecase.dart';
import 'package:venting_mobile_app/domain/usecase/clear_auth_session_usecase.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/logout_delete_account_confirm/logout_delete_account_confirm_kind.dart';

part 'logout_delete_account_confirm_bloc.freezed.dart';
part 'logout_delete_account_confirm_event.dart';
part 'logout_delete_account_confirm_state.dart';

class LogoutDeleteAccountConfirmBloc
    extends
        Bloc<LogoutDeleteAccountConfirmEvent, LogoutDeleteAccountConfirmState> {
  LogoutDeleteAccountConfirmBloc(
    this._authLogoutUsecase,
    this._authDeleteAccountUsecase,
    this._clearAuthSessionUsecase,
  ) : super(const LogoutDeleteAccountConfirmState()) {
    on<_Confirm>(_onConfirm);
  }

  final AuthLogoutUsecase _authLogoutUsecase;
  final AuthDeleteAccountUsecase _authDeleteAccountUsecase;
  final ClearAuthSessionUsecase _clearAuthSessionUsecase;

  Future<void> _onConfirm(
    _Confirm event,
    Emitter<LogoutDeleteAccountConfirmState> emit,
  ) async {
    if (state.isSubmitting) return;

    emit(
      const LogoutDeleteAccountConfirmState(
        status: LogoutDeleteAccountConfirmStatus.submitting,
      ),
    );

    try {
      final result = switch (event.kind) {
        LogoutDeleteAccountConfirmKind.logout =>
          await _authLogoutUsecase().run(),
        LogoutDeleteAccountConfirmKind.deleteAccount =>
          await _authDeleteAccountUsecase().run(),
      };

      if (emit.isDone) return;

      final error = result.getLeft().toNullable();
      if (error != null) {
        final message = _mapError(error);
        LoggerManagerBase.logErrorMessage(
          error: error,
          message:
              'LogoutDeleteAccountConfirmBloc: ${event.kind.name} failed — $message',
        );
        emit(
          LogoutDeleteAccountConfirmState(
            status: LogoutDeleteAccountConfirmStatus.failure,
            errorMessage: message,
          ),
        );
        return;
      }

      await _clearAuthSessionUsecase();
      if (emit.isDone) return;
      emit(
        const LogoutDeleteAccountConfirmState(
          status: LogoutDeleteAccountConfirmStatus.success,
        ),
      );
    } on Object catch (error, stackTrace) {
      LoggerManagerBase.logErrorMessage(
        error: error,
        message:
            'LogoutDeleteAccountConfirmBloc: unexpected ${event.kind.name} error',
        stackTrace: stackTrace,
      );
      if (emit.isDone) return;
      emit(
        LogoutDeleteAccountConfirmState(
          status: LogoutDeleteAccountConfirmStatus.failure,
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
