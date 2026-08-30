part of 'listener_payment_payouts_bloc.dart';

@freezed
sealed class ListenerPaymentPayoutsEvent with _$ListenerPaymentPayoutsEvent {
  const factory ListenerPaymentPayoutsEvent.started() = _Started;

  const factory ListenerPaymentPayoutsEvent.retryLoad() = _RetryLoad;

  const factory ListenerPaymentPayoutsEvent.refreshRequested() =
      _RefreshRequested;

  const factory ListenerPaymentPayoutsEvent.updateMethodRequested({
    required String accountHolderName,
    required String bankName,
    required String ibanOrAccountNumber,
    String? swiftCode,
  }) = _UpdateMethodRequested;

  const factory ListenerPaymentPayoutsEvent.requestPayoutRequested() =
      _RequestPayoutRequested;
}
