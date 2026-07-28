import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection/core/connection_exceptions.dart';

void main() {
  group(ConnectionException, () {
    test('stores the provided message', () {
      final exception = ConnectionException(message: 'No Internet Connection');

      expect(exception.message, 'No Internet Connection');
    });

    test('is an Exception', () {
      final exception = ConnectionException(message: 'offline');

      expect(exception, isA<Exception>());
    });
  });
}
