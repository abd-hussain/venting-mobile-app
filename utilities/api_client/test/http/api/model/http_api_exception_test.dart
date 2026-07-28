import 'package:api_client/src/http/api/model/http_api_exception.dart';
import 'package:api_client/src/http/api/model/mobile_bff_base_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(ClientException, () {
    test('toString includes message, statusCode, cause, and stackTrace', () {
      final cause = Exception('root');
      final stack = StackTrace.current;
      final error = ClientException(
        message: 'bad request',
        statusCode: 400,
        cause: cause,
        stackTrace: stack,
        mobileBffBaseError: const MobileBffBaseError(
          errorCode: 1,
          description: 'Invalid',
        ),
      );

      final text = error.toString();
      expect(text, contains('bad request'));
      expect(text, contains('400'));
      expect(text, contains('$cause'));
      expect(text, contains('$stack'));
    });
  });

  group(ConnectionException, () {
    test('toString includes message, statusCode, cause, and bff error', () {
      final cause = Exception('timeout');
      final stack = StackTrace.current;
      final error = ConnectionException(
        message: 'offline',
        statusCode: 503,
        cause: cause,
        stackTrace: stack,
        mobileBffBaseError: const MobileBffBaseError(
          errorCode: 2,
          description: 'Unavailable',
        ),
      );

      final text = error.toString();
      expect(text, contains('offline'));
      expect(text, contains('503'));
      expect(text, contains('$cause'));
      expect(text, contains('2'));
    });
  });
}
