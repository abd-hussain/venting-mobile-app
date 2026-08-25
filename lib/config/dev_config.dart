import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/config/venting_env.dart';

class DevConfig implements AppConfig {
  const DevConfig();

  @override
  String get baseUrl => const String.fromEnvironment('BASE_URL');

  @override
  VentingEnv get env => VentingEnv.dev;

  // TODO: Replace with real dev Terms / Privacy URLs.
  @override
  String get termsOfServiceUrl => 'https://dev.venting.app/terms';

  @override
  String get privacyPolicyUrl => 'https://dev.venting.app/privacy';

  // TODO: Replace with real listener help center URLs.
  @override
  String get helpCenterBaseUrl => 'https://dev.venting.app/help';

  @override
  String get googleWebClientId =>
      const String.fromEnvironment('GOOGLE_WEB_CLIENT_ID');

  @override
  String get googleIosClientId =>
      const String.fromEnvironment('GOOGLE_IOS_CLIENT_ID');

  @override
  String get googleAndroidClientId =>
      const String.fromEnvironment('GOOGLE_ANDROID_CLIENT_ID');
}
