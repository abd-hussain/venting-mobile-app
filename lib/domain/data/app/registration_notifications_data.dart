/// Optional push notification result for registration complete (`#8e` / `#22j`).
class RegistrationNotificationsData {
  const RegistrationNotificationsData({
    required this.notificationsEnabled,
    this.fcmToken,
  });

  final bool notificationsEnabled;

  /// `null` when the user denies permission or token fetch fails.
  final String? fcmToken;
}
