part of 'ventor_dashboard_bloc.dart';

@freezed
sealed class VentorDashboardEvent with _$VentorDashboardEvent {
  const factory VentorDashboardEvent.started() = _Started;
  const factory VentorDashboardEvent.refreshRequested() = _RefreshRequested;
  const factory VentorDashboardEvent.upcomingSessionUpdated({
    VentorBookedSessionData? session,
  }) = _UpcomingSessionUpdated;
}
