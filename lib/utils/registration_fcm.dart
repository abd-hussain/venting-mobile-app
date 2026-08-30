import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venting_mobile_app/domain/data/app/registration_notifications_data.dart';

/// Requests OS notification permission and reads an FCM token when available.
Future<RegistrationNotificationsData> requestRegistrationNotifications() async {
  var notificationsEnabled = false;
  String? fcmToken;

  try {
    if (Platform.isAndroid) {
      final status = await Permission.notification.request();
      notificationsEnabled = status.isGranted || status.isLimited;
    }

    final settings = await FirebaseMessaging.instance.requestPermission();
    notificationsEnabled =
        notificationsEnabled ||
        settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;

    fcmToken = await _readFcmToken();
  } catch (_) {
    notificationsEnabled = false;
    fcmToken = null;
  }

  return RegistrationNotificationsData(
    notificationsEnabled: notificationsEnabled,
    fcmToken: fcmToken,
  );
}

/// Uses [existing] when non-empty; otherwise tries to read a device FCM token.
Future<String?> resolveRegistrationFcmToken([String? existing]) async {
  final trimmed = existing?.trim();
  if (trimmed != null && trimmed.isNotEmpty) return trimmed;
  return _readFcmToken();
}

Future<String?> _readFcmToken() async {
  try {
    final token = await FirebaseMessaging.instance.getToken();
    final trimmed = token?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    return trimmed;
  } catch (_) {
    return null;
  }
}
