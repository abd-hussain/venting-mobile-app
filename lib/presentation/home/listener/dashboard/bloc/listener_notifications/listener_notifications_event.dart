part of 'listener_notifications_bloc.dart';

@freezed
sealed class ListenerNotificationsEvent with _$ListenerNotificationsEvent {
  const factory ListenerNotificationsEvent.started() = _Started;

  const factory ListenerNotificationsEvent.retryLoad() = _RetryLoad;

  const factory ListenerNotificationsEvent.unreadOnlyFilterChanged({
    required bool unreadOnly,
  }) = _UnreadOnlyFilterChanged;

  const factory ListenerNotificationsEvent.markAllAsReadRequested() =
      _MarkAllAsReadRequested;

  const factory ListenerNotificationsEvent.notificationTapped({
    required String notificationId,
  }) = _NotificationTapped;

  const factory ListenerNotificationsEvent.deleteRequested({
    required String notificationId,
  }) = _DeleteRequested;
}
