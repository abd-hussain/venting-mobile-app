import 'package:venting_mobile_app/domain/data/api/listener_sessions_response_model.dart';

enum ListenerSessionHistoryOutcome { accepted, declined }

class ListenerSession {
  const ListenerSession({
    required this.id,
    required this.scheduledAt,
    required this.durationMinutes,
    required this.ventorName,
    required this.message,
    required this.chosenReason,
    required this.tags,
    this.ventorAvatarUrl,
    this.speechLanguage,
    this.isWaiting = false,
    this.canJoinNow = false,
    this.isVideoCall = false,
    this.ventorRating = 0,
    this.statusLabel,
    this.sessionCost,
    this.isMissed = false,
    this.historyOutcome,
  });

  final String id;
  final DateTime scheduledAt;
  final int durationMinutes;
  final String ventorName;
  final String? ventorAvatarUrl;
  final String message;
  final String chosenReason;
  final List<String> tags;
  final String? speechLanguage;
  final bool isWaiting;
  final bool canJoinNow;
  final bool isVideoCall;
  final double ventorRating;
  final String? statusLabel;
  final double? sessionCost;
  final bool isMissed;
  final ListenerSessionHistoryOutcome? historyOutcome;

  double get penaltyAmount => sessionCost == null ? 0 : sessionCost! * 0.2;
}

class ListenerSessionRequest {
  const ListenerSessionRequest({
    required this.id,
    required this.ventorName,
    required this.message,
    required this.chosenReason,
    required this.scheduledAt,
    required this.durationMinutes,
    required this.tags,
    required this.receivedAt,
    required this.speechLanguage,
    this.ventorAvatarUrl,
    this.isVideoCall = false,
    this.ventorRating = 0,
  });

  final String id;
  final String ventorName;
  final String? ventorAvatarUrl;
  final String message;
  final String chosenReason;
  final DateTime scheduledAt;
  final int durationMinutes;
  final List<String> tags;
  final DateTime receivedAt;
  final String speechLanguage;
  final bool isVideoCall;
  final double ventorRating;
}

class ListenerSessionStats {
  const ListenerSessionStats({
    required this.acceptedCount,
    required this.declinedCount,
    required this.missedCount,
  });

  final int acceptedCount;
  final int declinedCount;
  final int missedCount;

  int get total => acceptedCount + declinedCount + missedCount;

  int get acceptedPercent =>
      total == 0 ? 0 : ((acceptedCount * 100) / total).round();

  int get declinedPercent =>
      total == 0 ? 0 : ((declinedCount * 100) / total).round();

  int get missedPercent =>
      total == 0 ? 0 : ((missedCount * 100) / total).round();
}

class ListenerSessionsOverview {
  const ListenerSessionsOverview({
    required this.stats,
    required this.requests,
    required this.upcomingSessions,
    required this.missedSessions,
    required this.historySessions,
  });

  final ListenerSessionStats stats;
  final List<ListenerSessionRequest> requests;
  final List<ListenerSession> upcomingSessions;
  final List<ListenerSession> missedSessions;
  final List<ListenerSession> historySessions;
}

enum ListenerSessionRequestAcceptStatus { accepted, alreadyTaken }

class AcceptListenerSessionRequestResult {
  const AcceptListenerSessionRequestResult({
    required this.status,
    this.sessionId,
  });

  final ListenerSessionRequestAcceptStatus status;
  final String? sessionId;
}

ListenerSessionsOverview listenerSessionsOverviewFromApi({
  required ListenerSessionStatsData stats,
  required ListenerSessionRequestsData requests,
  required ListenerSessionsListData upcoming,
  required ListenerSessionsListData missed,
  required ListenerSessionsListData history,
}) {
  return ListenerSessionsOverview(
    stats: listenerSessionStatsFromApi(stats),
    requests: [
      for (final item in requests.items) listenerSessionRequestFromApi(item),
    ],
    upcomingSessions: [
      for (final item in upcoming.items) listenerSessionFromApi(item),
    ],
    missedSessions: [
      for (final item in missed.items) listenerSessionFromApi(item),
    ],
    historySessions: [
      for (final item in history.items) listenerSessionFromApi(item),
    ],
  );
}

ListenerSessionStats listenerSessionStatsFromApi(
  ListenerSessionStatsData data,
) {
  return ListenerSessionStats(
    acceptedCount: data.accepted_count,
    declinedCount: data.declined_count,
    missedCount: data.missed_count,
  );
}

ListenerSession listenerSessionFromApi(ListenerSessionModel model) {
  return ListenerSession(
    id: model.id,
    scheduledAt:
        DateTime.tryParse(model.scheduled_at)?.toLocal() ?? DateTime.now(),
    durationMinutes: model.duration_minutes,
    ventorName: model.ventor_name.trim(),
    ventorAvatarUrl: model.ventor_avatar_url?.trim().isNotEmpty == true
        ? model.ventor_avatar_url!.trim()
        : null,
    message: model.message.trim(),
    chosenReason: model.chosen_reason.trim(),
    tags: [
      for (final tag in model.tags)
        if (tag.trim().isNotEmpty) tag.trim(),
    ],
    speechLanguage: model.speech_language?.trim().isNotEmpty == true
        ? model.speech_language!.trim()
        : null,
    isWaiting: model.is_waiting,
    canJoinNow: model.can_join_now,
    isVideoCall: model.is_video_call,
    ventorRating: model.ventor_rating.toDouble(),
    statusLabel: model.status_label?.trim().isNotEmpty == true
        ? model.status_label!.trim()
        : null,
    sessionCost: model.session_cost?.toDouble(),
    isMissed: model.is_missed,
    historyOutcome: _historyOutcomeFromApi(model.history_outcome),
  );
}

ListenerSessionRequest listenerSessionRequestFromApi(
  ListenerSessionRequestModel model,
) {
  return ListenerSessionRequest(
    id: model.id,
    ventorName: model.ventor_name.trim(),
    ventorAvatarUrl: model.ventor_avatar_url?.trim().isNotEmpty == true
        ? model.ventor_avatar_url!.trim()
        : null,
    message: model.message.trim(),
    chosenReason: model.chosen_reason.trim(),
    scheduledAt:
        DateTime.tryParse(model.scheduled_at)?.toLocal() ?? DateTime.now(),
    durationMinutes: model.duration_minutes,
    tags: [
      for (final tag in model.tags)
        if (tag.trim().isNotEmpty) tag.trim(),
    ],
    receivedAt:
        DateTime.tryParse(model.received_at)?.toLocal() ?? DateTime.now(),
    speechLanguage: model.speech_language?.trim().isNotEmpty == true
        ? model.speech_language!.trim()
        : '',
    isVideoCall: model.is_video_call,
    ventorRating: model.ventor_rating.toDouble(),
  );
}

AcceptListenerSessionRequestResult acceptListenerSessionRequestFromApi(
  ListenerAcceptSessionRequestData data,
) {
  final status = switch (data.status.trim().toLowerCase()) {
    'already_taken' => ListenerSessionRequestAcceptStatus.alreadyTaken,
    _ => ListenerSessionRequestAcceptStatus.accepted,
  };

  return AcceptListenerSessionRequestResult(
    status: status,
    sessionId: data.session_id.trim().isNotEmpty
        ? data.session_id.trim()
        : null,
  );
}

ListenerSessionHistoryOutcome? _historyOutcomeFromApi(String? raw) {
  return switch (raw?.trim().toLowerCase()) {
    'accepted' => ListenerSessionHistoryOutcome.accepted,
    'declined' => ListenerSessionHistoryOutcome.declined,
    _ => null,
  };
}
