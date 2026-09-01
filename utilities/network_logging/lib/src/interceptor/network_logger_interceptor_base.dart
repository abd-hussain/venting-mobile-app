import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:network_logging/src/config/network_log_config.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';
import 'package:network_logging/src/utils/network_log_sanitizer.dart';
import 'package:uuid/uuid.dart';

abstract class NetworkLoggerInterceptorBase extends Interceptor {
  final NetworkLogStorage storage;
  final NetworkLogConfig config;
  final NetworkLogSanitizer sanitizer;
  final Uuid _uuid = const Uuid();

  @visibleForTesting
  static bool debugThrowOnLog = false;

  @visibleForTesting
  static void resetTestOverrides() {
    debugThrowOnLog = false;
  }

  NetworkLoggerInterceptorBase(this.storage, this.config)
    : sanitizer = NetworkLogSanitizer(config);

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!config.isEnabled) {
      return handler.next(options);
    }

    // Create log entry quickly and store ID
    NetworkLogEntry? entry;
    try {
      entry = await createLogEntry(options);
      // Store request ID in options for correlation
      options.extra['networkLogId'] = entry.id;
    } catch (e) {
      // Don't let logging errors break the request
      LoggerManagerBase.logErrorMessage(
        message: 'Network logging error: $e',
        error: e,
      );
    }

    // Let the request proceed immediately
    handler.next(options);

    // Log the request asynchronously in the background (non-blocking)
    if (entry != null) {
      await _logRequestAsync(entry)
          .then((_) {
            _log('Completed async request log for ${entry!.id}');
          })
          .catchError((e) {
            LoggerManagerBase.logErrorMessage(
              message: 'Network logging error (async): $e',
              error: e,
            );
          });
    }
  }

  /// Log request asynchronously without blocking the HTTP request
  Future<void> _logRequestAsync(NetworkLogEntry entry) async {
    try {
      await logRequest(entry);
    } catch (e) {
      LoggerManagerBase.logErrorMessage(
        message: 'Network logging error in async log: $e',
        error: e,
      );
    }
  }

  @override
  Future<void> onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) async {
    if (!config.isEnabled) {
      return handler.next(response);
    }

    final requestId = response.requestOptions.extra['networkLogId'] as String?;

    // Let the response proceed immediately
    handler.next(response);

    // Log the response asynchronously in the background (non-blocking)
    if (requestId != null) {
      await _logResponseAsync(response, requestId)
          .then((_) {
            _log('Completed async response log for $requestId');
          })
          .catchError((e) {
            LoggerManagerBase.logErrorMessage(
              message: 'Network logging error (async): $e',
              error: e,
            );
          });
    }
  }

  /// Log response asynchronously without blocking the HTTP response
  Future<void> _logResponseAsync(
    Response<dynamic> response,
    String requestId,
  ) async {
    try {
      await logResponse(response, requestId);
    } catch (e) {
      LoggerManagerBase.logErrorMessage(
        message: 'Network logging error in async log: $e',
        error: e,
      );
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (!config.isEnabled) {
      return handler.next(err);
    }

    final requestId = err.requestOptions.extra['networkLogId'] as String?;

    // Let the error proceed immediately
    handler.next(err);

    // Log the error asynchronously in the background (non-blocking)
    if (requestId != null) {
      await _logErrorAsync(err, requestId)
          .then((_) {
            _log('Completed async error log for $requestId');
          })
          .catchError((e) {
            LoggerManagerBase.logErrorMessage(
              message: 'Network logging error (async): $e',
              error: e,
            );
          });
    }
  }

  /// Log error asynchronously without blocking the HTTP error handling
  Future<void> _logErrorAsync(DioException err, String requestId) async {
    try {
      await logError(err, requestId);
    } catch (e) {
      LoggerManagerBase.logErrorMessage(
        message: 'Network logging error in async log: $e',
        error: e,
      );
    }
  }

  @protected
  String? _requestBodyForLog(Object? data) {
    if (data is FormData) {
      final fileNames = data.files.map((entry) => entry.key).join(', ');
      return 'FormData(fields: ${data.fields.length}, files: $fileNames)';
    }
    return data?.toString();
  }

  @protected
  Future<NetworkLogEntry> createLogEntry(RequestOptions options) async {
    final sanitizedHeaders = sanitizer.sanitizeHeaders(
      Map<String, dynamic>.from(options.headers),
    );

    final requestBody = config.logRequestBodies
        ? sanitizer.sanitizeBody(
            _requestBodyForLog(options.data),
            options.uri.toString(),
          )
        : null;

    return NetworkLogEntry(
      id: _uuid.v4(),
      url: options.uri.toString(),
      method: options.method.toUpperCase(),
      requestTimestamp: DateTime.now(),
      requestHeaders: sanitizedHeaders,
      requestBody: requestBody,
      isSensitive: sanitizer.isSensitiveUrl(options.uri.toString()),
    );
  }

  @protected
  Future<void> logRequest(NetworkLogEntry entry);

  @protected
  Future<void> logResponse(Response<dynamic> response, String requestId);

  @protected
  Future<void> logError(DioException error, String requestId);

  void _log(String message) {
    if (kDebugMode) {
      if (debugThrowOnLog) {
        throw Exception('debug log failure');
      }
      LoggerManagerBase.logDebugMessage(message: '[NetworkLog] $message');
    }
  }
}
