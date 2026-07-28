import 'dart:io';

import 'package:api_client/src/http/api/dio/dio_builder.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:native_dio_adapter/native_dio_adapter.dart';

class _MockInterceptor extends Mock implements Interceptor {}

class _MockHttpClientAdapter extends Mock implements HttpClientAdapter {}

void main() {
  group(DioBuilder, () {
    test('builds Dio with base URL, timeouts, and interceptors', () {
      final interceptor = _MockInterceptor();
      final adapter = _MockHttpClientAdapter();

      final dio = DioBuilder()
          .setBaseUrl('https://api.test')
          .addInterceptor(interceptor)
          .setClientAdapter(adapter)
          .build();

      expect(dio.options.baseUrl, 'https://api.test');
      expect(dio.options.connectTimeout, const Duration(seconds: 10));
      expect(dio.options.receiveTimeout, const Duration(seconds: 20));
      expect(dio.options.sendTimeout, const Duration(seconds: 20));
      expect(dio.interceptors, contains(interceptor));
      expect(dio.httpClientAdapter, adapter);
    });

    test('defaults to empty base URL when unset', () {
      final dio = DioBuilder().build();
      expect(dio.options.baseUrl, isEmpty);
    });

    test('withReporter adds a LogInterceptor', () {
      final dio = DioBuilder().withReporter().build();
      expect(dio.interceptors.last, isA<LogInterceptor>());
    });

    test('withNativeAdapter does not throw under flutter test', () {
      expect(() => DioBuilder().withNativeAdapter().build(), returnsNormally);
    });

    test('withNativeAdapter assigns adapter when enabled', () {
      final adapter = _MockHttpClientAdapter();
      addTearDown(() {
        DioBuilder.useNativeAdapter = !Platform.environment.containsKey(
          'FLUTTER_TEST',
        );
        DioBuilder.createNativeAdapter = NativeAdapter.new;
      });
      DioBuilder.useNativeAdapter = true;
      DioBuilder.createNativeAdapter = () => adapter;

      final dio = DioBuilder().withNativeAdapter().build();

      expect(dio.httpClientAdapter, adapter);
    });

    test('withReporter logPrint callback is wired', () {
      final dio = DioBuilder().withReporter().build();
      final logInterceptor = dio.interceptors
          .whereType<LogInterceptor>()
          .single;

      expect(() => logInterceptor.logPrint('request payload'), returnsNormally);
    });
  });
}
