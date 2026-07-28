import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/data/storage/no_op_network_log_storage.dart';
import 'package:network_logging/src/interceptor/production_network_logger_interceptor.dart';

import '../support/test_support.dart';

void main() {
  group(ProductionNetworkLoggerInterceptor, () {
    test('log hooks are no-ops and the backing storage stays empty', () async {
      final interceptor = ProductionNetworkLoggerInterceptor();

      await interceptor.logRequest(buildEntry(id: '1'));
      await interceptor.logResponse(
        Response<dynamic>(
          requestOptions: RequestOptions(path: '/x'),
          statusCode: 200,
        ),
        '1',
      );
      await interceptor.logError(
        DioException(requestOptions: RequestOptions(path: '/x')),
        '1',
      );

      expect(await interceptor.storage.getAll(), isEmpty);
      expect(await interceptor.storage.getCount(), 0);
    });
  });

  group(NoOpNetworkLogStorage, () {
    late NoOpNetworkLogStorage storage;

    setUp(() => storage = NoOpNetworkLogStorage());

    test('store keeps nothing', () async {
      await storage.store(buildEntry(id: '1'));

      expect(await storage.getAll(), isEmpty);
      expect(await storage.getCount(), 0);
    });

    test('queries return empty and counters return zero', () async {
      expect(
        await storage.getByTimeRange(DateTime(2020), DateTime(2030)),
        isEmpty,
      );
      expect(await storage.getByUrlPattern('.*'), isEmpty);
      expect(await storage.getByStatusCode(200, 299), isEmpty);
      expect(await storage.getMemoryUsage(), 0);
    });

    test('clear and removeOldEntries complete without error', () async {
      await storage.clear();
      await storage.removeOldEntries(const Duration(days: 1));
    });
  });
}
