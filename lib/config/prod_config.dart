import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/config/venting_env.dart';

class ProdConfig implements AppConfig {
  const ProdConfig();

  @override
  String get baseUrl => const String.fromEnvironment('BASE_URL');

  @override
  VentingEnv get env => VentingEnv.prod;

  // TODO: Replace with real production Terms / Privacy URLs.
  @override
  String get termsOfServiceUrl => 'https://venting.app/terms';

  @override
  String get privacyPolicyUrl => 'https://venting.app/privacy';
}
