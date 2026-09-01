import 'dart:io';

import 'package:api_client/src/http/api/dio/dio_builder.dart';
import 'package:api_client/src/http/api/dio/multipart_form_data_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

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
      expect(dio.options.connectTimeout, const Duration(seconds: 30));
      expect(dio.options.receiveTimeout, const Duration(minutes: 5));
      expect(dio.options.sendTimeout, const Duration(minutes: 5));
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

    test('withNativeAdapter assigns IOHttpClientAdapter when enabled', () {
      addTearDown(() {
        DioBuilder.useNativeAdapter = !Platform.environment.containsKey(
          'FLUTTER_TEST',
        );
      });
      DioBuilder.useNativeAdapter = true;

      final dio = DioBuilder().withNativeAdapter().build();

      expect(dio.httpClientAdapter, isA<IOHttpClientAdapter>());
    });
  });

  group(MultipartFormDataInterceptor, () {
    test('clears content-type for FormData', () {
      const interceptor = MultipartFormDataInterceptor();
      final handler = _MockRequestHandler();
      final options = RequestOptions(
        path: '/v1/listeners/register',
        data: FormData.fromMap({'full_name': 'Test'}),
        headers: {'content-type': 'application/json'},
      );

      interceptor.onRequest(options, handler);

      expect(options.headers.containsKey('content-type'), isFalse);
      expect(options.contentType, isNull);
      verify(() => handler.next(options)).called(1);
    });
  });
}

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}
