import 'dart:async';

import 'package:dio/dio.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/usecase/auth_refresh_token_usecase.dart';
import 'package:venting_mobile_app/utils/jwt_expires.dart';
import 'package:venting_mobile_app/utils/session_expired_handler.dart';

/// Attaches Bearer access tokens and refreshes on 401 / expired JWT.
///
/// Refresh contract (api-usage-guide #3):
/// - `POST /v1/auth/refresh`
/// - Body: `{ "refresh_token": "..." }`
/// - Persists rotated `access_token` / `refresh_token` into secure storage
/// - On refresh failure → clear session and navigate to welcome
class AuthRefreshInterceptor extends Interceptor {
  AuthRefreshInterceptor(this._dio);

  final Dio _dio;

  static const _retriedKey = 'authRefreshRetried';

  /// Unauthenticated auth calls — interceptor must not attach Bearer or refresh.
  static const _unauthenticatedAuthPathFragments = <String>[
    'v1/auth/login',
    'v1/auth/register',
    'v1/auth/social',
    'v1/auth/check-email',
    'v1/auth/forgot-password',
    'v1/auth/reset-password',
    'v1/auth/refresh',
  ];

  /// Authenticated calls where `401` means validation failed (e.g. wrong
  /// current password), not "access token expired". Do not call `#3` refresh.
  static const _noRefreshOn401PathFragments = <String>[
    ..._unauthenticatedAuthPathFragments,
    'v1/auth/change-password',
  ];

  static Future<_RefreshOutcome>? _refreshInFlight;

  static bool _isUnauthenticatedAuthPath(String path) {
    final normalized = path.toLowerCase();
    return _unauthenticatedAuthPathFragments.any(normalized.contains);
  }

  static bool _skipRefreshOn401(String path) {
    final normalized = path.toLowerCase();
    return _noRefreshOn401PathFragments.any(normalized.contains);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isUnauthenticatedAuth = _isUnauthenticatedAuthPath(options.path);
    final prefs = diContainer<VentingPreferences>();
    final accessToken = prefs.getValue(SavedConstants.accessToken, '');

    // Login/register/etc. — no Bearer header, no proactive refresh.
    if (isUnauthenticatedAuth) {
      handler.next(options);
      return;
    }

    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    final alreadyRetried = options.extra[_retriedKey] == true;
    final expiresAt = accessToken.isEmpty
        ? null
        : JwtExpires.readExpires(accessToken);
    // Only proactively refresh when we know the token is past `exp`.
    // Missing/unreadable `exp` must not trigger refresh (breaks fresh logins).
    if (!alreadyRetried &&
        accessToken.isNotEmpty &&
        expiresAt != null &&
        JwtExpires.isExpired(accessToken)) {
      final refreshOutcome = await _tryRefresh();
      if (refreshOutcome.success) {
        final newAccessToken = prefs.getValue(SavedConstants.accessToken, '');
        if (newAccessToken.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $newAccessToken';
        }
      }
      // If proactive refresh fails, still send the request with the current
      // token. A real 401 will be handled in onError (reactive refresh).
      // Do not force-logout here — that breaks fresh login → /me flows.
    }

    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final status = err.response?.statusCode;
    final alreadyRetried = err.requestOptions.extra[_retriedKey] == true;
    final skipRefreshOn401 = _skipRefreshOn401(err.requestOptions.path);
    final shouldRefresh = status == 401 && !alreadyRetried && !skipRefreshOn401;

    if (shouldRefresh) {
      try {
        final prefs = diContainer<VentingPreferences>();
        final hadRefreshToken = prefs
            .getValue(SavedConstants.refreshToken, '')
            .isNotEmpty;

        final refreshOutcome = await _tryRefresh();
        if (!refreshOutcome.success) {
          // No refresh token ⇒ not an established session (e.g. mid-login).
          // Do not kick the user to welcome.
          if (hadRefreshToken) {
            await SessionExpiredHandler.forceLogoutToWelcome(
              error: refreshOutcome.error,
            );
          }
          handler.next(err);
          return;
        }

        final newAccessToken = prefs.getValue(SavedConstants.accessToken, '');
        final requestOptions = err.requestOptions;

        final newHeaders = Map<String, Object?>.from(requestOptions.headers);
        newHeaders['Authorization'] = 'Bearer $newAccessToken';

        final opts = Options(
          method: requestOptions.method,
          headers: newHeaders,
          responseType: requestOptions.responseType,
          contentType: requestOptions.contentType,
          followRedirects: requestOptions.followRedirects,
          listFormat: requestOptions.listFormat,
          receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
          requestEncoder: requestOptions.requestEncoder,
          responseDecoder: requestOptions.responseDecoder,
          sendTimeout: requestOptions.sendTimeout,
          receiveTimeout: requestOptions.receiveTimeout,
        );

        requestOptions.extra[_retriedKey] = true;

        final response = await _dio.request<dynamic>(
          requestOptions.path,
          data: requestOptions.data,
          queryParameters: requestOptions.queryParameters,
          options: opts,
          cancelToken: requestOptions.cancelToken,
          onReceiveProgress: requestOptions.onReceiveProgress,
          onSendProgress: requestOptions.onSendProgress,
        );
        handler.resolve(response);
        return;
      } catch (error) {
        await SessionExpiredHandler.forceLogoutToWelcome(
          error: error is Exception ? error : Exception(error.toString()),
        );
        handler.next(err);
        return;
      }
    }

    handler.next(err);
  }

  Future<_RefreshOutcome> _tryRefresh() {
    final inFlight = _refreshInFlight;
    if (inFlight != null) return inFlight;

    final future = () async {
      try {
        final refreshTokenUsecase = diContainer<AuthRefreshTokenUsecase>();
        final refreshed = await refreshTokenUsecase().run();
        return refreshed.match(
          _RefreshOutcome.failed,
          (_) => const _RefreshOutcome.ok(),
        );
      } on Object catch (error) {
        return _RefreshOutcome.failed(
          error is Exception ? error : Exception(error.toString()),
        );
      } finally {
        _refreshInFlight = null;
      }
    }();

    _refreshInFlight = future;
    return future;
  }
}

class _RefreshOutcome {
  const _RefreshOutcome.ok() : success = true, error = null;
  const _RefreshOutcome.failed(this.error) : success = false;

  final bool success;
  final Exception? error;
}
