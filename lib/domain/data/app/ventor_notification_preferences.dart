import 'package:venting_mobile_app/domain/data/api/ventor_notification_preferences_response_model.dart';

class VentorNotificationPreferences {
  const VentorNotificationPreferences({
    this.pushEnabled = true,
    this.sessionReminder30Min = true,
    this.sessionReminder15Min = true,
    this.sessionReminder10Min = true,
    this.sessionReminder5Min = true,
    this.rewardsUpdates = true,
    this.promotionsUpdates = true,
    this.emailEnabled = true,
  });

  final bool pushEnabled;
  final bool sessionReminder30Min;
  final bool sessionReminder15Min;
  final bool sessionReminder10Min;
  final bool sessionReminder5Min;
  final bool rewardsUpdates;
  final bool promotionsUpdates;
  final bool emailEnabled;

  VentorNotificationPreferences copyWith({
    bool? pushEnabled,
    bool? sessionReminder30Min,
    bool? sessionReminder15Min,
    bool? sessionReminder10Min,
    bool? sessionReminder5Min,
    bool? rewardsUpdates,
    bool? promotionsUpdates,
    bool? emailEnabled,
  }) {
    return VentorNotificationPreferences(
      pushEnabled: pushEnabled ?? this.pushEnabled,
      sessionReminder30Min: sessionReminder30Min ?? this.sessionReminder30Min,
      sessionReminder15Min: sessionReminder15Min ?? this.sessionReminder15Min,
      sessionReminder10Min: sessionReminder10Min ?? this.sessionReminder10Min,
      sessionReminder5Min: sessionReminder5Min ?? this.sessionReminder5Min,
      rewardsUpdates: rewardsUpdates ?? this.rewardsUpdates,
      promotionsUpdates: promotionsUpdates ?? this.promotionsUpdates,
      emailEnabled: emailEnabled ?? this.emailEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VentorNotificationPreferences &&
        other.pushEnabled == pushEnabled &&
        other.sessionReminder30Min == sessionReminder30Min &&
        other.sessionReminder15Min == sessionReminder15Min &&
        other.sessionReminder10Min == sessionReminder10Min &&
        other.sessionReminder5Min == sessionReminder5Min &&
        other.rewardsUpdates == rewardsUpdates &&
        other.promotionsUpdates == promotionsUpdates &&
        other.emailEnabled == emailEnabled;
  }

  @override
  int get hashCode => Object.hash(
    pushEnabled,
    sessionReminder30Min,
    sessionReminder15Min,
    sessionReminder10Min,
    sessionReminder5Min,
    rewardsUpdates,
    promotionsUpdates,
    emailEnabled,
  );
}

VentorNotificationPreferences ventorNotificationPreferencesFromApi(
  VentorNotificationPreferencesData data,
) {
  return VentorNotificationPreferences(
    pushEnabled: data.push_enabled,
    sessionReminder30Min: data.session_reminder_30_min,
    sessionReminder15Min: data.session_reminder_15_min,
    sessionReminder10Min: data.session_reminder_10_min,
    sessionReminder5Min: data.session_reminder_5_min,
    rewardsUpdates: data.rewards_updates,
    promotionsUpdates: data.promotions_updates,
    emailEnabled: data.email_enabled,
  );
}

Map<String, dynamic> ventorNotificationPreferencesToApiBody(
  VentorNotificationPreferences preferences,
) {
  return {
    'push_enabled': preferences.pushEnabled,
    'session_reminder_30_min': preferences.sessionReminder30Min,
    'session_reminder_15_min': preferences.sessionReminder15Min,
    'session_reminder_10_min': preferences.sessionReminder10Min,
    'session_reminder_5_min': preferences.sessionReminder5Min,
    'rewards_updates': preferences.rewardsUpdates,
    'promotions_updates': preferences.promotionsUpdates,
    'email_enabled': preferences.emailEnabled,
  };
}
