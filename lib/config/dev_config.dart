import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/config/venting_env.dart';

class DevConfig implements AppConfig {
  const DevConfig();

  @override
  String get baseUrl => const String.fromEnvironment('BASE_URL');

  @override
  VentingEnv get env => VentingEnv.dev;

  @override
  String get webContentBaseUrl => 'https://venting-3a5ebaed4621.herokuapp.com';

  @override
  String get googleWebClientId =>
      const String.fromEnvironment('GOOGLE_WEB_CLIENT_ID');

  @override
  String get googleIosClientId =>
      const String.fromEnvironment('GOOGLE_IOS_CLIENT_ID');

  @override
  String get googleAndroidClientId =>
      const String.fromEnvironment('GOOGLE_ANDROID_CLIENT_ID');

  @override
  String get supportEmail => 'support@venting.app';

  @override
  String get supportWhatsAppNumber => '962700000000';
}
