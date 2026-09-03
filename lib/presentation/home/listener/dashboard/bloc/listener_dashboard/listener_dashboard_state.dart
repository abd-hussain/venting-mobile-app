part of 'listener_dashboard_bloc.dart';

enum ListenerDashboardSetupStatus { initial, loading, ready, loadFailure }

@freezed
sealed class ListenerDashboardState with _$ListenerDashboardState {
  const factory ListenerDashboardState({
    @Default(ListenerDashboardSetupStatus.initial)
    ListenerDashboardSetupStatus setupStatus,
    ListenerDashboardSetupProgress? setupProgress,
    @Default('') String setupErrorMessage,
    @Default('') String listenerDisplayName,
    @Default(false) bool isOnline,
    @Default(false) bool isUpdatingOnlineStatus,
    @Default('') String onlineStatusErrorMessage,
    ListenerDashboardReminder? dailyReminder,
    ListenerDashboardUpcomingSession? nextUpcomingSession,
  }) = _ListenerDashboardState;

  const ListenerDashboardState._();

  bool get isSetupLoading =>
      setupStatus == ListenerDashboardSetupStatus.loading;

  bool get isSetupReady => setupStatus == ListenerDashboardSetupStatus.ready;

  bool get isSetupLoadFailure =>
      setupStatus == ListenerDashboardSetupStatus.loadFailure;

  bool get isSetupComplete => setupProgress?.isComplete ?? false;
}
