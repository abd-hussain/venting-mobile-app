import 'package:venting_mobile_app/domain/data/api/ventor_home_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_checkin_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_journey_response_model.dart';

enum VentorMoodKindData { great, okay, anxious, sad, angry }

class VentorMoodCheckInTodayData {
  const VentorMoodCheckInTodayData({
    required this.mood,
    this.note,
  });

  final VentorMoodKindData mood;
  final String? note;
}

class VentorHomeStreakData {
  const VentorHomeStreakData({
    required this.currentDays,
    required this.targetDays,
    required this.discountPercent,
    this.rewardOfferId,
    this.rewardUnlocked = false,
  });

  final int currentDays;
  final int targetDays;
  final int discountPercent;
  final String? rewardOfferId;
  final bool rewardUnlocked;

  bool get isComplete => currentDays >= targetDays;
}

class VentorMoodCheckinResult {
  const VentorMoodCheckinResult({
    required this.mood,
    this.note,
    required this.streak,
  });

  final VentorMoodKindData mood;
  final String? note;
  final VentorHomeStreakData streak;
}

enum VentorBookedSessionStatusData { upcoming, live, completed, cancelled }

enum VentorBookedCallModeData { voice, video }

class VentorBookedSessionData {
  const VentorBookedSessionData({
    required this.id,
    required this.listenerId,
    required this.listenerName,
    required this.listenerAvatarUrl,
    required this.durationMinutes,
    required this.status,
    required this.callMode,
    required this.speechLanguage,
    required this.amountPaid,
    required this.voiceChangeEnabled,
    this.scheduledAt,
    this.isInstant = false,
    this.refundedToBalance,
  });

  final String id;
  final String listenerId;
  final String listenerName;
  final String listenerAvatarUrl;
  final int durationMinutes;
  final VentorBookedSessionStatusData status;
  final VentorBookedCallModeData callMode;
  final String speechLanguage;
  final double amountPaid;
  final bool voiceChangeEnabled;
  final DateTime? scheduledAt;
  final bool isInstant;
  final double? refundedToBalance;

  VentorBookedSessionData copyWith({
    VentorBookedSessionStatusData? status,
    double? refundedToBalance,
  }) {
    return VentorBookedSessionData(
      id: id,
      listenerId: listenerId,
      listenerName: listenerName,
      listenerAvatarUrl: listenerAvatarUrl,
      durationMinutes: durationMinutes,
      status: status ?? this.status,
      callMode: callMode,
      speechLanguage: speechLanguage,
      amountPaid: amountPaid,
      voiceChangeEnabled: voiceChangeEnabled,
      scheduledAt: scheduledAt,
      isInstant: isInstant,
      refundedToBalance: refundedToBalance ?? this.refundedToBalance,
    );
  }
}

class VentorHomeRecentSessionData {
  const VentorHomeRecentSessionData({
    required this.id,
    required this.listenerName,
    required this.listenerAvatarUrl,
    required this.whenLabel,
    required this.durationMinutes,
    this.isFavorite = false,
  });

  final String id;
  final String listenerName;
  final String listenerAvatarUrl;
  final String whenLabel;
  final int durationMinutes;
  final bool isFavorite;
}

class VentorHomeOverview {
  const VentorHomeOverview({
    required this.displayName,
    this.upcomingSession,
    this.recentSessions = const [],
    this.motivation,
    this.moodCheckInToday,
    this.streak,
    this.streakWeekChecked = const [false, false, false, false, false, false, false],
  });

  final String displayName;
  final VentorBookedSessionData? upcomingSession;
  final List<VentorHomeRecentSessionData> recentSessions;
  final String? motivation;
  final VentorMoodCheckInTodayData? moodCheckInToday;
  final VentorHomeStreakData? streak;
  final List<bool> streakWeekChecked;
}

VentorHomeOverview ventorHomeOverviewFromApi(
  VentorHomeData data, {
  List<bool> streakWeekChecked = const [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ],
}) {
  final session = data.upcoming_session;
  final motivation = data.motivation?.trim();
  final moodToday = data.mood_checkin_today;
  final streak = data.streak;

  return VentorHomeOverview(
    displayName: data.display_name.trim(),
    upcomingSession: session == null || session.id.trim().isEmpty
        ? null
        : ventorBookedSessionFromApi(session),
    recentSessions: [
      for (final item in data.recent_sessions)
        if (item.id.trim().isNotEmpty && item.listener_name.trim().isNotEmpty)
          ventorHomeRecentSessionFromApi(item),
    ],
    motivation: motivation != null && motivation.isNotEmpty ? motivation : null,
    moodCheckInToday: moodToday == null || moodToday.mood.trim().isEmpty
        ? null
        : ventorMoodCheckInTodayFromApi(moodToday),
    streak: streak == null ? null : ventorHomeStreakFromApi(streak),
    streakWeekChecked: _mergeTodayIntoWeekChecked(
      streakWeekChecked,
      hasCheckedInToday:
          moodToday != null && moodToday.mood.trim().isNotEmpty,
    ),
  );
}

