import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:logger_manager/logger_manager.dart';

class DioBuilder {
  @visibleForTesting
  static bool useNativeAdapter = !Platform.environment.containsKey(
    'FLUTTER_TEST',
  );

  String? _baseUrl;
  final List<Interceptor> _interceptors = [];
  HttpClientAdapter? _clientAdapter;
  bool _withReporter = false;

  DioBuilder setBaseUrl(String baseUrl) {
    _baseUrl = baseUrl;
    return this;
  }

  DioBuilder addInterceptor(Interceptor interceptor) {
    _interceptors.add(interceptor);
    return this;
  }

  DioBuilder setClientAdapter(HttpClientAdapter adapter) {
    _clientAdapter = adapter;
    return this;
  }

  DioBuilder withReporter() {
    _withReporter = true;
    return this;
  }

  /// Uses Dart [IOHttpClientAdapter] — reliable for multipart file uploads.
  DioBuilder withNativeAdapter() {
    if (useNativeAdapter) {
      _clientAdapter = IOHttpClientAdapter();
    }
    return this;
  }

  Dio build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl ?? '',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(minutes: 5),
        sendTimeout: const Duration(minutes: 5),
      ),
    );

    for (final interceptor in _interceptors) {
      dio.interceptors.add(interceptor);
    }

    if (_clientAdapter != null) {
      dio.httpClientAdapter = _clientAdapter!;
    }

    if (_withReporter) {
      dio.interceptors.add(
        LogInterceptor(
          responseHeader: false,
          responseBody: true,
          logPrint: (obj) => LoggerManagerBase.logInfo(message: '[Dio] $obj'),
        ),
      );
    }

    return dio;
  }
}
