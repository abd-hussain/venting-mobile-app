import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/config/venting_env.dart';

class DevConfig implements AppConfig {
  const DevConfig();

  @override
  String get baseUrl => const String.fromEnvironment('BASE_URL');

  @override
  VentingEnv get env => VentingEnv.dev;
}
