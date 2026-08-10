import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection/internet_connection_checkup.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/no_internet_connection_view.dart';

class ConnectivityInterceptor extends Interceptor {
  static bool _isShowing = false;
  static final List<(RequestOptions, RequestInterceptorHandler)> _pending = [];

  const ConnectivityInterceptor();

  static String _localizedNoInternetMessage() {
    final navigatorKey = diContainer<GlobalKey<NavigatorState>>();
    final context = navigatorKey.currentContext;
    if (context != null && context.mounted) {
      return VentingMobLocalizations.of(
        context,
      ).common_no_internet_connection_short;
    }
    return VentingMobLocalizationsHolder
        .current
        .common_no_internet_connection_short;
  }

  static Future<bool> _retryAll() async {
    final hasInternet = await NetworkUseCase.checkInternetConnection();
    if (!hasInternet) {
      return false;
    }

    // Clear the gate flag before the dialog pops so the show() finally
    // block does not treat a successful reconnect as a cancel.
    _isShowing = false;
    _flushPendingRequests();
    return true;
  }

  static void _flushPendingRequests() {
    final snapshot = List<(RequestOptions, RequestInterceptorHandler)>.of(
      _pending,
    );
    _pending.clear();
    for (final (options, handler) in snapshot) {
      handler.next(options);
    }
  }

  static void _rejectAll(
    List<(RequestOptions, RequestInterceptorHandler)> requests,
  ) {
    final message = _localizedNoInternetMessage();
    for (final (opts, h) in requests) {
      h.reject(
        DioException(
          requestOptions: opts,
          type: DioExceptionType.connectionError,
          error: message,
        ),
      );
    }
  }

  /// Shows a non-dismissible full-screen offline gate until connectivity
  /// is restored (via Try Again or automatic reconnect).
  static Future<void> showNoInternetPopupIfNeeded() async {
    if (_isShowing) {
      return;
    }

    final context = await _waitForNavigatorContext();
    if (context == null) {
      return;
    }

    _isShowing = true;

    try {
      await showGeneralDialog<void>(
        // ignore: use_build_context_synchronously
        context: context,
        barrierColor: Colors.transparent,
        transitionDuration: const Duration(milliseconds: 250),
        pageBuilder: (dialogContext, animation, secondaryAnimation) {
          return const NoInternetConnectionView(onRetry: _retryAll);
        },
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: child,
          );
        },
      );
    } finally {
      // Dialog closed without a successful retry (e.g. route replaced).
      // Reject any requests still waiting so handlers don't hang forever.
      if (_isShowing) {
        _isShowing = false;
        final snapshot = List<(RequestOptions, RequestInterceptorHandler)>.of(
          _pending,
        );
        _pending.clear();
        _rejectAll(snapshot);
      }
    }
  }

  static Future<BuildContext?> _waitForNavigatorContext({
    int maxAttempts = 20,
  }) async {
    final navigatorKey = diContainer<GlobalKey<NavigatorState>>();

    for (var attempt = 0; attempt < maxAttempts; attempt++) {
      final context = navigatorKey.currentContext;
      if (context != null && context.mounted) {
        return context;
      }
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }

    return navigatorKey.currentContext;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final hasInternet = await NetworkUseCase.checkInternetConnection();

    if (hasInternet) {
      handler.next(options);
      return;
    }

    // Queue this request while offline. If a popup is already visible, wait.
    _pending.add((options, handler));
    await showNoInternetPopupIfNeeded();
  }
}
