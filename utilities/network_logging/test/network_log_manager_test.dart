import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/data/storage/no_op_network_log_storage.dart';
import 'package:network_logging/src/data/storage/persistent_network_log_storage.dart';
import 'package:network_logging/src/debug_network_log_manager.dart';
import 'package:network_logging/src/interceptor/development_network_logger_interceptor.dart';
import 'package:network_logging/src/interceptor/network_logger_interceptor_base.dart';
import 'package:network_logging/src/interceptor/production_network_logger_interceptor.dart';
import 'package:network_logging/src/network_log_manager.dart';
import 'package:network_logging/src/production_network_log_manager.dart';

import 'support/test_support.dart';

class _MockRequestHandler extends Mock implements RequestInterceptorHandler {}

class _MockResponseHandler extends Mock implements ResponseInterceptorHandler {}

class _MockErrorHandler extends Mock implements ErrorInterceptorHandler {}

class _RecordingInterceptor extends NetworkLoggerInterceptorBase {
  _RecordingInterceptor(
    super.storage,
    super.config, {
    this.throwOnCreateLogEntry = false,
    this.throwOnLogRequest = false,
    this.throwOnLogResponse = false,
    this.throwOnLogError = false,
  });

  final bool throwOnCreateLogEntry;
  final bool throwOnLogRequest;
  final bool throwOnLogResponse;
  final bool throwOnLogError;
  final List<NetworkLogEntry> loggedRequests = [];
  final List<(Response<dynamic>, String)> loggedResponses = [];
  final List<(DioException, String)> loggedErrors = [];

  @override
  Future<NetworkLogEntry> createLogEntry(RequestOptions options) async {
    if (throwOnCreateLogEntry) {
      throw Exception('create failed');
    }
    return super.createLogEntry(options);
  }

  @override
  Future<void> logRequest(NetworkLogEntry entry) async {
    if (throwOnLogRequest) throw Exception('boom');
    loggedRequests.add(entry);
  }

  @override
  Future<void> logResponse(Response<dynamic> response, String requestId) async {
    if (throwOnLogResponse) throw Exception('response boom');
    loggedResponses.add((response, requestId));
  }

  @override
  Future<void> logError(DioException error, String requestId) async {
    if (throwOnLogError) throw Exception('error boom');
    loggedErrors.add((error, requestId));
  }
}

