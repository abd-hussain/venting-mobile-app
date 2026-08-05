import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/account_created_screen.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/auth/email_registration_screen.dart';
import 'package:venting_mobile_app/presentation/main_onboarding/main_onboarding_screen.dart';
import 'package:venting_mobile_app/presentation/splash/splash_screen.dart';
import 'package:venting_mobile_app/presentation/ventor_onboarding/ventor_onboarding_screen.dart';
import 'package:venting_mobile_app/presentation/welcome/welcome_screen.dart';

/// Route constants for better maintainability
class AppRoutes {
  static const String initialRoute = '/';
  static const String welcome = '/welcome';
  static const String tabHome = '/tab-home';
  static const String mainOnboarding = '/main-onboarding';
  static const String ventorOnboarding = '/ventor-onboarding';
  static const String authRegister = '/auth-register';
  static const String authLogin = '/auth-login';
  static const String emailRegistration = '/email-registration';
  static const String accountCreated = '/account-created';
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
      GoRoute(
        path: AppRoutes.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.mainOnboarding,
        name: 'main-onboarding',
        builder: (context, state) => const MainOnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.ventorOnboarding,
        name: 'ventor-onboarding',
        builder: (context, state) => const VentorOnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.authRegister,
        name: 'auth-register',
        builder: (context, state) =>
            const AuthScreen(authType: AuthType.register),
      ),
      GoRoute(
        path: AppRoutes.authLogin,
        name: 'auth-login',
        builder: (context, state) => const AuthScreen(authType: AuthType.login),
      ),
      GoRoute(
        path: AppRoutes.emailRegistration,
        name: 'email-registration',
        builder: (context, state) => const EmailRegistrationScreen(),
      ),
      GoRoute(
        path: AppRoutes.accountCreated,
        name: 'account-created',
        builder: (context, state) => const AccountCreatedScreen(),
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
