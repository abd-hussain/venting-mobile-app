import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection/internet_connection_checkup.dart';
import 'package:network_logging/network_logging.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/di/di_initializer.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/utils/connectivity_interceptor.dart';
import 'package:venting_mobile_app/utils/custom_bloc_observer.dart';
import 'package:venting_mobile_app/utils/custom_venting_localization_delegate.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

Future<void> runMainApp(GetIt getIt, AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Use bundled assets/google_fonts — avoid runtime fetches (offline / DNS failures).
  GoogleFonts.config.allowRuntimeFetching = false;

  Bloc.observer = CustomBlocObserver();

  await configureDependencies(diContainer, env: config.env.name);

  final preferences = diContainer<VentingPreferences>();
  await VentingMobLocalizationsHolder.ensureDefaultLanguageSaved(preferences);
  VentingMobLocalizationsHolder.syncFromPreferences(preferences);
  await VentingMobLocalizationsHolder.warm();

  // SplashScreen applies immersive UI first; edge-to-edge is restored on splash dispose.

  //Mark: - Enable Device Preview From Here
  //runApp(DevicePreview(builder: (context) => ZainApp(config: config)));
  runApp(VentingApp(config: config));
}

class VentingApp extends StatefulWidget {
  final AppConfig config;

  const VentingApp({super.key, required this.config});

  @override
  State<VentingApp> createState() => VentingAppState();

  static VentingAppState? of(BuildContext context) {
    return context.findAncestorStateOfType<VentingAppState>();
  }
}

class VentingAppState extends State<VentingApp> with WidgetsBindingObserver {
  bool _overlayAdded = false;
  StreamSubscription<Uri>? _appLinksSubscription;
  StreamSubscription<bool>? _networkStateSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    unawaited(_setDefaultLanguage());
    _initializeNetworkMonitoring();
  }

  void _initializeNetworkMonitoring() {
    NetworkUseCase.initialize();
    _networkStateSubscription = NetworkUseCase.networkStateStream.listen((
      hasInternet,
    ) {
      if (!hasInternet) {
        unawaited(ConnectivityInterceptor.showNoInternetPopupIfNeeded());
      }
    });
    // Catch already-offline launches — the stream only emits on changes.
    unawaited(_showOfflineGateIfNeeded());
  }

  Future<void> _showOfflineGateIfNeeded() async {
    final hasInternet = await NetworkUseCase.checkInternetConnection();
    if (!hasInternet) {
      await ConnectivityInterceptor.showNoInternetPopupIfNeeded();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _networkStateSubscription?.cancel();
    _appLinksSubscription?.cancel();
    super.dispose();
  }

  void rebuild() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // Prefer the saved preference; fall back to the device language when unset.
    final selectedLanguageCode = diContainer<VentingPreferences>().getValue(
      SavedConstants.selectedLanguageCode,
      "",
    );

    final effectiveLanguageCode = selectedLanguageCode.isNotEmpty
        ? selectedLanguageCode
        : VentingMobLocalizationsHolder.resolveDeviceLanguageCode();

    VentingMobLocalizationsHolder.syncCurrentLanguage(effectiveLanguageCode);

    return OverlaySupport.global(
      child: Builder(
        builder: (context) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: TextScaler.noScaling),
            child: MaterialApp.router(
              // debugShowCheckedModeBanner: true,
              scaffoldMessengerKey:
                  diContainer<GlobalKey<ScaffoldMessengerState>>(),
              supportedLocales: _supportedLocales(),
              localizationsDelegates: _localizationDelegates(
                effectiveLanguageCode,
              ),
              locale: _getLocale(effectiveLanguageCode),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: Brightness.dark,
                scaffoldBackgroundColor: const Color(0xFF0A0614),
                canvasColor: const Color(0xFF0A0614),
                colorScheme: const ColorScheme.dark(surface: Color(0xFF0A0614)),
              ),
              builder: (context, child) {
                // Add debug overlay after first build
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _addDebugLoggerOverlay();
                });

                return ColoredBox(
                  color: const Color(0xFF0A0614),
                  child: Directionality(
                    textDirection: _getTextDirection(effectiveLanguageCode),
                    child: child ?? const SizedBox.shrink(),
                  ),
                );
              },
              routerConfig: VentingRouterConfig.router,
            ),
          );
        },
      ),
    );
  }

  List<Locale> _supportedLocales() => VentingMobLocalizations.supportedLocales;

  List<LocalizationsDelegate<dynamic>> _localizationDelegates(
    String currentLanguage,
  ) {
    return [
      CustomVentingMobLocalizationsDelegate(currentLanguage: currentLanguage),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  Locale _getLocale(String currentLanguage) {
    switch (currentLanguage) {
      case "ar":
        return const Locale("ar");
      case "en":
      default:
        return const Locale("en");
    }
  }

  TextDirection _getTextDirection(String currentLanguage) {
    return currentLanguage == "ar" ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Adds debug FAB overlay using Navigator's overlay
  void _addDebugLoggerOverlay() {
    // Prevent adding overlay multiple times
    if (_overlayAdded) {
      return;
    }

    final navigatorKey = diContainer<GlobalKey<NavigatorState>>();
    final overlay = navigatorKey.currentState?.overlay;

    if (overlay != null) {
      // Get the context from the navigator which has MaterialLocalizations
      final navigatorContext = navigatorKey.currentContext;

      if (navigatorContext != null) {
        final NetworkLogManager networkLogManager =
            diContainer<NetworkLogManager>();

        final logTrackerWidget = networkLogManager.logTrackerWidget(
          navigatorContext,
        );

        if (logTrackerWidget != null) {
          final overlayEntry = OverlayEntry(
            builder: (context) => logTrackerWidget,
          );
          overlay.insert(overlayEntry);
          _overlayAdded = true;
        }
      }
    }
  }

  Future<void> _setDefaultLanguage() async {
    final prefs = diContainer<VentingPreferences>();
    await VentingMobLocalizationsHolder.ensureDefaultLanguageSaved(prefs);
    VentingMobLocalizationsHolder.syncFromPreferences(prefs);
  }
}
