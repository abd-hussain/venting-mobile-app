part of 'listener_earnings_bloc.dart';

@freezed
sealed class ListenerEarningsEvent with _$ListenerEarningsEvent {
  const factory ListenerEarningsEvent.started() = _Started;

  const factory ListenerEarningsEvent.retryLoad() = _RetryLoad;

  const factory ListenerEarningsEvent.refreshRequested() = _RefreshRequested;
}
