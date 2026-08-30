import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/usecase/clear_auth_session_usecase.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

/// Clears the auth session and navigates to welcome when token refresh fails.
class SessionExpiredHandler {
  SessionExpiredHandler._();

  static bool _isHandling = false;

  /// While set, [forceLogoutToWelcome] only clears tokens — no navigation.
  /// Used right after login/register/social so a flaky `/me` cannot bounce
  /// the user back to welcome while the auth flow is still routing.
  static DateTime? _suppressNavigationUntil;

  @visibleForTesting
  static Future<void> Function({Exception? error})? testOverride;

  @visibleForTesting
  static void resetForTest() {
    _isHandling = false;
    _suppressNavigationUntil = null;
    testOverride = null;
  }

  /// Suppress welcome navigation for [duration] after a successful auth.
  static void suppressNavigationFor(Duration duration) {
    _suppressNavigationUntil = DateTime.now().add(duration);
  }

  /// Clears tokens/cache and replaces the stack with welcome.
  static Future<void> forceLogoutToWelcome({Exception? error}) async {
    if (testOverride != null) {
      await testOverride!(error: error);
      return;
    }

    if (_isHandling) {
      return;
    }

    _isHandling = true;
    try {
      final suppressUntil = _suppressNavigationUntil;
      if (suppressUntil != null && DateTime.now().isBefore(suppressUntil)) {
        LoggerManagerBase.logInfo(
          message:
              'SessionExpiredHandler: ignoring force-logout '
              '(post-login grace period)',
        );
        if (error != null) {
          LoggerManagerBase.logErrorMessage(
            error: error,
            message: 'Session error during post-login grace (not logging out)',
          );
        }
        return;
      }

      if (error != null) {
        LoggerManagerBase.logErrorMessage(
          error: error,
          message: 'Session expired — forcing logout to welcome',
        );
      }

      await diContainer<ClearAuthSessionUsecase>()();

      await WidgetsBinding.instance.endOfFrame;

      final navigatorKey = diContainer<GlobalKey<NavigatorState>>();
      final context = navigatorKey.currentContext;
      if (context == null || !context.mounted) {
        return;
      }

      context.go(AppRoutes.welcome);
    } finally {
      _isHandling = false;
    }
  }
}
