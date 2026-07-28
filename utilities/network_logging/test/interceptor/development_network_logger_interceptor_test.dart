import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/storage/in_memory_network_log_storage.dart';
import 'package:network_logging/src/interceptor/development_network_logger_interceptor.dart';

import '../support/test_support.dart';

void main() {
  group(DevelopmentNetworkLoggerInterceptor, () {
    late InMemoryNetworkLogStorage storage;
    late DevelopmentNetworkLoggerInterceptor interceptor;

    setUp(() {
      storage = InMemoryNetworkLogStorage();
      interceptor = DevelopmentNetworkLoggerInterceptor(
        storage,
        const TestNetworkLogConfig(),
      );
    });

    test('logRequest stores the entry', () async {
      await interceptor.logRequest(buildEntry(id: '1'));

      expect((await storage.getAll()).single.id, '1');
    });

    group('logResponse', () {
      test('updates the matching entry with response data', () async {
        await interceptor.logRequest(buildEntry(id: 'req-1'));

        await interceptor.logResponse(
          _response(
            statusCode: 200,
            data: 'ok-body',
            headers: {
              'content-type': ['application/json'],
            },
          ),
          'req-1',
        );

        final updated = (await storage.getAll()).single;
        expect(updated.statusCode, 200);
        expect(updated.responseBody, 'ok-body');
        expect(updated.responseTimestamp, isNotNull);
        expect(updated.responseHeaders?['content-type'], ['application/json']);
        expect(updated.duration, greaterThanOrEqualTo(0));
      });

      test('does nothing when the request id is unknown', () async {
        await interceptor.logResponse(_response(statusCode: 200), 'missing');

        expect(await storage.getAll(), isEmpty);
      });
    });

    group('logError', () {
      late DevelopmentNetworkLoggerInterceptor errorInterceptor;

      setUp(() {
        errorInterceptor = DevelopmentNetworkLoggerInterceptor(
          storage,
          const TestNetworkLogConfig(maxBodySize: 4096),
        );
      });

      test('maps a MobileBffBaseError payload into the entry', () async {
        await errorInterceptor.logRequest(buildEntry(id: 'req-1'));

        await errorInterceptor.logError(
          DioException(
            requestOptions: RequestOptions(path: '/x'),
            response: Response<dynamic>(
              requestOptions: RequestOptions(path: '/x'),
              statusCode: 400,
              data: {
                'error': {'errorCode': 42, 'description': 'Boom'},
              },
            ),
            type: DioExceptionType.badResponse,
          ),
          'req-1',
        );

        final updated = (await storage.getAll()).single;
        expect(updated.statusCode, 400);
        expect(updated.errorMessage, 'Boom');
        expect(updated.responseBody, contains('"description": "Boom"'));
      });

      test('preserves raw API payload for non-MobileBff errors', () async {
        await errorInterceptor.logRequest(buildEntry(id: 'req-1'));

        await errorInterceptor.logError(
          DioException(
            requestOptions: RequestOptions(path: '/x'),
            response: Response<dynamic>(
              requestOptions: RequestOptions(path: '/x'),
              statusCode: 410,
              data: {
                'status': 'failed',
                'error': {
                  'type': 'auth',
                  'code': 410,
                  'message': 'Session expired',
                },
              },
            ),
            type: DioExceptionType.badResponse,
          ),
          'req-1',
        );

        final updated = (await storage.getAll()).single;
        expect(updated.statusCode, 410);
        expect(updated.errorMessage, 'Session expired');
        expect(updated.responseBody, contains('"message": "Session expired"'));
        expect(updated.responseBody, isNot(contains('unknown error')));
      });

      test(
        'falls back to error.message when no known error fields exist',
        () async {
          await errorInterceptor.logRequest(buildEntry(id: 'req-1'));

          await errorInterceptor.logError(
            DioException(
              requestOptions: RequestOptions(path: '/x'),
              response: Response<dynamic>(
                requestOptions: RequestOptions(path: '/x'),
                statusCode: 500,
                data: {
                  'error': {'description': ''},
                },
              ),
              message: 'socket failure',
              type: DioExceptionType.badResponse,
            ),
            'req-1',
          );

          final updated = (await storage.getAll()).single;
          expect(updated.errorMessage, 'socket failure');
          expect(updated.responseBody, contains('"description": ""'));
        },
      );

      test('does nothing when the request id is unknown', () async {
        await interceptor.logError(
          DioException(requestOptions: RequestOptions(path: '/x')),
          'missing',
        );

        expect(await storage.getAll(), isEmpty);
      });

      test('normalizes non-string-key error maps', () async {
        await errorInterceptor.logRequest(buildEntry(id: 'req-1'));

        await errorInterceptor.logError(
          DioException(
            requestOptions: RequestOptions(path: '/x'),
            response: Response<dynamic>(
              requestOptions: RequestOptions(path: '/x'),
              statusCode: 400,
              data: HashMap<Object?, Object?>.from({
                'error': {'errorCode': 99, 'description': 'Mapped'},
              }),
            ),
            type: DioExceptionType.badResponse,
          ),
          'req-1',
        );

        expect((await storage.getAll()).single.errorMessage, 'Mapped');
      });
    });
  });
}

Response<dynamic> _response({
  int? statusCode,
  dynamic data,
  Map<String, List<String>> headers = const {},
}) => Response<dynamic>(
  requestOptions: RequestOptions(path: '/x'),
  statusCode: statusCode,
  data: data,
  headers: Headers.fromMap(headers),
);
