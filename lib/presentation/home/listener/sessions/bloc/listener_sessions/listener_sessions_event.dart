part of 'listener_sessions_bloc.dart';

@freezed
sealed class ListenerSessionsEvent with _$ListenerSessionsEvent {
  const factory ListenerSessionsEvent.started() = _Started;

  const factory ListenerSessionsEvent.retryLoad() = _RetryLoad;

  const factory ListenerSessionsEvent.refreshRequested() = _RefreshRequested;

  const factory ListenerSessionsEvent.acceptRequestRequested({
    required String requestId,
  }) = _AcceptRequestRequested;

  const factory ListenerSessionsEvent.declineRequestRequested({
    required String requestId,
  }) = _DeclineRequestRequested;
}
