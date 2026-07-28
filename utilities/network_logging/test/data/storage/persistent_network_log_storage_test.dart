import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/storage/persistent_network_log_storage.dart';

import '../../support/test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const channel = MethodChannel('plugins.flutter.io/path_provider');
  late Directory tempDir;

  setUp(() async {
    tempDir = await Directory.systemTemp.createTemp('persistent_log_test');
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (call) async {
          if (call.method == 'getApplicationDocumentsDirectory') {
            return tempDir.path;
          }
          return null;
        });
  });

  tearDown(() async {
    PersistentNetworkLogStorage.resetTestOverrides();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
    if (tempDir.existsSync()) await tempDir.delete(recursive: true);
  });

  group(PersistentNetworkLogStorage, () {
    test('stores and retrieves entries', () async {
      final storage = PersistentNetworkLogStorage();

      await storage.store(buildEntry(id: '1'));

      expect((await storage.getAll()).single.id, '1');
    });

    test('persists entries across instances (save + reload)', () async {
      final first = PersistentNetworkLogStorage();
      await first.store(buildEntry(id: 'persisted', timestamp: DateTime.now()));

      final second = PersistentNetworkLogStorage();
      expect((await second.getAll()).map((e) => e.id), ['persisted']);
    });

    test('replaces entries with the same id', () async {
      final storage = PersistentNetworkLogStorage();

      await storage.store(buildEntry(id: '1'));
      await storage.store(buildEntry(id: '1', method: 'POST'));

      final all = await storage.getAll();
      expect(all, hasLength(1));
      expect(all.single.method, 'POST');
    });

    test('enforces maxEntries', () async {
      final storage = PersistentNetworkLogStorage(maxEntries: 2);

      await storage.store(buildEntry(id: '1'));
      await storage.store(buildEntry(id: '2'));
      await storage.store(buildEntry(id: '3'));

      expect((await storage.getAll()).map((e) => e.id), ['2', '3']);
    });

    test('removes entries older than retention on initialization', () async {
      final file = File('${tempDir.path}/network_logs.json');
      await file.writeAsString(
        jsonEncode({
          'entries': [
            buildEntry(
              id: 'old',
              timestamp: DateTime.now().subtract(const Duration(days: 10)),
            ).toJson(),
            buildEntry(id: 'recent', timestamp: DateTime.now()).toJson(),
          ],
          'lastUpdated': DateTime.now().toIso8601String(),
        }),
      );

      final storage = PersistentNetworkLogStorage(
        retentionPeriod: const Duration(days: 5),
      );

      expect((await storage.getAll()).map((e) => e.id), ['recent']);
    });

    test('clear empties storage and persists the empty state', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: '1', timestamp: DateTime.now()));

      await storage.clear();
      expect(await storage.getAll(), isEmpty);

      final reopened = PersistentNetworkLogStorage();
      expect(await reopened.getAll(), isEmpty);
    });

    test('queries by status code and url pattern', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: 'a', statusCode: 200));
      await storage.store(
        buildEntry(id: 'b', url: 'https://api.test/orders', statusCode: 500),
      );

      expect((await storage.getByStatusCode(200, 299)).map((e) => e.id), ['a']);
      expect((await storage.getByUrlPattern('orders')).map((e) => e.id), ['b']);
    });

    test('getMemoryUsage grows after storing an entry', () async {
      final storage = PersistentNetworkLogStorage();

      await storage.store(buildEntry(id: '1'));

      expect(await storage.getMemoryUsage(), greaterThan(0));
    });

    test('loads empty file without error', () async {
      final file = File('${tempDir.path}/network_logs.json');
      await file.writeAsString('');

      final storage = PersistentNetworkLogStorage();
      expect(await storage.getAll(), isEmpty);
    });

    test('recovers from corrupt JSON on disk', () async {
      final file = File('${tempDir.path}/network_logs.json');
      await file.writeAsString('{not valid json');

      final storage = PersistentNetworkLogStorage();
      expect(await storage.getAll(), isEmpty);
    });

    test('continues in memory when initialization fails', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (call) async {
            throw PlatformException(code: 'no_dir');
          });

      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: 'mem-only'));

      expect((await storage.getAll()).single.id, 'mem-only');
    });

    test('logs save failure without breaking store', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: '1'));

      final file = File('${tempDir.path}/network_logs.json');
      await file.delete();
      await Directory('${tempDir.path}/network_logs.json').create();

      await storage.store(buildEntry(id: '2'));

      expect(
        (await storage.getAll()).map((e) => e.id),
        containsAll(['1', '2']),
      );
    });

    test('getByTimeRange returns entries within range', () async {
      final storage = PersistentNetworkLogStorage();
      final start = DateTime(2024, 6, 1, 10);
      final inside = DateTime(2024, 6, 1, 12);
      final end = DateTime(2024, 6, 1, 14);

      await storage.store(buildEntry(id: 'inside', timestamp: inside));
      await storage.store(
        buildEntry(id: 'outside', timestamp: DateTime(2024, 6, 2, 12)),
      );

      final results = await storage.getByTimeRange(start, end);
      expect(results.map((e) => e.id), ['inside']);
    });

    test('removeOldEntries drops entries older than maxAge', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(
        buildEntry(
          id: 'old',
          timestamp: DateTime.now().subtract(const Duration(days: 10)),
        ),
      );
      await storage.store(buildEntry(id: 'recent', timestamp: DateTime.now()));

      await storage.removeOldEntries(const Duration(days: 5));

      expect((await storage.getAll()).map((e) => e.id), ['recent']);
    });

    test('getCount returns number of stored entries', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: '1'));
      await storage.store(buildEntry(id: '2'));

      expect(await storage.getCount(), 2);
    });

    test('enforces maxEntries by removing oldest beyond limit', () async {
      final storage = PersistentNetworkLogStorage(maxEntries: 3);

      for (var i = 1; i <= 6; i++) {
        await storage.store(buildEntry(id: '$i'));
      }

      expect((await storage.getAll()).map((e) => e.id), ['4', '5', '6']);
    });

    test('getByStatusCode excludes entries without status code', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: 'pending'));
      await storage.store(buildEntry(id: 'ok', statusCode: 200));

      expect((await storage.getByStatusCode(200, 299)).map((e) => e.id), [
        'ok',
      ]);
    });

    test('uses in-memory only on web platform', () async {
      PersistentNetworkLogStorage.debugIsWeb = true;

      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: 'web-only'));

      expect((await storage.getAll()).single.id, 'web-only');
    });

    test('logs cleanup failure during initialization', () async {
      final file = File('${tempDir.path}/network_logs.json');
      await file.writeAsString(
        jsonEncode({
          'entries': [
            buildEntry(
              id: 'old',
              timestamp: DateTime.now().subtract(const Duration(days: 30)),
            ).toJson(),
          ],
        }),
      );

      PersistentNetworkLogStorage.debugRemoveOldEntries = (_) async {
        throw Exception('cleanup failed');
      };

      final storage = PersistentNetworkLogStorage();
      expect(await storage.getAll(), isNotEmpty);
    });

    test('stores in memory when enforce limits throws', () async {
      final storage = PersistentNetworkLogStorage();
      PersistentNetworkLogStorage.debugThrowOnEnforceLimits = true;

      await storage.store(buildEntry(id: 'fallback'));

      expect((await storage.getAll()).map((e) => e.id), contains('fallback'));
    });

    test('logs save failure during store', () async {
      final storage = PersistentNetworkLogStorage();
      await storage.store(buildEntry(id: '1'));
      PersistentNetworkLogStorage.debugRethrowSaveErrors = true;

      final file = File('${tempDir.path}/network_logs.json');
      await file.delete();
      await Directory('${tempDir.path}/network_logs.json').create();

      await storage.store(buildEntry(id: '2'));

      expect(
        (await storage.getAll()).map((e) => e.id),
        containsAll(['1', '2']),
      );
    });

    test('falls back to memory when store throws before enforce', () async {
      final storage = PersistentNetworkLogStorage();
      PersistentNetworkLogStorage.debugThrowBeforeEnforce = true;

      await storage.store(buildEntry(id: 'memory-fallback'));

      expect(
        (await storage.getAll()).where((e) => e.id == 'memory-fallback').length,
        greaterThanOrEqualTo(1),
      );
    });
  });
}
