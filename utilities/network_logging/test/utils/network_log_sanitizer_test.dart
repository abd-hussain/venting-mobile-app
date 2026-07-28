import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/config/network_log_config.dart';
import 'package:network_logging/src/utils/network_log_sanitizer.dart';

void main() {
  group(NetworkLogSanitizer, () {
    const config = _TestConfig();
    const sanitizer = NetworkLogSanitizer(config);

    group('sanitizeHeaders', () {
      test('masks a sensitive header value longer than 8 chars', () {
        final result = sanitizer.sanitizeHeaders({
          'Authorization': 'Bearer-secret-token-value',
        });

        // 'Bearer-secret-token-value' -> first4 + '***' + last4
        expect(result['Authorization'], 'Bear***alue');
      });

      test('masks a short sensitive value (<= 8 chars) with ***', () {
        final result = sanitizer.sanitizeHeaders({'Cookie': 'abc123'});

        expect(result['Cookie'], '***');
      });

      test('matches sensitive header keys case-insensitively', () {
        final result = sanitizer.sanitizeHeaders({
          'AUTHORIZATION': 'Bearer-secret-token-value',
        });

        expect(result['AUTHORIZATION'], 'Bear***alue');
      });

      test('matches when the key contains a sensitive token', () {
        final result = sanitizer.sanitizeHeaders({
          'X-Authorization-Token': 'Bearer-secret-token-value',
        });

        expect(result['X-Authorization-Token'], 'Bear***alue');
      });

      test('leaves non-sensitive headers untouched', () {
        final result = sanitizer.sanitizeHeaders({
          'Content-Type': 'application/json',
        });

        expect(result['Content-Type'], 'application/json');
      });

      test('returns an empty map for empty headers', () {
        expect(sanitizer.sanitizeHeaders({}), isEmpty);
      });
    });

    group('sanitizeBody', () {
      test('returns null when body is null', () {
        expect(sanitizer.sanitizeBody(null, 'https://api.test/users'), isNull);
      });

      test('masks the whole body when the URL is sensitive', () {
        final result = sanitizer.sanitizeBody(
          '{"password":"123"}',
          'https://api.test/login',
        );

        expect(result, '[SENSITIVE_DATA_MASKED]');
      });

      test('truncates a body larger than maxBodySize', () {
        final body = 'x' * 30; // maxBodySize is 20 in the test config
        final result = sanitizer.sanitizeBody(body, 'https://api.test/users');

        expect(result, '${'x' * 20}...[TRUNCATED]');
      });

      test(
        'returns the body unchanged when small and URL is not sensitive',
        () {
          final result = sanitizer.sanitizeBody(
            'hello',
            'https://api.test/users',
          );

          expect(result, 'hello');
        },
      );

      test('masks before truncating for a long body on a sensitive URL', () {
        final body = 'x' * 30;
        final result = sanitizer.sanitizeBody(body, 'https://api.test/login');

        expect(result, '[SENSITIVE_DATA_MASKED]');
      });
    });

    group('isSensitiveUrl', () {
      test('matches a configured pattern case-insensitively', () {
        expect(sanitizer.isSensitiveUrl('https://api.test/LOGIN'), isTrue);
      });

      test('returns false for a URL with no sensitive pattern', () {
        expect(sanitizer.isSensitiveUrl('https://api.test/users'), isFalse);
      });
    });
  });
}

class _TestConfig implements NetworkLogConfig {
  const _TestConfig();

  @override
  List<String> get sensitiveHeaders => const ['authorization', 'cookie'];

  @override
  List<String> get sensitiveUrlPatterns => const ['/login', '/password'];

  @override
  int get maxBodySize => 20;

  @override
  bool get isEnabled => true;

  @override
  int get maxEntries => 1000;

  @override
  int get maxMemoryMB => 50;

  @override
  Duration get retentionPeriod => const Duration(days: 1);

  @override
  bool get logRequestBodies => true;

  @override
  bool get logResponseBodies => true;

  @override
  int get minErrorStatusCode => 400;
}
