part of 'logout_delete_account_confirm_bloc.dart';

enum LogoutDeleteAccountConfirmStatus { idle, submitting, success, failure }

@freezed
sealed class LogoutDeleteAccountConfirmState
    with _$LogoutDeleteAccountConfirmState {
  const factory LogoutDeleteAccountConfirmState({
    @Default(LogoutDeleteAccountConfirmStatus.idle)
    LogoutDeleteAccountConfirmStatus status,
    @Default('') String errorMessage,
  }) = _LogoutDeleteAccountConfirmState;

  const LogoutDeleteAccountConfirmState._();

  bool get isSubmitting =>
      status == LogoutDeleteAccountConfirmStatus.submitting;
  bool get isSuccess => status == LogoutDeleteAccountConfirmStatus.success;
  bool get isFailure => status == LogoutDeleteAccountConfirmStatus.failure;
}
