import 'package:venting_mobile_app/domain/data/api/listener_dashboard_response_model.dart';

class ListenerDashboardReminder {
  const ListenerDashboardReminder({required this.title, required this.message});

  final String title;
  final String message;

  bool get hasContent => title.trim().isNotEmpty || message.trim().isNotEmpty;
}

class ListenerDashboard {
  const ListenerDashboard({this.reminder});

  final ListenerDashboardReminder? reminder;
}

ListenerDashboard listenerDashboardFromApi(ListenerDashboardData data) {
  final reminder = data.reminder;
  if (reminder == null) return const ListenerDashboard();

  final title = reminder.title.trim();
  final message = reminder.message.trim();
  if (title.isEmpty && message.isEmpty) return const ListenerDashboard();

  return ListenerDashboard(
    reminder: ListenerDashboardReminder(title: title, message: message),
  );
}
