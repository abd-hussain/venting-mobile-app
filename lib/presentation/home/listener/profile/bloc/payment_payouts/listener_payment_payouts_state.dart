part of 'listener_payment_payouts_bloc.dart';

enum ListenerPaymentPayoutsStatus { initial, loading, ready, loadFailure }

@freezed
sealed class ListenerPaymentPayoutsState with _$ListenerPaymentPayoutsState {
  const factory ListenerPaymentPayoutsState({
    @Default(ListenerPaymentPayoutsStatus.initial)
    ListenerPaymentPayoutsStatus status,
    ListenerPaymentPayoutsOverview? overview,
    @Default('') String errorMessage,
    @Default(false) bool isSavingMethod,
    @Default(false) bool isRequestingPayout,
    @Default('') String mutationErrorMessage,
    @Default(false) bool payoutRequestSucceeded,
    @Default(false) bool methodUpdateSucceeded,
  }) = _ListenerPaymentPayoutsState;

  const ListenerPaymentPayoutsState._();

  bool get isLoading => status == ListenerPaymentPayoutsStatus.loading;

  bool get isLoadingOrInitial =>
      status == ListenerPaymentPayoutsStatus.initial ||
      status == ListenerPaymentPayoutsStatus.loading;

  bool get isLoadFailure => status == ListenerPaymentPayoutsStatus.loadFailure;

  bool get isReady => status == ListenerPaymentPayoutsStatus.ready;
}
