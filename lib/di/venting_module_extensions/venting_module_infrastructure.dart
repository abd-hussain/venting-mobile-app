import 'package:api_client/api_client.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection/internet_connection_checkup.dart';
import 'package:network_logging/network_logging.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/venting_module.dart';
import 'package:venting_mobile_app/utils/auth_refresh_interceptor.dart';
import 'package:venting_mobile_app/utils/connectivity_interceptor.dart';
import 'package:venting_mobile_app/utils/device_info_provider.dart';

/// Infrastructure mixin for VentingModule
/// Handles setup of core infrastructure components like preferences, network, and API clients
mixin VentingModuleInfrastructure on VentingModule {
  @lazySingleton
  @preResolve
  Future<VentingPreferences> sharedPreferences() => MainPreferences.create();

  @Named('environment')
  @singleton
  String environment(AppConfig config) => config.env.name;

  @lazySingleton
  NetworkLogManager networkLogManager(AppConfig appConfig) =>
      NetworkLogManagerFactory.create(appConfig.env.name);

  @lazySingleton
  @preResolve
  Future<CommonHeadersInterceptor> commonHeadersInterceptor(
    VentingPreferences preferences,
  ) async {
    final deviceInfoProvider = DeviceInfoProvider(preferences);
    final platform = deviceInfoProvider.getPlatform();
    final osVersion = await deviceInfoProvider.getOsVersion();
    final appVersion = await deviceInfoProvider.getAppVersion();
    final installationId = await deviceInfoProvider.getInstallationId();
    final userAgent = await deviceInfoProvider.getUserAgent();
    final networkType = await NetworkUseCase.getNetworkType();
    final phoneVersion = await deviceInfoProvider.getPhoneVersion();

    return CommonHeadersInterceptor(
      platform: platform,
      osVersion: osVersion,
      appVersion: appVersion,
      installationId: installationId,
      userAgent: userAgent,
      networkType: networkType,
      phoneVersion: phoneVersion,
      getLanguageCode: deviceInfoProvider.getLanguageCode,
    );
  }

  @lazySingleton
  DioBuilder dioBuilder(
    AppConfig config,
    NetworkLogManager networkLogManager,
    CommonHeadersInterceptor commonHeadersInterceptor,
  ) => DioBuilder()
      .setBaseUrl(config.baseUrl)
      .addInterceptor(commonHeadersInterceptor)
      .addInterceptor(const ConnectivityInterceptor())
      .addInterceptor(networkLogManager.httpInterceptor())
      .addInterceptor(const VpnHintInterceptor())
      .addInterceptor(const CurlInterceptor())
      .withNativeAdapter()
      .withReporter();

  @lazySingleton
  ApiClientBase apiClient(DioBuilder diobuilder) {
    final dio = diobuilder.build();
    dio.interceptors.add(AuthRefreshInterceptor(dio));
    return DioApiClient(dio);
  }

  @Named('mobileBffDioBuilder')
  @lazySingleton
  DioBuilder mobileBffDioBuilder(
    AppConfig config,
    CurlInterceptor curlInterceptor,
    NetworkLogManager networkLogManager,
    CommonHeadersInterceptor commonHeadersInterceptor,
  ) => DioBuilder()
      .setBaseUrl(config.baseUrl)
      .addInterceptor(commonHeadersInterceptor)
      .addInterceptor(const ConnectivityInterceptor())
      .addInterceptor(networkLogManager.httpInterceptor())
      .addInterceptor(const VpnHintInterceptor())
      .addInterceptor(curlInterceptor)
      .withNativeAdapter()
      .withReporter();

  @Named('mobileBffApiClient')
  @lazySingleton
  ApiClientBase mobileBffApiClient(
    @Named('mobileBffDioBuilder') DioBuilder diobuilder,
  ) {
    final dio = diobuilder.build();
    dio.interceptors.add(AuthRefreshInterceptor(dio));
    return DioApiClient(dio);
  }

  /// Registers initial setup components (preferences, global keys, VPN handler)
  Future<void> registerInitialSetup(GetIt getIt) async {
    // Pre-resolve VentingPreferences since it's marked with @preResolve
    final ventingPreferences = await sharedPreferences();
    getIt.registerSingleton<VentingPreferences>(ventingPreferences);

    // Register GlobalKey for Navigator
    getIt.registerLazySingleton<GlobalKey<NavigatorState>>(
      GlobalKey<NavigatorState>.new,
    );

    // Register GlobalKey for ScaffoldMessenger to show global SnackBars/Toasts
    final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
    getIt.registerLazySingleton<GlobalKey<ScaffoldMessengerState>>(
      () => scaffoldMessengerKey,
    );

    // Set VPN toast to use the global ScaffoldMessenger key
    VpnToast.setScaffoldMessengerKey(scaffoldMessengerKey);
  }

  /// Registers infrastructure components (network, API clients, interceptors)
  Future<void> registerInfrastructure(GetIt getIt, AppConfig appConfig) async {
    // Register NetworkLogManager first since DioBuilder depends on it
    getIt.registerLazySingleton<NetworkLogManager>(
      () => networkLogManager(appConfig),
    );

    // Register CommonHeadersInterceptor (pre-resolve since it's async)
    final headersInterceptor = await commonHeadersInterceptor(
      getIt<VentingPreferences>(),
    );
    getIt.registerSingleton<CommonHeadersInterceptor>(headersInterceptor);

    // Register DioBuilder
    getIt.registerLazySingleton<DioBuilder>(
      () => dioBuilder(
        appConfig,
        getIt<NetworkLogManager>(),
        getIt<CommonHeadersInterceptor>(),
      ),
    );

    // Register ApiClientBase
    getIt.registerLazySingleton<ApiClientBase>(
      () => apiClient(getIt<DioBuilder>()),
    );

    // Register DeviceInfoProvider
    getIt.registerLazySingleton<DeviceInfoProvider>(
      () => DeviceInfoProvider(getIt<VentingPreferences>()),
    );
  }
}
