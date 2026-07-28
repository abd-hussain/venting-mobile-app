import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/models/mobile_bff_base_error.dart';

void main() {
  group('MobileBffBaseError', () {
    test('fromJson parses nested error payload', () {
      final error = MobileBffBaseError.fromJson({
        'error': {'errorCode': 42, 'description': 'Invalid request'},
      });

      expect(error.errorCode, 42);
      expect(error.description, 'Invalid request');
    });

    test('fromJson uses defaults when error node is missing', () {
      final error = MobileBffBaseError.fromJson({});

      expect(error.errorCode, 0);
      expect(error.description, 'unknown error');
    });

    test('copyWith and toJson round-trip through top-level helpers', () {
      final original = MobileBffBaseError(errorCode: 1, description: 'A');
      final updated = original.copyWith(description: 'B');
      final encoded = mobileBffBaseErrorToJson(updated);
      final decoded = mobileBffBaseErrorFromJson(encoded);

      expect(updated.description, 'B');
      expect(decoded.errorCode, 1);
      expect(decoded.description, 'B');
    });

    test('copyWith updates errorCode', () {
      final error = MobileBffBaseError(errorCode: 1, description: 'A');
      final updated = error.copyWith(errorCode: 99);

      expect(updated.errorCode, 99);
      expect(updated.description, 'A');
    });
  });
}
