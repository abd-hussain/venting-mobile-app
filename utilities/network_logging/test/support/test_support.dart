import 'package:network_logging/src/config/network_log_config.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';

/// Builds a [NetworkLogEntry] with sensible defaults for tests.
NetworkLogEntry buildEntry({
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

/// A configurable [NetworkLogConfig] for tests. Defaults to a non-empty set of
/// sensitive headers/URL patterns and a small body size so masking/truncation
/// can be exercised.
class TestNetworkLogConfig implements NetworkLogConfig {
  const TestNetworkLogConfig({
    this.isEnabled = true,
    this.sensitiveHeaders = const ['authorization', 'cookie'],
    this.sensitiveUrlPatterns = const ['/login', '/password'],
    this.maxBodySize = 20,
    this.logRequestBodies = true,
    this.logResponseBodies = true,
  });

  @override
  final bool isEnabled;

  @override
  final List<String> sensitiveHeaders;

  @override
  final List<String> sensitiveUrlPatterns;

  @override
  final int maxBodySize;

  @override
  final bool logRequestBodies;

  @override
  final bool logResponseBodies;

  @override
  int get maxEntries => 1000;

  @override
  int get maxMemoryMB => 50;

  @override
  Duration get retentionPeriod => const Duration(days: 1);

  @override
  int get minErrorStatusCode => 400;
}
