import 'package:venting_mobile_app/config/venting_env.dart';

abstract interface class AppConfig {
  String get baseUrl;
  VentingEnv get env;
  String get termsOfServiceUrl;
  String get privacyPolicyUrl;
}
