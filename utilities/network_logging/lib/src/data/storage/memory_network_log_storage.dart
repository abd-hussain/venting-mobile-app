import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';

/// Simple in-memory implementation used when persistent storage is not critical.
class MemoryNetworkLogStorage implements NetworkLogStorage {
  MemoryNetworkLogStorage({this.maxEntries = 1000});

  final int maxEntries;
  final List<NetworkLogEntry> _entries = [];

  @override
  Future<void> store(NetworkLogEntry entry) async {
    _entries.removeWhere((e) => e.id == entry.id);
    _entries.add(entry);
    while (_entries.length > maxEntries) {
      _entries.removeAt(0);
    }
  }

  @override
  Future<List<NetworkLogEntry>> getAll() async {
    return List.unmodifiable(_entries);
  }

  @override
  Future<List<NetworkLogEntry>> getByTimeRange(
    DateTime start,
    DateTime end,
  ) async => _entries
      .where(
        (entry) =>
            entry.requestTimestamp.isAfter(start) &&
            entry.requestTimestamp.isBefore(end),
      )
      .toList();

  @override
  Future<List<NetworkLogEntry>> getByUrlPattern(String pattern) async {
    final regex = RegExp(pattern, caseSensitive: false);
    return _entries.where((entry) => regex.hasMatch(entry.url)).toList();
  }

  @override
  Future<List<NetworkLogEntry>> getByStatusCode(
    int? minCode,
    int? maxCode,
  ) async => _entries.where((entry) {
    if (entry.statusCode == null) return false;
    if (minCode != null && entry.statusCode! < minCode) return false;
    if (maxCode != null && entry.statusCode! > maxCode) return false;
    return true;
  }).toList();

  @override
  Future<void> clear() async => _entries.clear();

  @override
  Future<int> getCount() async => _entries.length;

  @override
  Future<void> removeOldEntries(Duration maxAge) async {
    final cutoff = DateTime.now().subtract(maxAge);
    _entries.removeWhere((entry) => entry.requestTimestamp.isBefore(cutoff));
  }

  @override
  Future<int> getMemoryUsage() async {
    // Rough estimate: we can't easily measure memory usage here, so return entry count.
    return _entries.length;
  }
}
