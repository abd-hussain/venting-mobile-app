part of 'listener_notification_preferences_bloc.dart';

@freezed
sealed class ListenerNotificationPreferencesEvent
    with _$ListenerNotificationPreferencesEvent {
  const factory ListenerNotificationPreferencesEvent.started() = _Started;

  const factory ListenerNotificationPreferencesEvent.saveRequested({
    required ListenerNotificationPreferences preferences,
  }) = _SaveRequested;
}
