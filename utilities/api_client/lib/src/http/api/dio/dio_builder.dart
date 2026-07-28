import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

class DioBuilder {
  @visibleForTesting
  static bool useNativeAdapter = !Platform.environment.containsKey(
    'FLUTTER_TEST',
  );

  @visibleForTesting
  static HttpClientAdapter Function() createNativeAdapter = NativeAdapter.new;
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

  DioBuilder withNativeAdapter() {
    if (useNativeAdapter) {
      _clientAdapter = createNativeAdapter();
    }
    return this;
  }

  Dio build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl ?? '',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    );

    // Add interceptors
    for (final interceptor in _interceptors) {
      dio.interceptors.add(interceptor);
    }

    // Set client adapter
    if (_clientAdapter != null) {
      dio.httpClientAdapter = _clientAdapter!;
    }

    // Add reporter if requested
    if (_withReporter) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (obj) => LoggerManagerBase.logInfo(message: '[Dio] $obj'),
        ),
      );
    }

    return dio;
  }
}
