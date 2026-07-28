import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/splash_screen.dart';

/// Route constants for better maintainability
class AppRoutes {
  static const String initialRoute = '/';
  static const String tabHome = '/tab-home';
  static const String loginOptions = '/login-options';
  static const String fillMobileNumber = '/fill-mobile-number';
  static const String onboarding = '/onboarding';
}

/// Parses `GoRoute` `state.extra` for the OTP authentication block route.
///
/// Supported values:
/// - `(int remainingSeconds, String msisdn)` from `AppRouter.goToOtpAuthenticationBlock`.
/// - `int` legacy soft-lock seconds only (empty msisdn; prefer the record at call sites).
/// - `null` or any other type → `(900, '')`.
@visibleForTesting
(int remainingSeconds, String msisdn) parseOtpAuthenticationBlockExtra(
  Object? extra,
) {
  return switch (extra) {
    (final int seconds, final String phone) => (seconds, phone),
    final int onlySeconds => (onlySeconds, ''),
    null => (900, ''),
    _ => (900, ''),
  };
}

class VentingNavigationObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    String? fullPath;
    String? matchedLocation;
    Map<String, String> pathParams = {};
    Map<String, String> queryParams = {};
    Object? extra;

    final nav = navigator;
    if (nav != null) {
      try {
        final goRouter = GoRouter.maybeOf(nav.context);
        if (goRouter != null) {
          final state = goRouter.state;
          fullPath = state.uri.toString();
          matchedLocation = state.matchedLocation;
          pathParams = Map.from(state.pathParameters);
          queryParams = Map.from(state.uri.queryParameters);
          extra = state.extra;
        }
      } catch (_) {}
    }

    LoggerManagerBase.logInfo(
      message:
          'Navigation: navigating to screen'
          ' | name: ${route.settings.name ?? "unnamed"}'
          ' | path: $fullPath'
          ' | matchedLocation: $matchedLocation'
          ' | pathParams: $pathParams'
          ' | queryParams: $queryParams'
          ' | extra: $extra'
          ' | previousRoute: ${previousRoute?.settings.name ?? "none"}',
    );
  }
}

/// Router configuration for the MyZain app
class VentingRouterConfig {
  static final router = GoRouter(
    navigatorKey: diContainer<GlobalKey<NavigatorState>>(),
    initialLocation: AppRoutes.initialRoute,
    observers: [VentingNavigationObserver()],
    routes: [
      GoRoute(
        path: AppRoutes.initialRoute,
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
    ],
    errorBuilder: (context, state) {
      final l10n = VentingMobLocalizations.of(context);
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                l10n.common_page_not_found_title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                l10n.common_page_not_found_description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => context.go(AppRoutes.initialRoute),
                child: Text(l10n.common_go_home),
              ),
            ],
          ),
        ),
      );
    },
  );
}

/// Navigation helper methods for common navigation patterns
class AppRouter {
  /// Navigate to welcome screen
  static void goToWelcome(BuildContext context) {
    context.go(AppRoutes.initialRoute);
  }

  /// Navigate back to previous screen
  static void goBack<T>(BuildContext context, [T? result]) {
    context.pop(result);
  }

  static void goBackTwiceWithResult<T>(
    BuildContext context, {
    required T result,
  }) {
    final router = GoRouter.of(context);
    router.pop();
    router.pop(result);
  }
}
