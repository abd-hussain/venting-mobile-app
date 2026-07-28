import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/utils/network_error_extractor.dart';

void main() {
  group('formatResponseBody', () {
    test('returns null for null data', () {
      expect(formatResponseBody(null), isNull);
    });

    test('returns string data as-is', () {
      expect(formatResponseBody('plain text'), 'plain text');
    });

    test('pretty-prints map data', () {
      final formatted = formatResponseBody({
        'status': 'failed',
        'error': {'message': 'Gone'},
      });

      expect(formatted, contains('"status": "failed"'));
      expect(formatted, contains('"message": "Gone"'));
    });

    test('falls back to toString when json encoding fails', () {
      final formatted = formatResponseBody({'value': _NonJsonEncodable()});

      expect(formatted, contains('NonJsonEncodable'));
    });

    test('falls back to toString for unsupported types', () {
      expect(formatResponseBody(42), '42');
    });
  });

  group('normalizeErrorJson', () {
    test('copies untyped maps', () {
      expect(normalizeErrorJson(<dynamic, dynamic>{'status': 'failed'}), {
        'status': 'failed',
      });
    });

    test('converts JSON object string payloads', () {
      expect(normalizeErrorJson('{"status":"failed"}'), {'status': 'failed'});
    });
  });

  group('extractErrorMessage', () {
    test('extracts MobileBff description', () {
      expect(
        extractErrorMessage({
          'error': {'errorCode': 42, 'description': 'Boom'},
        }),
        'Boom',
      );
    });

    test('extracts MainAPI message', () {
      expect(
        extractErrorMessage({
          'status': 'failed',
          'error': {'type': 'auth', 'code': 410, 'message': 'Session expired'},
        }),
        'Session expired',
      );
    });

    test('extracts root message', () {
      expect(
        extractErrorMessage({'message': 'Resource no longer available'}),
        'Resource no longer available',
      );
    });

    test('extracts plain string body', () {
      expect(extractErrorMessage('Service unavailable'), 'Service unavailable');
    });

    test('extracts message from JSON string body', () {
      expect(
        extractErrorMessage(
          '{"status":"failed","error":{"message":"Version deprecated"}}',
        ),
        'Version deprecated',
      );
    });

    test('falls back when payload has no known fields', () {
      expect(
        extractErrorMessage({'foo': 'bar'}, fallback: 'socket failure'),
        'socket failure',
      );
    });

    test('copies non-typed error maps before reading fields', () {
      expect(
        extractErrorMessage({
          'error': <dynamic, dynamic>{'message': 'from dynamic map'},
        }),
        'from dynamic map',
      );
    });

    test('extracts first non-empty localized_message value', () {
      expect(
        extractErrorMessage({
          'error': {
            'localized_message': {'en': '', 'ar': 'مرحبا', 'ckb': 'سڵاو'},
          },
        }),
        'مرحبا',
      );
    });

    test('extracts string error node', () {
      expect(extractErrorMessage({'error': 'plain failure'}), 'plain failure');
    });
  });
}

class _NonJsonEncodable {
  @override
  String toString() => 'NonJsonEncodable';
}
