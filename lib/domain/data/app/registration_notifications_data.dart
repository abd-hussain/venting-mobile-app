/// Optional push notification result for registration submit (`#8` / `#22`).
class RegistrationNotificationsData {
  const RegistrationNotificationsData({
    required this.notificationsEnabled,
    this.fcmToken,
  });

  final bool notificationsEnabled;

  /// `null` when the user denies permission or token fetch fails.
  final String? fcmToken;
}
