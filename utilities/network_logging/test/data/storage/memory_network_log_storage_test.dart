import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/storage/memory_network_log_storage.dart';

import '../../support/test_support.dart';

void main() {
  group(MemoryNetworkLogStorage, () {
    late MemoryNetworkLogStorage storage;

    setUp(() => storage = MemoryNetworkLogStorage());

    test('stores entries and replaces by id', () async {
      await storage.store(buildEntry(id: '1'));
      await storage.store(buildEntry(id: '1', method: 'POST'));

      final all = await storage.getAll();
      expect(all, hasLength(1));
      expect(all.single.method, 'POST');
    });

    test('evicts the oldest entry beyond maxEntries', () async {
      storage = MemoryNetworkLogStorage(maxEntries: 2);

      await storage.store(buildEntry(id: '1'));
      await storage.store(buildEntry(id: '2'));
      await storage.store(buildEntry(id: '3'));

      expect((await storage.getAll()).map((e) => e.id), ['2', '3']);
    });

    test('getAll returns an unmodifiable list', () async {
      await storage.store(buildEntry(id: '1'));

      final all = await storage.getAll();
      expect(() => all.add(buildEntry(id: '2')), throwsUnsupportedError);
    });

    test('getByUrlPattern matches case-insensitively', () async {
      await storage.store(buildEntry(id: '1', url: 'https://api.test/USERS'));
      await storage.store(buildEntry(id: '2', url: 'https://api.test/orders'));

      expect((await storage.getByUrlPattern('users')).map((e) => e.id), ['1']);
    });

    test('getByStatusCode honors bounds and skips null codes', () async {
      await storage.store(buildEntry(id: 'none'));
      await storage.store(buildEntry(id: 'a', statusCode: 200));
      await storage.store(buildEntry(id: 'b', statusCode: 500));

      expect((await storage.getByStatusCode(200, 299)).map((e) => e.id), ['a']);
    });

    test('getByTimeRange filters strictly inside the range', () async {
      final base = DateTime(2024, 1, 1, 12);
      await storage.store(buildEntry(id: 'in', timestamp: base));
      await storage.store(
        buildEntry(id: 'out', timestamp: base.add(const Duration(hours: 2))),
      );

      final result = await storage.getByTimeRange(
        base.subtract(const Duration(minutes: 1)),
        base.add(const Duration(minutes: 1)),
      );

      expect(result.map((e) => e.id), ['in']);
    });

    test('clear empties storage and getCount reflects it', () async {
      await storage.store(buildEntry(id: '1'));
      expect(await storage.getCount(), 1);

      await storage.clear();
      expect(await storage.getCount(), 0);
    });

    test('removeOldEntries drops entries older than maxAge', () async {
      await storage.store(
        buildEntry(
          id: 'old',
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        ),
      );
      await storage.store(buildEntry(id: 'new', timestamp: DateTime.now()));

      await storage.removeOldEntries(const Duration(hours: 1));

      expect((await storage.getAll()).map((e) => e.id), ['new']);
    });

    test('getMemoryUsage returns the entry count (documented quirk)', () async {
      await storage.store(buildEntry(id: '1'));
      await storage.store(buildEntry(id: '2'));

      expect(await storage.getMemoryUsage(), 2);
    });
  });
}
