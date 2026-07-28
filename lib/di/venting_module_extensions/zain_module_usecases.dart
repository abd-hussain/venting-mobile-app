import 'package:get_it/get_it.dart';

import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/venting_module.dart';

/// Usecases mixin for ZainModule
/// Handles all usecase factory methods
mixin VentingModuleUsecases on VentingModule {
  /// Registers all usecase dependencies
  void registerUsecases(GetIt getIt, AppConfig appConfig) {}
}
