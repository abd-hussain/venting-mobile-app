import 'package:api_client/src/http/mock_api/mock_response.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(MockResponse, () {
    test('constructs with valid defaults', () {
      final response = MockResponse(body: '{"ok":true}');
      expect(response.code, 200);
      expect(response.body, '{"ok":true}');
      expect(response.delayInMillis, 300);
    });

    test('rejects delay below 300ms', () {
      expect(
        () => MockResponse(delayInMillis: 299),
        throwsA(isA<AssertionError>()),
      );
    });

    test('rejects body and bodyFilePath together', () {
      expect(
        () => MockResponse(body: 'x', bodyFilePath: 'assets/x.json'),
        throwsA(isA<AssertionError>()),
      );
    });
  });
}
