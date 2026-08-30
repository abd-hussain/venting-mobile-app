import 'package:injectable/injectable.dart';
import 'package:venting_mobile_app/di/venting_module_extensions/venting_module_blocs.dart';
import 'package:venting_mobile_app/di/venting_module_extensions/venting_module_infrastructure.dart';
import 'package:venting_mobile_app/di/venting_module_extensions/venting_module_repositories.dart';
import 'package:venting_mobile_app/di/venting_module_extensions/venting_module_usecases.dart';

@module
abstract class VentingModule {
  const VentingModule();
}

/// Main implementation of VentingModule
/// Uses mixins to organize methods by category:
/// - Infrastructure: Core setup (preferences, network, API clients)
/// - Repositories: Data layer factories
/// - Usecases: Business logic factories
/// - Blocs: Presentation layer factories
class VentingModuleImpl extends VentingModule
    with
        VentingModuleInfrastructure,
        VentingModuleRepositories,
        VentingModuleUsecases,
        VentingModuleBlocs {
  const VentingModuleImpl();
}
