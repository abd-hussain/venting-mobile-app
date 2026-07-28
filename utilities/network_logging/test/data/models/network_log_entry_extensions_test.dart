import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';

import '../../support/test_support.dart';

void main() {
  group('NetworkLogEntryExtensions', () {
    test('hasError and isComplete reflect entry state', () {
      final pending = buildEntry(id: 'pending');
      final failed = buildEntry(id: 'failed').copyWith(
        errorMessage: 'timeout',
        responseTimestamp: DateTime(2024, 1, 1, 13),
      );

      expect(pending.hasError, isFalse);
      expect(pending.isComplete, isFalse);
      expect(failed.hasError, isTrue);
      expect(failed.isComplete, isTrue);
    });

    test('isSocket and isHttp distinguish event types', () {
      final http = buildEntry(id: 'http');
      final socket = buildEntry(id: 'socket').copyWith(
        eventType: NetworkEventType.socket,
        socketEvent: 'SubscribeToQuotes',
      );

      expect(http.isHttp, isTrue);
      expect(http.isSocket, isFalse);
      expect(socket.isSocket, isTrue);
      expect(socket.isHttp, isFalse);
    });

    test('statusText maps status codes', () {
      expect(buildEntry(id: 'pending').statusText, 'Pending');
      expect(buildEntry(id: 'ok', statusCode: 200).statusText, 'Success');
      expect(
        buildEntry(id: 'client', statusCode: 404).statusText,
        'Client Error',
      );
      expect(
        buildEntry(id: 'server', statusCode: 500).statusText,
        'Server Error',
      );
      expect(buildEntry(id: 'unknown', statusCode: 301).statusText, 'Unknown');
    });

    test('displayEventName extracts HTTP path or socket event', () {
      final http = buildEntry(
        id: 'http',
        url: 'https://api.test/v1/users?page=1',
      );
      final rootPath = buildEntry(id: 'root', url: 'https://api.test');
      final socket = buildEntry(id: 'socket').copyWith(
        eventType: NetworkEventType.socket,
        socketEvent: 'SubscribeToQuotes',
      );

      expect(http.displayEventName, '/v1/users');
      expect(rootPath.displayEventName, '/');
      expect(socket.displayEventName, 'SubscribeToQuotes');
    });

    test('displayEventName returns raw url when parsing fails', () {
      final invalidUrl = buildEntry(id: 'bad', url: '::');

      expect(invalidUrl.displayEventName, '::');
    });

    test('fromJson and toJson round-trip socket metadata', () {
      final entry = buildEntry(id: 'socket').copyWith(
        eventType: NetworkEventType.socket,
        responseTimestamp: DateTime(2024, 1, 1, 13),
        socketEvent: 'SubscribeToQuotes',
        socketTargets: const ['quotes'],
        socketArgs: const [1, 'arg'],
      );

      final restored = NetworkLogEntry.fromJson(entry.toJson());

      expect(restored.socketEvent, 'SubscribeToQuotes');
      expect(restored.socketTargets, ['quotes']);
      expect(restored.socketArgs, [1, 'arg']);
      expect(restored.responseTimestamp, entry.responseTimestamp);
    });

    test('displayMethod returns method for HTTP and socket entries', () {
      final http = buildEntry(id: 'http', method: 'POST');
      final socket = buildEntry(
        id: 'socket',
        method: 'SUBSCRIBE',
      ).copyWith(eventType: NetworkEventType.socket);

      expect(http.displayMethod, 'POST');
      expect(socket.displayMethod, 'SUBSCRIBE');
    });
  });
}
