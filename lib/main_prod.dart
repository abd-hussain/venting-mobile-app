import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/config/prod_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/venting_app.dart';

Future<void> main() async {
  const config = ProdConfig();
  LoggerManagerBase.logInfo(message: 'Application Started In Prod Mode...');
  diContainer.registerSingleton<AppConfig>(config);
  await runMainApp(diContainer, config);
}
