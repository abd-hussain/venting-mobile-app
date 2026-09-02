part of 'ventor_dashboard_bloc.dart';

enum VentorDashboardStatus { initial, loading, ready, loadFailure }

enum VentorDashboardPointsStatus { initial, loading, ready, loadFailure }

@freezed
sealed class VentorDashboardState with _$VentorDashboardState {
  const factory VentorDashboardState({
    @Default(VentorDashboardStatus.initial) VentorDashboardStatus status,
    @Default('') String displayName,
    VentorBookedSessionData? upcomingSession,
    @Default(<VentorHomeRecentSessionData>[])
    List<VentorHomeRecentSessionData> recentSessions,
    String? motivation,
    @Default(VentorDashboardPointsStatus.initial)
    VentorDashboardPointsStatus pointsStatus,
    @Default(0) int points,
    @Default('') String errorMessage,
  }) = _VentorDashboardState;

  const VentorDashboardState._();

  bool get isLoading => status == VentorDashboardStatus.loading;

  bool get isPointsLoading => pointsStatus == VentorDashboardPointsStatus.loading;

  bool get hasUpcomingSession {
    final session = upcomingSession;
    if (session == null) return false;
    return session.status == VentorBookedSessionStatusData.live ||
        session.status == VentorBookedSessionStatusData.upcoming;
  }

  bool get hasRecentSessions => recentSessions.isNotEmpty;

  bool get hasMotivation => motivation != null && motivation!.isNotEmpty;
}
