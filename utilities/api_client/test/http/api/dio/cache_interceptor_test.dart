import 'package:api_client/src/http/api/dio/cache_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

void main() {
  late _MockRequestHandler handler;

  setUp(() {
    handler = _MockRequestHandler();
  });

  test('adds cache metadata for matching URLs', () {
    final wrapper = interceptorWrapper(['/config']);
    final options = RequestOptions(path: 'https://api.test/config');

    wrapper.onRequest.call(options, handler);

    expect(options.extra, isNotEmpty);
    verify(() => handler.next(options)).called(1);
  });

  test('passes through non-matching URLs unchanged', () {
    final wrapper = interceptorWrapper(['/config']);
    final options = RequestOptions(path: 'https://api.test/users');
    final originalExtra = Map<String, dynamic>.from(options.extra);

    wrapper.onRequest.call(options, handler);

    expect(options.extra, originalExtra);
    verify(() => handler.next(options)).called(1);
  });
}
