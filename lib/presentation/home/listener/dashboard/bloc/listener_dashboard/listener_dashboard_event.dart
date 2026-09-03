part of 'listener_dashboard_bloc.dart';

@freezed
sealed class ListenerDashboardEvent with _$ListenerDashboardEvent {
  const factory ListenerDashboardEvent.started() = _Started;

  const factory ListenerDashboardEvent.retrySetupLoad() = _RetrySetupLoad;

  const factory ListenerDashboardEvent.setupRefreshRequested() =
      _SetupRefreshRequested;

  const factory ListenerDashboardEvent.onlineStatusChanged({
    required bool isOnline,
  }) = _OnlineStatusChanged;
}
