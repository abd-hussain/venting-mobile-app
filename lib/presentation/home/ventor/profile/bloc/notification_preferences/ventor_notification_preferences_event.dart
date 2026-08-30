part of 'ventor_notification_preferences_bloc.dart';

@freezed
sealed class VentorNotificationPreferencesEvent
    with _$VentorNotificationPreferencesEvent {
  const factory VentorNotificationPreferencesEvent.started() = _Started;

  const factory VentorNotificationPreferencesEvent.saveRequested({
    required VentorNotificationPreferences preferences,
  }) = _SaveRequested;
}