VentorMoodCheckInTodayData ventorMoodCheckInTodayFromApi(
  VentorHomeMoodCheckinModel model,
) {
  final note = model.note?.trim();
  return VentorMoodCheckInTodayData(
    mood: ventorMoodKindFromApi(model.mood),
    note: note != null && note.isNotEmpty ? note : null,
  );
}

VentorHomeStreakData ventorHomeStreakFromApi(VentorHomeStreakModel model) {
  final offerId = model.reward_offer_id?.trim();
  return VentorHomeStreakData(
    currentDays: model.current_days,
    targetDays: model.target_days,
    discountPercent: model.discount_percent,
    rewardOfferId: offerId != null && offerId.isNotEmpty ? offerId : null,
  );
}

VentorMoodCheckinResult ventorMoodCheckinResultFromApi(
  VentorMoodCheckinData data,
) {
  final note = data.note?.trim();
  final streak = data.streak;
  return VentorMoodCheckinResult(
    mood: ventorMoodKindFromApi(data.mood),
    note: note != null && note.isNotEmpty ? note : null,
    streak: streak == null
        ? const VentorHomeStreakData(currentDays: 0, targetDays: 7, discountPercent: 0)
        : VentorHomeStreakData(
            currentDays: streak.current_days,
            targetDays: 7,
            discountPercent: 0,
            rewardUnlocked: streak.reward_unlocked,
          ),
  );
}

List<bool> ventorMoodWeekCheckedFromJourney(VentorMoodJourneyData data) {
  final checked = List.filled(7, false);
  for (final point in data.points) {
    final index = point.day_index;
    if (index >= 0 && index < checked.length) {
      checked[index] = true;
    }
  }
  return checked;
}

List<bool> _mergeTodayIntoWeekChecked(
  List<bool> checked, {
  required bool hasCheckedInToday,
}) {
  if (!hasCheckedInToday) return checked;
  final merged = List<bool>.from(checked);
  final todayIndex = DateTime.now().weekday - 1;
  if (todayIndex >= 0 && todayIndex < merged.length) {
    merged[todayIndex] = true;
  }
  return merged;
}

List<bool> markTodayCheckedInWeek(List<bool> checked) {
  return _mergeTodayIntoWeekChecked(checked, hasCheckedInToday: true);
}

VentorMoodKindData ventorMoodKindFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'great' => VentorMoodKindData.great,
    'okay' => VentorMoodKindData.okay,
    'anxious' => VentorMoodKindData.anxious,
    'sad' => VentorMoodKindData.sad,
    'angry' => VentorMoodKindData.angry,
    _ => VentorMoodKindData.okay,
  };
}

String ventorMoodKindToApi(VentorMoodKindData mood) {
  return switch (mood) {
    VentorMoodKindData.great => 'great',
    VentorMoodKindData.okay => 'okay',
    VentorMoodKindData.anxious => 'anxious',
    VentorMoodKindData.sad => 'sad',
    VentorMoodKindData.angry => 'angry',
  };
}

VentorHomeRecentSessionData ventorHomeRecentSessionFromApi(
  VentorHomeRecentSessionModel model,
) {
  return VentorHomeRecentSessionData(
    id: model.id.trim(),
    listenerName: model.listener_name.trim(),
    listenerAvatarUrl: model.listener_avatar_url.trim(),
    whenLabel: model.when_label.trim(),
    durationMinutes: model.duration_minutes,
    isFavorite: model.is_favorite,
  );
}

VentorBookedSessionData ventorBookedSessionFromApi(
  VentorHomeBookedSessionModel model,
) {
  return VentorBookedSessionData(
    id: model.id.trim(),
    listenerId: model.listener_id.trim(),
    listenerName: model.listener_name.trim(),
    listenerAvatarUrl: model.listener_avatar_url.trim(),
    durationMinutes: model.duration_minutes,
    status: _statusFromApi(model.status),
    callMode: _callModeFromApi(model.call_mode),
    speechLanguage: model.speech_language.trim(),
    amountPaid: model.amount_paid.toDouble(),
    voiceChangeEnabled: model.voice_change_enabled,
    scheduledAt: model.scheduled_at == null
        ? null
        : DateTime.tryParse(model.scheduled_at!)?.toLocal(),
    isInstant: model.is_instant,
    refundedToBalance: model.refunded_to_balance?.toDouble(),
  );
}

VentorBookedSessionStatusData _statusFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'live' => VentorBookedSessionStatusData.live,
    'completed' => VentorBookedSessionStatusData.completed,
    'cancelled' => VentorBookedSessionStatusData.cancelled,
    _ => VentorBookedSessionStatusData.upcoming,
  };
}

VentorBookedCallModeData _callModeFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'video' => VentorBookedCallModeData.video,
    _ => VentorBookedCallModeData.voice,
  };
}
