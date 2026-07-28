import 'package:get_it/get_it.dart';
import 'package:venting_mobile_app/di/venting_module.dart';

/// Repositories mixin for ZainModule
/// Handles all repository factory methods
mixin VentingModuleRepositories on VentingModule {
  /// Registers all repository dependencies
  void registerRepositories(GetIt getIt) {}
}
