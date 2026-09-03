import 'package:venting_mobile_app/domain/data/api/listener_dashboard_response_model.dart';
import 'package:venting_mobile_app/utils/api_asset_url.dart';

class ListenerDashboardReminder {
  const ListenerDashboardReminder({required this.title, required this.message});

  final String title;
  final String message;

  bool get hasContent => title.trim().isNotEmpty || message.trim().isNotEmpty;
}

class ListenerDashboardUpcomingSession {
  const ListenerDashboardUpcomingSession({
    required this.id,
    required this.ventorName,
    required this.whenLabel,
    required this.durationMinutes,
    this.ventorAvatarUrl,
  });

  final String id;
  final String ventorName;
  final String whenLabel;
  final int durationMinutes;
  final String? ventorAvatarUrl;
}

class ListenerDashboard {
  const ListenerDashboard({
    this.isOnline = false,
    this.reminder,
    this.nextUpcomingSession,
  });

  final bool isOnline;
  final ListenerDashboardReminder? reminder;
  final ListenerDashboardUpcomingSession? nextUpcomingSession;
}

ListenerDashboard listenerDashboardFromApi(
  ListenerDashboardData data, {
  required String apiBaseUrl,
}) {
  return ListenerDashboard(
    isOnline: data.is_online,
    reminder: _reminderFromApi(data.reminder),
    nextUpcomingSession: _upcomingFromApi(
      data.next_upcoming_session,
      apiBaseUrl: apiBaseUrl,
    ),
  );
}

ListenerDashboardReminder? _reminderFromApi(
  ListenerDashboardReminderModel? reminder,
) {
  if (reminder == null) return null;

  final title = reminder.title.trim();
  final message = reminder.message.trim();
  if (title.isEmpty && message.isEmpty) return null;

  return ListenerDashboardReminder(title: title, message: message);
}

ListenerDashboardUpcomingSession? _upcomingFromApi(
  ListenerDashboardUpcomingSessionModel? model, {
  required String apiBaseUrl,
}) {
  if (model == null) return null;

  final id = model.id.trim();
  final name = model.ventor_name.trim();
  if (id.isEmpty && name.isEmpty) return null;

  final avatar = model.ventor_avatar_url?.trim() ?? '';
  return ListenerDashboardUpcomingSession(
    id: id,
    ventorName: name.isEmpty ? 'Ventor' : name,
    whenLabel: model.when_label.trim(),
    durationMinutes: model.duration_minutes,
    ventorAvatarUrl: avatar.isEmpty
        ? null
        : resolveApiAssetUrl(avatar, baseUrl: apiBaseUrl),
  );
}
