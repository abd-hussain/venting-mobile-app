import 'dart:async';
import 'dart:io';

import 'package:api_client/src/http/api/dio/vpn_hint_interceptor.dart';
import 'package:api_client/src/ui/vpn_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

class _FakeSocket extends Fake implements Socket {
  _FakeSocket({this.failOnClose = false});

  final bool failOnClose;

  @override
  Future<Socket> close() async {
    if (failOnClose) {
      throw const SocketException('close failed');
    }
    return this;
  }
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() {
    registerFallbackValue(RequestOptions(path: '/'));
    registerFallbackValue(
      DioException(requestOptions: RequestOptions(path: '/')),
    );
  });

  late VpnHintInterceptor interceptor;
  late _MockRequestHandler requestHandler;
  late _MockErrorHandler errorHandler;
  late GlobalKey<ScaffoldMessengerState> messengerKey;

  setUp(() {
    interceptor = const VpnHintInterceptor();
    requestHandler = _MockRequestHandler();
    errorHandler = _MockErrorHandler();
    messengerKey = GlobalKey<ScaffoldMessengerState>();
    VpnToast.setScaffoldMessengerKey(messengerKey);
  });

  tearDown(VpnHintInterceptor.resetTestOverrides);

  Future<void> pumpToastHost(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        scaffoldMessengerKey: messengerKey,
        home: const Scaffold(body: SizedBox()),
      ),
    );
  }

  group('onRequest', () {
    testWidgets('rejects when DNS lookup returns no addresses', (tester) async {
      await pumpToastHost(tester);
      VpnHintInterceptor.debugLookup = (_) async => <InternetAddress>[];

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      final captured = verify(
        () => requestHandler.reject(captureAny()),
      ).captured;
      final err = captured.single as DioException;
      expect(err.type, DioExceptionType.connectionError);
      await tester.pump();
      expect(find.text('Please connect to VPN'), findsOneWidget);
    });

    testWidgets('rejects when TCP connect fails', (tester) async {
      await pumpToastHost(tester);
      VpnHintInterceptor.debugLookup = (_) async => [
        InternetAddress.loopbackIPv4,
      ];
      VpnHintInterceptor.debugSocketConnect = (_, _) async {
        throw const SocketException('connect failed');
      };

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      final captured = verify(
        () => requestHandler.reject(captureAny()),
      ).captured;
      final err = captured.single as DioException;
      expect(err.type, DioExceptionType.connectionTimeout);
      await tester.pump();
      expect(find.text('Please connect to VPN'), findsOneWidget);
    });

    testWidgets('continues when lookup and TCP connect succeed', (
      tester,
    ) async {
      await pumpToastHost(tester);
      VpnHintInterceptor.debugLookup = (_) async => [
        InternetAddress.loopbackIPv4,
      ];
      VpnHintInterceptor.debugSocketConnect = (_, port) async {
        expect(port, 443);
        return _FakeSocket();
      };

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      verify(() => requestHandler.next(options)).called(1);
    });

    test('uses port 80 for plain HTTP requests', () async {
      VpnHintInterceptor.debugLookup = (_) async => [
        InternetAddress.loopbackIPv4,
      ];
      VpnHintInterceptor.debugSocketConnect = (_, port) async {
        expect(port, 80);
        return _FakeSocket();
      };

      final options = RequestOptions(path: 'http://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      verify(() => requestHandler.next(options)).called(1);
    });

    test('uses explicit URI port when provided', () async {
      VpnHintInterceptor.debugLookup = (_) async => [
        InternetAddress.loopbackIPv4,
      ];
      VpnHintInterceptor.debugSocketConnect = (_, port) async {
        expect(port, 8080);
        return _FakeSocket();
      };

      final options = RequestOptions(path: 'http://api.test:8080/resource');
      await interceptor.onRequest(options, requestHandler);

      verify(() => requestHandler.next(options)).called(1);
    });

    testWidgets('rejects on DNS lookup timeout', (tester) async {
      await pumpToastHost(tester);
      VpnHintInterceptor.debugLookup = (_) async {
        throw TimeoutException('dns timeout');
      };

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      final captured = verify(
        () => requestHandler.reject(captureAny()),
      ).captured;
      final err = captured.single as DioException;
      expect(err.type, DioExceptionType.connectionTimeout);
      await tester.pump();
      expect(find.text('Please connect to VPN'), findsOneWidget);
    });

    testWidgets('rejects on socket exception during lookup', (tester) async {
      await pumpToastHost(tester);
      VpnHintInterceptor.debugLookup = (_) async {
        throw const SocketException('lookup failed');
      };

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      final captured = verify(
        () => requestHandler.reject(captureAny()),
      ).captured;
      final err = captured.single as DioException;
      expect(err.type, DioExceptionType.connectionError);
      await tester.pump();
      expect(find.text('Please connect to VPN'), findsOneWidget);
    });

    test('continues when an unexpected lookup error occurs', () async {
      VpnHintInterceptor.debugLookup = (_) async {
        throw Exception('unexpected');
      };

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      verify(() => requestHandler.next(options)).called(1);
    });

    test('ignores socket close failures in finally block', () async {
      VpnHintInterceptor.debugLookup = (_) async => [
        InternetAddress.loopbackIPv4,
      ];
      VpnHintInterceptor.debugSocketConnect = (_, _) async {
        return _FakeSocket(failOnClose: true);
      };

      final options = RequestOptions(path: 'https://api.test/resource');
      await interceptor.onRequest(options, requestHandler);

      verify(() => requestHandler.next(options)).called(1);
    });

    test(
      'performs real lookup and connect when debug hooks are unset',
      () async {
        var outcome = '';
        when(() => requestHandler.next(any())).thenAnswer((_) async {
          outcome = 'next';
        });
        when(() => requestHandler.reject(any())).thenAnswer((_) async {
          outcome = 'reject';
        });

        final options = RequestOptions(path: 'http://127.0.0.1/resource');
        await interceptor.onRequest(options, requestHandler);

        expect(outcome, isNotEmpty);
      },
    );
  });

  testWidgets('onError shows VPN toast for connection failures', (
    tester,
  ) async {
    await pumpToastHost(tester);

    final options = RequestOptions(path: 'https://api.test');
    final err = DioException(
      requestOptions: options,
      type: DioExceptionType.connectionTimeout,
      error: const SocketException('timeout'),
    );

    interceptor.onError(err, errorHandler);

    await tester.pump();
    expect(find.text('Please connect to VPN'), findsOneWidget);
    verify(() => errorHandler.next(err)).called(1);
  });

  test('onError ignores non-VPN errors', () {
    final options = RequestOptions(path: 'https://api.test');
    final err = DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response(requestOptions: options, statusCode: 500),
    );

    interceptor.onError(err, errorHandler);

    verify(() => errorHandler.next(err)).called(1);
  });
}
