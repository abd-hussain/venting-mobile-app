part of 'ventor_notifications_bloc.dart';

@freezed
sealed class VentorNotificationsEvent with _$VentorNotificationsEvent {
  const factory VentorNotificationsEvent.started() = _Started;

  const factory VentorNotificationsEvent.retryLoad() = _RetryLoad;

  const factory VentorNotificationsEvent.unreadOnlyFilterChanged({
    required bool unreadOnly,
  }) = _UnreadOnlyFilterChanged;

  const factory VentorNotificationsEvent.markAllAsReadRequested() =
      _MarkAllAsReadRequested;

  const factory VentorNotificationsEvent.notificationTapped({
    required String notificationId,
  }) = _NotificationTapped;

  const factory VentorNotificationsEvent.deleteRequested({
    required String notificationId,
  }) = _DeleteRequested;
}
