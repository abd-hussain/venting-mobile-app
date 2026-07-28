import 'package:get_it/get_it.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/venting_module.dart';
import 'package:venting_mobile_app/presentation/splash/bloc/splash_bloc.dart';

/// Blocs mixin for VentingModule
/// Handles all bloc factory methods
mixin VentingModuleBlocs on VentingModule {
  /// Registers all bloc dependencies
  void registerBlocs(GetIt getIt) {
    getIt.registerFactory<SplashBloc>(
      () => SplashBloc(getIt<VentingPreferences>()),
    );
  }
}
