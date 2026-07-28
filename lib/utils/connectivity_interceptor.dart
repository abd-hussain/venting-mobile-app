import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection/internet_connection_checkup.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/shared_widgets/bottom_sheets/no_internet_connection_view.dart';
import 'package:venting_mobile_app/shared_widgets/custom_buttomsheet.dart';

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

    _isShowing = false;
    final snapshot = List<(RequestOptions, RequestInterceptorHandler)>.of(
      _pending,
    );
    _pending.clear();
    for (final (options, handler) in snapshot) {
      handler.next(options);
    }

    return true;
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

  static Future<void> showNoInternetPopupIfNeeded() async {
    if (_isShowing) {
      return;
    }

    final navigatorKey = diContainer<GlobalKey<NavigatorState>>();
    final context = navigatorKey.currentContext;

    if (context == null) {
      return;
    }

    _isShowing = true;

    await CustomButtomsheet(
      // ignore: use_build_context_synchronously
      context: context,
    ).show(widget: const NoInternetConnectionView(onRetry: _retryAll));

    // _retryAll resets _isShowing itself. If the dialog was dismissed
    // without retry, _isShowing is still true — reject all pending.
    if (_isShowing) {
      _isShowing = false;
      final snapshot = List<(RequestOptions, RequestInterceptorHandler)>.of(
        _pending,
      );
      _pending.clear();
      _rejectAll(snapshot);
    }
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
