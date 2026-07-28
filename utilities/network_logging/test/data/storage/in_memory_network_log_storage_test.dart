import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/data/storage/in_memory_network_log_storage.dart';

void main() {
  group(InMemoryNetworkLogStorage, () {
    late InMemoryNetworkLogStorage storage;

    setUp(() {
      storage = InMemoryNetworkLogStorage();
    });

    group('store / getAll', () {
      test('stores entries and returns them in insertion order', () async {
        await storage.store(_entry(id: '1'));
        await storage.store(_entry(id: '2'));

        final all = await storage.getAll();

        expect(all.map((e) => e.id), ['1', '2']);
      });

      test('replaces an existing entry with the same id', () async {
        await storage.store(_entry(id: '1'));
        await storage.store(_entry(id: '1', method: 'POST'));

        final all = await storage.getAll();

        expect(all, hasLength(1));
        expect(all.single.method, 'POST');
        expect(await storage.getCount(), 1);
      });
    });

    group('limit enforcement', () {
      test('evicts the oldest entries when maxEntries is exceeded', () async {
        storage = InMemoryNetworkLogStorage(maxEntries: 2);

        await storage.store(_entry(id: '1'));
        await storage.store(_entry(id: '2'));
        await storage.store(_entry(id: '3'));

        final all = await storage.getAll();

        expect(all.map((e) => e.id), ['2', '3']);
        expect(await storage.getCount(), 2);
      });

      test('evicts an entry that exceeds the memory limit', () async {
        storage = InMemoryNetworkLogStorage(maxMemoryBytes: 1);

        await storage.store(_entry(id: '1'));

        expect(await storage.getCount(), 0);
      });
    });

    group('queries', () {
      test(
        'getByTimeRange returns entries strictly inside the range',
        () async {
          final base = DateTime(2024, 1, 1, 12);
          await storage.store(
            _entry(
              id: 'before',
              timestamp: base.subtract(const Duration(hours: 1)),
            ),
          );
          await storage.store(_entry(id: 'inside', timestamp: base));
          await storage.store(
            _entry(id: 'after', timestamp: base.add(const Duration(hours: 2))),
          );

          final result = await storage.getByTimeRange(
            base.subtract(const Duration(minutes: 30)),
            base.add(const Duration(minutes: 30)),
          );

          expect(result.map((e) => e.id), ['inside']);
        },
      );

      test('getByUrlPattern matches case-insensitively', () async {
        await storage.store(_entry(id: '1', url: 'https://api.test/USERS'));
        await storage.store(_entry(id: '2', url: 'https://api.test/orders'));

        final result = await storage.getByUrlPattern('users');

        expect(result.map((e) => e.id), ['1']);
      });

      test('getByStatusCode excludes entries without a status code', () async {
        await storage.store(_entry(id: 'pending'));
        await storage.store(_entry(id: 'ok', statusCode: 200));

        final result = await storage.getByStatusCode(200, 299);

        expect(result.map((e) => e.id), ['ok']);
      });

      test('getByStatusCode honors min and max bounds', () async {
        await storage.store(_entry(id: 'a', statusCode: 199));
        await storage.store(_entry(id: 'b', statusCode: 200));
        await storage.store(_entry(id: 'c', statusCode: 404));
        await storage.store(_entry(id: 'd', statusCode: 500));

        final result = await storage.getByStatusCode(200, 499);

        expect(result.map((e) => e.id), ['b', 'c']);
      });
    });

    group('maintenance', () {
      test('clear removes all entries', () async {
        await storage.store(_entry(id: '1'));
        await storage.store(_entry(id: '2'));

        await storage.clear();

        expect(await storage.getAll(), isEmpty);
        expect(await storage.getCount(), 0);
      });

      test('removeOldEntries drops entries older than maxAge', () async {
        await storage.store(
          _entry(
            id: 'old',
            timestamp: DateTime.now().subtract(const Duration(hours: 2)),
          ),
        );
        await storage.store(_entry(id: 'recent', timestamp: DateTime.now()));

        await storage.removeOldEntries(const Duration(hours: 1));

        final all = await storage.getAll();
        expect(all.map((e) => e.id), ['recent']);
      });

      test('getMemoryUsage grows after storing an entry', () async {
        expect(await storage.getMemoryUsage(), 0);

        await storage.store(_entry(id: '1'));

        expect(await storage.getMemoryUsage(), greaterThan(0));
      });
    });
  });
}

NetworkLogEntry _entry({
  required String id,
  String url = 'https://api.test/users',
  String method = 'GET',
  DateTime? timestamp,
  int? statusCode,
}) => NetworkLogEntry(
  id: id,
  url: url,
  method: method,
  requestTimestamp: timestamp ?? DateTime(2024, 1, 1, 12),
  requestHeaders: const {},
  statusCode: statusCode,
);
