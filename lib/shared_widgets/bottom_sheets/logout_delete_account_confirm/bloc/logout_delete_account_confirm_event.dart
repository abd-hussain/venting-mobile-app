part of 'logout_delete_account_confirm_bloc.dart';

@freezed
sealed class LogoutDeleteAccountConfirmEvent
    with _$LogoutDeleteAccountConfirmEvent {
  const factory LogoutDeleteAccountConfirmEvent.confirm({
    required LogoutDeleteAccountConfirmKind kind,
  }) = _Confirm;
}
