import 'package:get_it/get_it.dart';

import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/venting_module.dart';

Future<void> configureDependencies(GetIt getIt, {String? env}) async {
  final ventingModule = const VentingModuleImpl();
  final appConfig = getIt<AppConfig>();

  // Initial setup (preferences, global keys, VPN handler)
  await ventingModule.registerInitialSetup(getIt);

  // Infrastructure (Network, API Clients)
  await ventingModule.registerInfrastructure(getIt, appConfig);

  // Repositories
  ventingModule.registerRepositories(getIt);

  // Usecases
  ventingModule.registerUsecases(getIt, appConfig);

  // Blocs
  ventingModule.registerBlocs(getIt);
}
