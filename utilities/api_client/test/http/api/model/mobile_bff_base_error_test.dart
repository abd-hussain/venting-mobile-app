import 'package:api_client/src/http/api/model/mobile_bff_base_error.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MobileBffBaseError', () {
    group('fromJson', () {
      test('should create MobileBffBaseError from valid JSON with error', () {
        // Arrange
        final json = {
          'error': {'errorCode': 400, 'description': 'Bad Request'},
        };

        // Act
        final result = MobileBffBaseError.fromJson(json);

        // Assert
        expect(result.errorCode, equals(400));
        expect(result.description, equals('Bad Request'));
      });

      test('should create MobileBffBaseError from JSON with null error', () {
        // Arrange
        final json = <String, dynamic>{'error': null};

        // Act
        final result = MobileBffBaseError.fromJson(json);

        // Assert
        expect(result.errorCode, equals(0));
        expect(result.description, equals('unknown error'));
      });

      test('should create MobileBffBaseError from empty JSON', () {
        // Arrange
        final json = <String, dynamic>{};

        // Act
        final result = MobileBffBaseError.fromJson(json);

        // Assert
        expect(result.errorCode, equals(0));
        expect(result.description, equals('unknown error'));
      });

      test('should create MobileBffBaseError with partial error data', () {
        // Arrange
        final json = {
          'error': {'errorCode': 500},
        };

        // Act
        final result = MobileBffBaseError.fromJson(json);

        // Assert
        expect(result.errorCode, equals(500));
        expect(result.description, equals('unknown error'));
      });

      test('should create MobileBffBaseError with only description', () {
        // Arrange
        final json = {
          'error': {'description': 'Server Error'},
        };

        // Act
        final result = MobileBffBaseError.fromJson(json);

        // Assert
        expect(result.errorCode, equals(0));
        expect(result.description, equals('Server Error'));
      });
    });

    group('toJson', () {
      test('should convert MobileBffBaseError to JSON', () {
        // Arrange
        final mobileBffBaseError = const MobileBffBaseError(
          errorCode: 500,
          description: 'Internal Server Error',
        );

        // Act
        final result = mobileBffBaseError.toJson();

        // Assert
        expect(
          result,
          equals({
            'error': {'errorCode': 500, 'description': 'Internal Server Error'},
          }),
        );
      });

      test('should convert MobileBffBaseError with default values to JSON', () {
        // Arrange
        final mobileBffBaseError = const MobileBffBaseError();

        // Act
        final result = mobileBffBaseError.toJson();

        // Assert
        expect(
          result,
          equals({
            'error': {'errorCode': 0, 'description': 'unknown error'},
          }),
        );
      });
    });

    group('copyWith', () {
      test('should create copy with new values', () {
        // Arrange
        final original = const MobileBffBaseError(
          errorCode: 400,
          description: 'Bad Request',
        );

        // Act
        final result = original.copyWith(
          errorCode: 500,
          description: 'Internal Server Error',
        );

        // Assert
        expect(result.errorCode, equals(500));
        expect(result.description, equals('Internal Server Error'));
      });

      test(
        'should create copy with same values when no parameter provided',
        () {
          // Arrange
          final original = const MobileBffBaseError(
            errorCode: 404,
            description: 'Not Found',
          );

          // Act
          final result = original.copyWith();

          // Assert
          expect(result.errorCode, equals(404));
          expect(result.description, equals('Not Found'));
        },
      );

      test('should create copy with partial update', () {
        // Arrange
        final original = const MobileBffBaseError(
          errorCode: 400,
          description: 'Bad Request',
        );

        // Act
        final result = original.copyWith(errorCode: 500);

        // Assert
        expect(result.errorCode, equals(500));
        expect(result.description, equals('Bad Request'));
      });
    });

    group('constructor', () {
      test('should create MobileBffBaseError with provided values', () {
        // Act
        final result = const MobileBffBaseError(
          errorCode: 403,
          description: 'Forbidden',
        );

        // Assert
        expect(result.errorCode, equals(403));
        expect(result.description, equals('Forbidden'));
      });

      test('should create MobileBffBaseError with default values', () {
        // Act
        final result = const MobileBffBaseError();

        // Assert
        expect(result.errorCode, equals(0));
        expect(result.description, equals('unknown error'));
      });

      test('should create MobileBffBaseError with partial values', () {
        // Act
        final result = const MobileBffBaseError(errorCode: 429);

        // Assert
        expect(result.errorCode, equals(429));
        expect(result.description, equals('unknown error'));
      });
    });
  });

  group('Global functions', () {
    group('mobileBffBaseErrorFromJson', () {
      test('should parse JSON string to MobileBffBaseError', () {
        // Arrange
        final jsonString =
            '{"error":{"errorCode":400,"description":"Bad Request"}}';

        // Act
        final result = mobileBffBaseErrorFromJson(jsonString);

        // Assert
        expect(result.errorCode, equals(400));
        expect(result.description, equals('Bad Request'));
      });

      test('should parse JSON string with null error', () {
        // Arrange
        final jsonString = '{"error":null}';

        // Act
        final result = mobileBffBaseErrorFromJson(jsonString);

        // Assert
        expect(result.errorCode, equals(0));
        expect(result.description, equals('unknown error'));
      });

      test('should parse empty JSON string', () {
        // Arrange
        final jsonString = '{}';

        // Act
        final result = mobileBffBaseErrorFromJson(jsonString);

        // Assert
        expect(result.errorCode, equals(0));
        expect(result.description, equals('unknown error'));
      });
    });

    group('mobileBffBaseErrorToJson', () {
      test('should convert MobileBffBaseError to JSON string', () {
        // Arrange
        final mobileBffBaseError = const MobileBffBaseError(
          errorCode: 500,
          description: 'Internal Server Error',
        );

        // Act
        final result = mobileBffBaseErrorToJson(mobileBffBaseError);

        // Assert
        final expectedJson =
            '{"error":{"errorCode":500,"description":"Internal Server Error"}}';
        expect(result, equals(expectedJson));
      });

      test(
        'should convert MobileBffBaseError with default values to JSON string',
        () {
          // Arrange
          final mobileBffBaseError = const MobileBffBaseError();

          // Act
          final result = mobileBffBaseErrorToJson(mobileBffBaseError);

          // Assert
          final expectedJson =
              '{"error":{"errorCode":0,"description":"unknown error"}}';
          expect(result, equals(expectedJson));
        },
      );
    });
  });
}
