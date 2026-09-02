part of 'ventor_dashboard_bloc.dart';

@freezed
sealed class VentorDashboardEvent with _$VentorDashboardEvent {
  const factory VentorDashboardEvent.started() = _Started;
  const factory VentorDashboardEvent.refreshRequested() = _RefreshRequested;
  const factory VentorDashboardEvent.upcomingSessionUpdated({
    VentorBookedSessionData? session,
  }) = _UpcomingSessionUpdated;
  const factory VentorDashboardEvent.moodCheckInSubmitted({
    required VentorMoodKindData mood,
    String? note,
  }) = _MoodCheckInSubmitted;
  const factory VentorDashboardEvent.streakClaimRequested() =
      _StreakClaimRequested;
  const factory VentorDashboardEvent.moodFeedbackCleared() = _MoodFeedbackCleared;
}
