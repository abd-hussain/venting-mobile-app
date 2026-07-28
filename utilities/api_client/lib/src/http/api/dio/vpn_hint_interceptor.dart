import 'dart:async';
import 'dart:io';

import 'package:api_client/src/ui/vpn_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class VpnHintInterceptor extends Interceptor {
  const VpnHintInterceptor();

  @visibleForTesting
  static Future<List<InternetAddress>> Function(String host)? debugLookup;

  @visibleForTesting
  static Future<Socket> Function(InternetAddress address, int port)?
  debugSocketConnect;

  @visibleForTesting
  static void resetTestOverrides() {
    debugLookup = null;
    debugSocketConnect = null;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final host = options.uri.host;
    try {
      final result = await (debugLookup != null
          ? debugLookup!(host)
          : InternetAddress.lookup(host).timeout(const Duration(seconds: 1)));
      if (result.isEmpty || result.first.rawAddress.isEmpty) {
        _showVpnToastOnce(options);
        return handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.connectionError,
            error: const SocketException('Host lookup failed'),
          ),
        );
      }

      final int port = options.uri.hasPort
          ? options.uri.port
          : (options.uri.scheme == 'https' ? 443 : 80);
      Socket? socket;
      try {
        socket = await (debugSocketConnect != null
            ? debugSocketConnect!(result.first, port)
            : Socket.connect(
                result.first,
                port,
                timeout: const Duration(milliseconds: 1500),
              ));
      } on Exception {
        _showVpnToastOnce(options);
        return handler.reject(
          DioException(
            requestOptions: options,
            type: DioExceptionType.connectionTimeout,
            error: const SocketException('TCP connect timeout'),
          ),
        );
      } finally {
        try {
          await socket?.close();
        } catch (_) {}
      }
    } on TimeoutException {
      _showVpnToastOnce(options);
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionTimeout,
          error: const SocketException('DNS lookup timeout'),
        ),
      );
    } on SocketException {
      _showVpnToastOnce(options);
      return handler.reject(
        DioException(
          requestOptions: options,
          type: DioExceptionType.connectionError,
          error: const SocketException('Host unreachable'),
        ),
      );
    } catch (_) {}

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (_looksLikeVpnRequired(err)) {
      _showVpnToastOnce(err.requestOptions);
    }
    handler.next(err);
  }

  bool _looksLikeVpnRequired(DioException err) {
    if (err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError) {
      return true;
    }

    final underlying = err.error;
    if (underlying is SocketException || underlying is HandshakeException) {
      return true;
    }

    if (err.type == DioExceptionType.unknown && err.response == null) {
      return true;
    }

    return false;
  }

  void _showVpnToastOnce(RequestOptions options) {
    final alreadyShown = options.extra['vpnToastShown'] == true;
    if (alreadyShown) return;
    options.extra['vpnToastShown'] = true;
    VpnToast.show('Please connect to VPN');
  }
}
