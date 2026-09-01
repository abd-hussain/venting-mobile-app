import 'package:venting_mobile_app/domain/data/api/listener_notification_preferences_response_model.dart';

class ListenerNotificationPreferences {
  const ListenerNotificationPreferences({
    this.pushEnabled = true,
    this.newSessionRequests = true,
    this.sessionReminder15Min = true,
    this.sessionReminder10Min = true,
    this.sessionReminder5Min = true,
    this.reviewsFeedback = true,
    this.tipsEarnings = true,
    this.promotionsUpdates = false,
    this.emailEnabled = true,
  });

  final bool pushEnabled;
  final bool newSessionRequests;
  final bool sessionReminder15Min;
  final bool sessionReminder10Min;
  final bool sessionReminder5Min;
  final bool reviewsFeedback;
  final bool tipsEarnings;
  final bool promotionsUpdates;
  final bool emailEnabled;

  ListenerNotificationPreferences copyWith({
    bool? pushEnabled,
    bool? newSessionRequests,
    bool? sessionReminder15Min,
    bool? sessionReminder10Min,
    bool? sessionReminder5Min,
    bool? reviewsFeedback,
    bool? tipsEarnings,
    bool? promotionsUpdates,
    bool? emailEnabled,
  }) {
    return ListenerNotificationPreferences(
      pushEnabled: pushEnabled ?? this.pushEnabled,
      newSessionRequests: newSessionRequests ?? this.newSessionRequests,
      sessionReminder15Min: sessionReminder15Min ?? this.sessionReminder15Min,
      sessionReminder10Min: sessionReminder10Min ?? this.sessionReminder10Min,
      sessionReminder5Min: sessionReminder5Min ?? this.sessionReminder5Min,
      reviewsFeedback: reviewsFeedback ?? this.reviewsFeedback,
      tipsEarnings: tipsEarnings ?? this.tipsEarnings,
      promotionsUpdates: promotionsUpdates ?? this.promotionsUpdates,
      emailEnabled: emailEnabled ?? this.emailEnabled,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListenerNotificationPreferences &&
        other.pushEnabled == pushEnabled &&
        other.newSessionRequests == newSessionRequests &&
        other.sessionReminder15Min == sessionReminder15Min &&
        other.sessionReminder10Min == sessionReminder10Min &&
        other.sessionReminder5Min == sessionReminder5Min &&
        other.reviewsFeedback == reviewsFeedback &&
        other.tipsEarnings == tipsEarnings &&
        other.promotionsUpdates == promotionsUpdates &&
        other.emailEnabled == emailEnabled;
  }

  @override
  int get hashCode => Object.hash(
    pushEnabled,
    newSessionRequests,
    sessionReminder15Min,
    sessionReminder10Min,
    sessionReminder5Min,
    reviewsFeedback,
    tipsEarnings,
    promotionsUpdates,
    emailEnabled,
  );
}

ListenerNotificationPreferences listenerNotificationPreferencesFromApi(
  ListenerNotificationPreferencesData data,
) {
  return ListenerNotificationPreferences(
    pushEnabled: data.push_enabled,
    newSessionRequests: data.new_session_requests,
    sessionReminder15Min: data.session_reminder_15_min,
    sessionReminder10Min: data.session_reminder_10_min,
    sessionReminder5Min: data.session_reminder_5_min,
    reviewsFeedback: data.reviews_feedback,
    tipsEarnings: data.tips_earnings,
    promotionsUpdates: data.promotions_updates,
    emailEnabled: data.email_enabled,
  );
}

Map<String, dynamic> listenerNotificationPreferencesToApiBody(
  ListenerNotificationPreferences preferences,
) {
  return {
    'push_enabled': preferences.pushEnabled,
    'new_session_requests': preferences.newSessionRequests,
    'session_reminder_15_min': preferences.sessionReminder15Min,
    'session_reminder_10_min': preferences.sessionReminder10Min,
    'session_reminder_5_min': preferences.sessionReminder5Min,
    'reviews_feedback': preferences.reviewsFeedback,
    'tips_earnings': preferences.tipsEarnings,
    'promotions_updates': preferences.promotionsUpdates,
    'email_enabled': preferences.emailEnabled,
  };
}
