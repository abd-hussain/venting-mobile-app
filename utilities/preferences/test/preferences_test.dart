import 'package:flutter_test/flutter_test.dart';
import 'package:preferences/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('PreferencesImpl', () {
    late VentingPreferences prefs;

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await VentingPreferencesImpl.create();
      await prefs.clear();
    });

    group('setValue / getValue round-trip', () {
      test('stores and reads a String', () async {
        await prefs.setValue<String>('name', 'venting');
        expect(prefs.getValue<String>('name', ''), 'venting');
      });

      test('stores and reads an int', () async {
        await prefs.setValue<int>('count', 7);
        expect(prefs.getValue<int>('count', 0), 7);
      });

      test('stores and reads a bool', () async {
        await prefs.setValue<bool>('flag', true);
        expect(prefs.getValue<bool>('flag', false), isTrue);
      });

      test('stores and reads a double', () async {
        await prefs.setValue<double>('ratio', 1.5);
        expect(prefs.getValue<double>('ratio', 0), 1.5);
      });

      test('stores and reads a List<String>', () async {
        await prefs.setValue<List<String>>('items', ['a', 'b']);
        expect(prefs.getValue<List<String>>('items', const []), ['a', 'b']);
      });

      test('coerces List<Object?> from storage to List<String>', () async {
        SharedPreferences.setMockInitialValues({
          'items': <Object?>['a', 'b'],
        });
        final listPrefs = await VentingPreferencesImpl.create();

        expect(listPrefs.getValue<List<String>>('items', const []), ['a', 'b']);
      });
    });

    test('getValue returns the default when the key is absent', () {
      expect(prefs.getValue<String>('missing', 'fallback'), 'fallback');
      expect(prefs.getValue<int>('missing', -1), -1);
    });

    test('getValue throws when the stored type does not match', () async {
      await prefs.setValue<String>('token', 'abc');
      expect(() => prefs.getValue<int>('token', 0), throwsException);
    });

    test('setValue throws for an unsupported type', () async {
      await expectLater(
        prefs.setValue<DateTime>('when', DateTime(2025)),
        throwsException,
      );
    });

    test('isKeyExist reflects whether a key is stored', () async {
      expect(prefs.isKeyExist('k'), isFalse);
      await prefs.setValue<String>('k', 'v');
      expect(prefs.isKeyExist('k'), isTrue);
    });

    test('remove deletes a single key', () async {
      await prefs.setValue<String>('k', 'v');

      final removed = await prefs.remove('k');

      expect(removed, isTrue);
      expect(prefs.isKeyExist('k'), isFalse);
    });

    test('clear removes all keys', () async {
      await prefs.setValue<String>('a', '1');
      await prefs.setValue<int>('b', 2);

      await prefs.clear();

      expect(prefs.isKeyExist('a'), isFalse);
      expect(prefs.isKeyExist('b'), isFalse);
    });
  });

  group('MainPreferences', () {
    test('create returns a VentingPreferences instance', () async {
      SharedPreferences.setMockInitialValues({});

      final prefs = await MainPreferences.create();

      expect(prefs, isA<VentingPreferences>());
    });
  });
}
