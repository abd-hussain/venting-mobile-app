import 'package:venting_mobile_app/domain/data/api/listener_notifications_response_model.dart';

enum AppNotificationType {
  welcome,
  completeRegistration,
  bookFirstSession,
  sessionRequest,
  sessionReminder,
  review,
  payout,
  rewards,
  system,
}

enum AppNotificationAction {
  openRegistration,
  bookFirstSession,
  openAvailability,
  openDiscoverListeners,
  openTraining,
  none,
}

class AppNotification {
  const AppNotification({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.createdAt,
    this.isRead = false,
    this.action = AppNotificationAction.none,
    this.nextStep,
  });

  final String id;
  final AppNotificationType type;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool isRead;
  final AppNotificationAction action;
  final String? nextStep;

  AppNotification copyWith({bool? isRead}) {
    return AppNotification(
      id: id,
      type: type,
      title: title,
      body: body,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
      action: action,
      nextStep: nextStep,
    );
  }
}

typedef ListenerNotification = AppNotification;
typedef ListenerNotificationType = AppNotificationType;

AppNotificationType appNotificationTypeFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'welcome' => AppNotificationType.welcome,
    'complete_registration' => AppNotificationType.completeRegistration,
    'book_first_session' => AppNotificationType.bookFirstSession,
    'session_request' => AppNotificationType.sessionRequest,
    'session_reminder' => AppNotificationType.sessionReminder,
    'review' => AppNotificationType.review,
    'payout' => AppNotificationType.payout,
    'rewards' => AppNotificationType.rewards,
    'system' => AppNotificationType.system,
    _ => AppNotificationType.system,
  };
}

AppNotificationAction appNotificationActionFromApi(
  AppNotificationType type,
  Map<String, dynamic> data,
) {
  final action = data['action']?.toString().trim().toLowerCase();
  if (action != null && action.isNotEmpty) {
    return switch (action) {
      'open_registration' => AppNotificationAction.openRegistration,
      'book_first_session' => AppNotificationAction.bookFirstSession,
      'open_availability' => AppNotificationAction.openAvailability,
      'open_discover_listeners' => AppNotificationAction.openDiscoverListeners,
      'open_training' => AppNotificationAction.openTraining,
      _ => AppNotificationAction.none,
    };
  }

  return switch (type) {
    AppNotificationType.welcome => AppNotificationAction.openRegistration,
    AppNotificationType.completeRegistration =>
      AppNotificationAction.openRegistration,
    AppNotificationType.bookFirstSession =>
      AppNotificationAction.bookFirstSession,
    _ => AppNotificationAction.none,
  };
}

AppNotification appNotificationFromApi(ListenerNotificationItemModel item) {
  final data = Map<String, dynamic>.from(item.data);
  final type = appNotificationTypeFromApi(item.type);

  return AppNotification(
    id: item.id,
    type: type,
    title: item.title,
    body: item.body,
    createdAt:
        DateTime.tryParse(item.created_at) ??
        DateTime.fromMillisecondsSinceEpoch(0),
    isRead: item.is_read,
    action: appNotificationActionFromApi(type, data),
    nextStep: data['next_step']?.toString(),
  );
}

List<AppNotification> appNotificationsFromApi(ListenerNotificationsData data) {
  return data.items.map(appNotificationFromApi).toList(growable: false);
}

ListenerNotificationType listenerNotificationTypeFromApi(String raw) =>
    appNotificationTypeFromApi(raw);

ListenerNotification listenerNotificationFromApi(
  ListenerNotificationItemModel item,
) => appNotificationFromApi(item);

List<ListenerNotification> listenerNotificationsFromApi(
  ListenerNotificationsData data,
) => appNotificationsFromApi(data);
