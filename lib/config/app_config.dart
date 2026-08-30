import 'package:venting_mobile_app/config/venting_env.dart';

abstract interface class AppConfig {
  String get baseUrl;
  VentingEnv get env;

  /// Base URL for static legal/help HTML (same host for dev + prod).
  String get webContentBaseUrl;

  /// Web OAuth client ID — preferred `aud` / serverClientId for ID tokens.
  String get googleWebClientId;

  /// iOS OAuth client ID for this flavor.
  String get googleIosClientId;

  /// Android OAuth client ID for this flavor (SHA-1 + package).
  String get googleAndroidClientId;

  /// Support inbox shown in Help & Support and `mailto:` links.
  String get supportEmail;

  /// Digits-only WhatsApp number for `wa.me` links (no `+`).
  String get supportWhatsAppNumber;
}
