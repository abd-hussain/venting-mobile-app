part of 'ventor_dashboard_bloc.dart';

enum VentorDashboardStatus { initial, loading, ready, loadFailure }

enum VentorDashboardPointsStatus { initial, loading, ready, loadFailure }

enum VentorDashboardMoodFeedback { none, saved, streakComplete, streakClaimed }

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
    VentorMoodKindData? todayMood,
    String? todayNote,
    VentorHomeStreakData? streak,
    @Default(<bool>[false, false, false, false, false, false, false])
    List<bool> streakWeekChecked,
    @Default(false) bool streakClaimed,
    @Default(false) bool isSubmittingMood,
    @Default(false) bool isClaimingStreak,
    @Default(VentorDashboardMoodFeedback.none)
    VentorDashboardMoodFeedback moodFeedback,
    VentorRewardsOverviewData? rewardsOverview,
    @Default('') String errorMessage,
    @Default('') String moodErrorMessage,
  }) = _VentorDashboardState;

  const VentorDashboardState._();

  bool get isLoading => status == VentorDashboardStatus.loading;

  bool get isPointsLoading =>
      pointsStatus == VentorDashboardPointsStatus.loading;

  bool get hasCheckedInToday => todayMood != null;

  int get streakCount =>
      streak?.currentDays ?? streakWeekChecked.where((d) => d).length;

  bool get canClaimStreak {
    if (streakClaimed || isClaimingStreak) return false;
    final currentStreak = streak;
    if (currentStreak == null) return false;
    final offerId = currentStreak.rewardOfferId?.trim() ?? '';
    if (offerId.isEmpty) return false;
    return currentStreak.rewardUnlocked || currentStreak.isComplete;
  }

  bool get hasUpcomingSession {
    final session = upcomingSession;
    if (session == null) return false;
    return session.status == VentorBookedSessionStatusData.live ||
        session.status == VentorBookedSessionStatusData.upcoming;
  }

  bool get hasRecentSessions => recentSessions.isNotEmpty;

  bool get hasMotivation => motivation != null && motivation!.isNotEmpty;

  int get streakDiscountPercent => streak?.discountPercent ?? 0;
}
