import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/config/dev_network_log_config.dart';
import 'package:network_logging/src/config/network_log_config.dart';
import 'package:network_logging/src/config/production_network_log_config.dart';

void main() {
  group(DevNetworkLogConfig, () {
    const config = DevNetworkLogConfig();

    test('implements NetworkLogConfig with development defaults', () {
      expect(config, isA<NetworkLogConfig>());
      expect(config.isEnabled, isTrue);
      expect(config.maxEntries, 2000);
      expect(config.maxMemoryMB, 100);
      expect(config.retentionPeriod, const Duration(days: 7));
      expect(config.maxBodySize, 1024 * 1024);
      expect(config.logRequestBodies, isTrue);
      expect(config.logResponseBodies, isTrue);
      expect(config.minErrorStatusCode, 400);
      expect(config.sensitiveHeaders, isEmpty);
      expect(config.sensitiveUrlPatterns, isEmpty);
    });
  });

  group(ProductionNetworkLogConfig, () {
    const config = ProductionNetworkLogConfig();

    test('implements NetworkLogConfig with production-safe defaults', () {
      expect(config, isA<NetworkLogConfig>());
      expect(config.isEnabled, isFalse);
      expect(config.maxEntries, 0);
      expect(config.maxMemoryMB, 0);
      expect(config.retentionPeriod, Duration.zero);
      expect(config.maxBodySize, 0);
      expect(config.logRequestBodies, isFalse);
      expect(config.logResponseBodies, isFalse);
      expect(config.minErrorStatusCode, 999);
      expect(config.sensitiveHeaders, isEmpty);
      expect(config.sensitiveUrlPatterns, isEmpty);
    });
  });
}