void main() {
  setUp(() {
    NetworkLogManagerFactory.resetForTesting();
    NetworkLoggerInterceptorBase.resetTestOverrides();
  });

  group(NetworkLogManagerFactory, () {
    test(
      'maps dev to a debug manager and then caches it regardless of env',
      () {
        final first = NetworkLogManagerFactory.create('dev');
        expect(first, isA<DebugNetworkLogManager>());

        final second = NetworkLogManagerFactory.create('prod');
        expect(identical(first, second), isTrue);
      },
    );

    test('maps rel and stg to debug managers', () {
      expect(
        NetworkLogManagerFactory.create('rel'),
        isA<DebugNetworkLogManager>(),
      );
      NetworkLogManagerFactory.resetForTesting();
      expect(
        NetworkLogManagerFactory.create('stg'),
        isA<DebugNetworkLogManager>(),
      );
    });

    test('maps prod and unknown envs to production managers', () {
      expect(
        NetworkLogManagerFactory.create('prod'),
        isA<ProductionNetworkLogManager>(),
      );
      NetworkLogManagerFactory.resetForTesting();
      expect(
        NetworkLogManagerFactory.create('qa'),
        isA<ProductionNetworkLogManager>(),
      );
    });
  });

  group(DebugNetworkLogManager, () {
    test('lazily builds and caches the dev interceptor + storage', () {
      final manager = DebugNetworkLogManager();

      final interceptor = manager.httpInterceptor();
      expect(interceptor, isA<DevelopmentNetworkLoggerInterceptor>());
      expect(identical(manager.httpInterceptor(), interceptor), isTrue);
      expect(manager.httpStorage(), isA<PersistentNetworkLogStorage>());
    });
  });

  group(ProductionNetworkLogManager, () {
    test('provides the production interceptor and no storage', () {
      final manager = ProductionNetworkLogManager();

      expect(
        manager.httpInterceptor(),
        isA<ProductionNetworkLoggerInterceptor>(),
      );
      expect(manager.httpStorage(), isNull);
      expect(manager.logTrackerWidget(_FakeContext()), isNull);
    });
  });

  group('NetworkLoggerInterceptorBase', () {
    _RecordingInterceptor build({
      bool isEnabled = true,
      bool throwOnCreateLogEntry = false,
      bool throwOnLogRequest = false,
      bool throwOnLogResponse = false,
      bool throwOnLogError = false,
    }) => _RecordingInterceptor(
      NoOpNetworkLogStorage(),
      TestNetworkLogConfig(isEnabled: isEnabled),
      throwOnCreateLogEntry: throwOnCreateLogEntry,
      throwOnLogRequest: throwOnLogRequest,
      throwOnLogResponse: throwOnLogResponse,
      throwOnLogError: throwOnLogError,
    );

    group('onRequest', () {
      test('creates a correlated entry and forwards the request', () async {
        final interceptor = build();
        final options = RequestOptions(path: '/users', method: 'get');
        final handler = _MockRequestHandler();

        await interceptor.onRequest(options, handler);

        verify(() => handler.next(options)).called(1);
        final logId = options.extra['networkLogId'];
        expect(logId, isA<String>());
        expect(interceptor.loggedRequests, hasLength(1));
        expect(interceptor.loggedRequests.single.method, 'GET');
      });

      test('sanitizes headers and flags sensitive URLs in the entry', () async {
        final interceptor = build();
        final options = RequestOptions(
          path: '/login',
          headers: {'Authorization': 'Bearer-secret-token'},
        );

        await interceptor.onRequest(options, _MockRequestHandler());

        final entry = interceptor.loggedRequests.single;
        expect(entry.requestHeaders['Authorization'], 'Bear***oken');
        expect(entry.isSensitive, isTrue);
      });

      test('short-circuits without logging when disabled', () async {
        final interceptor = build(isEnabled: false);
        final options = RequestOptions(path: '/users');
        final handler = _MockRequestHandler();

        await interceptor.onRequest(options, handler);

        verify(() => handler.next(options)).called(1);
        expect(options.extra.containsKey('networkLogId'), isFalse);
      });

      test('a failing createLogEntry never breaks the request', () async {
        final interceptor = build(throwOnCreateLogEntry: true);
        final options = RequestOptions(path: '/users');
        final handler = _MockRequestHandler();

        await expectLater(interceptor.onRequest(options, handler), completes);
        verify(() => handler.next(options)).called(1);
        expect(interceptor.loggedRequests, isEmpty);
      });

      test('a failing log hook never breaks the request', () async {
        final interceptor = build(throwOnLogRequest: true);
        final options = RequestOptions(path: '/users');
        final handler = _MockRequestHandler();

        await expectLater(interceptor.onRequest(options, handler), completes);
        verify(() => handler.next(options)).called(1);
      });

      test('async log completion errors are swallowed', () async {
        NetworkLoggerInterceptorBase.debugThrowOnLog = true;
        final interceptor = build();
        final options = RequestOptions(path: '/users');

        await interceptor.onRequest(options, _MockRequestHandler());

        expect(interceptor.loggedRequests, hasLength(1));
      });
    });

    group('onResponse', () {
      test('logs against the correlated request id', () async {
        final interceptor = build();
        final response = Response<dynamic>(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'abc'},
          ),
          statusCode: 200,
        );
        final handler = _MockResponseHandler();

        await interceptor.onResponse(response, handler);

        verify(() => handler.next(response)).called(1);
        expect(interceptor.loggedResponses.single.$2, 'abc');
      });

      test('short-circuits without logging when disabled', () async {
        final interceptor = build(isEnabled: false);
        final response = Response<dynamic>(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'abc'},
          ),
          statusCode: 200,
        );
        final handler = _MockResponseHandler();

        await interceptor.onResponse(response, handler);

        verify(() => handler.next(response)).called(1);
        expect(interceptor.loggedResponses, isEmpty);
      });

      test('logResponse failures do not break the response', () async {
        final interceptor = build(throwOnLogResponse: true);
        final response = Response<dynamic>(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'abc'},
          ),
          statusCode: 200,
        );

        await expectLater(
          interceptor.onResponse(response, _MockResponseHandler()),
          completes,
        );
      });

      test('async response log completion errors are swallowed', () async {
        NetworkLoggerInterceptorBase.debugThrowOnLog = true;
        final interceptor = build();
        final response = Response<dynamic>(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'abc'},
          ),
          statusCode: 200,
        );

        await interceptor.onResponse(response, _MockResponseHandler());

        expect(interceptor.loggedResponses, hasLength(1));
      });
    });

    group('onError', () {
      test('logs against the correlated request id', () async {
        final interceptor = build();
        final error = DioException(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'xyz'},
          ),
        );
        final handler = _MockErrorHandler();

        await interceptor.onError(error, handler);

        verify(() => handler.next(error)).called(1);
        expect(interceptor.loggedErrors.single.$2, 'xyz');
      });

      test('short-circuits without logging when disabled', () async {
        final interceptor = build(isEnabled: false);
        final error = DioException(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'xyz'},
          ),
        );
        final handler = _MockErrorHandler();

        await interceptor.onError(error, handler);

        verify(() => handler.next(error)).called(1);
        expect(interceptor.loggedErrors, isEmpty);
      });

      test('logError failures do not break the error', () async {
        final interceptor = build(throwOnLogError: true);
        final error = DioException(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'xyz'},
          ),
        );

        await expectLater(
          interceptor.onError(error, _MockErrorHandler()),
          completes,
        );
      });

      test('async error log completion errors are swallowed', () async {
        NetworkLoggerInterceptorBase.debugThrowOnLog = true;
        final interceptor = build();
        final error = DioException(
          requestOptions: RequestOptions(
            path: '/users',
            extra: {'networkLogId': 'xyz'},
          ),
        );

        await interceptor.onError(error, _MockErrorHandler());

        expect(interceptor.loggedErrors, hasLength(1));
      });
    });
  });
}

class _FakeContext extends Fake implements BuildContext {}
