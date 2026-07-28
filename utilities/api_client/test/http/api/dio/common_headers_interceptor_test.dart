import 'package:api_client/src/http/api/dio/common_headers_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

void main() {
  late CommonHeadersInterceptor interceptor;
  late _MockRequestHandler handler;

  setUp(() {
    handler = _MockRequestHandler();
    interceptor = CommonHeadersInterceptor(
      platform: 'android',
      osVersion: '14',
      appVersion: '1.0.0',
      installationId: 'install-1',
      userAgent: 'ZainApp/1.0',
      networkType: 'wifi',
      phoneVersion: 'Pixel',
      getLanguageCode: () => 'en',
    );
  });

  test('adds skel headers and defaults', () {
    final options = RequestOptions(path: '/users');

    interceptor.onRequest(options, handler);

    expect(options.headers['skel-platform'], 'android');
    expect(options.headers['skel-os-version'], '14');
    expect(options.headers['skel-fix-version'], '1.0.0');
    expect(options.headers['user-agent'], 'ZainApp/1.0');
    expect(options.headers['skel-accept-language'], 'en');
    expect(options.headers['accept-language'], 'en');
    expect(options.headers['content-type'], 'application/json; charset=UTF-8');
    expect(options.headers['accept'], '*/*');
    verify(() => handler.next(options)).called(1);
  });

  test('maps ckb language to kd for skel-accept-language', () {
    interceptor = CommonHeadersInterceptor(
      platform: 'ios',
      osVersion: '17',
      appVersion: '2.0.0',
      installationId: 'install-2',
      userAgent: 'ZainApp/2.0',
      networkType: 'cellular',
      phoneVersion: 'iPhone',
      getLanguageCode: () => 'ckb',
    );
    final options = RequestOptions(path: '/offers');

    interceptor.onRequest(options, handler);

    expect(options.headers['skel-accept-language'], 'kd');
    expect(options.headers['accept-language'], 'ckb');
  });

  test('preserves preset headers', () {
    final options = RequestOptions(
      path: '/users',
      headers: {
        'user-agent': 'custom-agent',
        'content-type': 'text/plain',
        'accept': 'application/json',
        'skel-accept-language': 'ar',
        'accept-language': 'ar',
      },
    );

    interceptor.onRequest(options, handler);

    expect(options.headers['user-agent'], 'custom-agent');
    expect(options.headers['content-type'], 'text/plain');
    expect(options.headers['accept'], 'application/json');
    expect(options.headers['skel-accept-language'], 'ar');
    expect(options.headers['accept-language'], 'ar');
  });

  test('skips language headers when getter returns empty', () {
    interceptor = CommonHeadersInterceptor(
      platform: 'android',
      osVersion: '14',
      appVersion: '1.0.0',
      installationId: 'install-1',
      userAgent: 'ZainApp/1.0',
      networkType: 'wifi',
      phoneVersion: 'Pixel',
      getLanguageCode: () => '',
    );
    final options = RequestOptions(path: '/users');

    interceptor.onRequest(options, handler);

    expect(options.headers.containsKey('skel-accept-language'), isFalse);
    expect(options.headers.containsKey('accept-language'), isFalse);
  });
}
