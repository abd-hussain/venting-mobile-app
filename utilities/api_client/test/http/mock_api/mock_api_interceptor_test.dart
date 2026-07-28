import 'dart:convert';
import 'dart:io';

import 'package:api_client/src/http/mock_api/mock_api_interceptor.dart';
import 'package:api_client/src/http/mock_api/mock_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockResponseHandler extends Mock implements ResponseInterceptorHandler {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/'));
    registerFallbackValue(
      Response<dynamic>(
        requestOptions: RequestOptions(path: '/'),
        statusCode: 200,
      ),
    );
    registerFallbackValue(
      DioException(requestOptions: RequestOptions(path: '/')),
    );
  });

  late MockApiInterceptor interceptor;
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('mock_api_test');
    interceptor = MockApiInterceptor()
      ..mockDataPath = tempDir.path
      ..accessToken = 'token';
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('reply, setMocking, and reset update state', () {
    interceptor
      ..reply({
        '/a': [MockResponse(body: '{}')],
      })
      ..setMocking(false)
      ..reset();

    expect(interceptor.isMockEnabled, isTrue);
    expect(interceptor.apiPathToMockResponseMapping, isEmpty);
  });

  test('mock mode resolves inline JSON response', () async {
    final handler = _MockRequestHandler();
    interceptor.reply({
      '/users': [MockResponse(body: '{"id":1}')],
    });
    final options = RequestOptions(path: '/users', method: 'GET');

    await interceptor.onRequest(options, handler);

    final captured = verify(() => handler.resolve(captureAny())).captured;
    final response = captured.single as Response<dynamic>;
    expect(response.statusCode, 200);
    expect(response.data, {'id': 1});
  });

  test('record mode forwards request with bearer token', () async {
    final handler = _MockRequestHandler();
    interceptor
      ..isMockEnabled = false
      ..isRecordEnabled = true;
    final options = RequestOptions(path: '/users', method: 'GET');

    await interceptor.onRequest(options, handler);

    expect(options.headers['Authorization'], 'Bearer token');
    verify(() => handler.next(options)).called(1);
  });

  test('mock disabled forwards request', () async {
    final handler = _MockRequestHandler();
    interceptor
      ..isMockEnabled = false
      ..isRecordEnabled = false;
    final options = RequestOptions(path: '/users', method: 'GET');

    await interceptor.onRequest(options, handler);

    verify(() => handler.next(options)).called(1);
  });

  test(
    'falls back to recorded response file when mock mapping missing',
    () async {
      final handler = _MockRequestHandler();
      final options = RequestOptions(
        path: '/recorded',
        method: 'GET',
        queryParameters: <String, dynamic>{},
      );
      final fileName = _recordFileName(options);
      File(
        '${tempDir.path}/$fileName.json',
      ).writeAsStringSync('{"cached":true}');

      await interceptor.onRequest(options, handler);

      final captured = verify(() => handler.resolve(captureAny())).captured;
      final response = captured.single as Response<dynamic>;
      expect(response.data, {'cached': true});
    },
  );

  test('rejects when mock and recorded fallback both fail', () async {
    final handler = _MockRequestHandler();
    final options = RequestOptions(path: '/missing', method: 'GET');

    await interceptor.onRequest(options, handler);

    verify(() => handler.reject(any())).called(1);
  });

  test('onResponse records successful responses in record mode', () {
    final handler = _MockResponseHandler();
    interceptor.isRecordEnabled = true;
    final options = RequestOptions(
      path: '/save',
      method: 'POST',
      queryParameters: <String, dynamic>{},
    );
    final response = Response(
      requestOptions: options,
      statusCode: 200,
      data: {'saved': true},
    );

    interceptor.onResponse(response, handler);

    verify(() => handler.next(response)).called(1);
    expect(tempDir.listSync().whereType<File>(), isNotEmpty);
  });

  test('onResponse throws when record mode path or token missing', () {
    final handler = _MockResponseHandler();
    interceptor
      ..isRecordEnabled = true
      ..mockDataPath = ''
      ..accessToken = '';
    final response = Response(
      requestOptions: RequestOptions(path: '/save'),
      statusCode: 200,
      data: {},
    );

    expect(
      () => interceptor.onResponse(response, handler),
      throwsA(isA<Exception>()),
    );
  });

  test('consumes queued mock responses in order', () async {
    interceptor.reply({
      '/queue': [MockResponse(body: '{"n":1}'), MockResponse(body: '{"n":2}')],
    });

    final firstHandler = _MockRequestHandler();
    await interceptor.onRequest(
      RequestOptions(path: '/queue', method: 'GET'),
      firstHandler,
    );
    final firstResponse =
        verify(() => firstHandler.resolve(captureAny())).captured.single
            as Response<dynamic>;
    expect(firstResponse.data, {'n': 1});

    final secondHandler = _MockRequestHandler();
    await interceptor.onRequest(
      RequestOptions(path: '/queue', method: 'GET'),
      secondHandler,
    );
    final secondResponse =
        verify(() => secondHandler.resolve(captureAny())).captured.single
            as Response<dynamic>;
    expect(secondResponse.data, {'n': 2});
  });

  test('mock mode loads response body from asset file', () async {
    final handler = _MockRequestHandler();
    interceptor.reply({
      '/asset': [
        MockResponse(bodyFilePath: 'test/fixtures/mock_response.json'),
      ],
    });

    await interceptor.onRequest(
      RequestOptions(path: '/asset', method: 'GET'),
      handler,
    );

    final response =
        verify(() => handler.resolve(captureAny())).captured.single
            as Response<dynamic>;
    expect(response.data, {'fromFile': true});
  });

  test('mock mode returns empty body for error status without body', () async {
    final handler = _MockRequestHandler();
    interceptor.reply({
      '/error': [MockResponse(code: 404)],
    });

    await interceptor.onRequest(
      RequestOptions(path: '/error', method: 'GET'),
      handler,
    );

    verify(() => handler.reject(any())).called(1);
  });

  test('rejects when success mock has no response body', () async {
    final handler = _MockRequestHandler();
    interceptor.reply({
      '/nobody': [MockResponse()],
    });

    await interceptor.onRequest(
      RequestOptions(path: '/nobody', method: 'GET'),
      handler,
    );

    verify(() => handler.reject(any())).called(1);
  });

  test('rejects when mock mapping exists but is empty', () async {
    final handler = _MockRequestHandler();
    interceptor.reply({'/empty': <MockResponse>[]});

    await interceptor.onRequest(
      RequestOptions(path: '/empty', method: 'GET'),
      handler,
    );

    verify(() => handler.reject(any())).called(1);
  });

  test('onResponse logs when disk write fails', () {
    final handler = _MockResponseHandler();
    final blocker = File('${tempDir.path}/blocker.txt')..writeAsStringSync('x');
    interceptor
      ..isRecordEnabled = true
      ..mockDataPath = blocker.path;
    final options = RequestOptions(
      path: '/save',
      method: 'POST',
      queryParameters: <String, dynamic>{},
    );
    final response = Response(
      requestOptions: options,
      statusCode: 200,
      data: {'saved': true},
    );

    interceptor.onResponse(response, handler);

    verify(() => handler.next(response)).called(1);
  });
}

String _recordFileName(RequestOptions options) {
  final uniqueKeyJSON = {
    'path': options.path,
    'method': options.method,
    'params': Map<String, dynamic>.from(options.queryParameters),
  };
  final input = jsonEncode(uniqueKeyJSON);
  final invalidCharacters = RegExp(r'[<>:"/\\|?*\x00-\x1F]');
  var sanitized = input
      .replaceAll(invalidCharacters, '_')
      .trim()
      .replaceAll(RegExp(r'[. ]+$'), '');
  if (sanitized.isEmpty) {
    sanitized = 'default_file_name';
  }
  return sanitized;
}
