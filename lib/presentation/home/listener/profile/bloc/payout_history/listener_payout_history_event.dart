part of 'listener_payout_history_bloc.dart';

@freezed
sealed class ListenerPayoutHistoryEvent with _$ListenerPayoutHistoryEvent {
  const factory ListenerPayoutHistoryEvent.started() = _Started;

  const factory ListenerPayoutHistoryEvent.retryLoad() = _RetryLoad;
}
