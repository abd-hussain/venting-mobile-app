import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';
import 'package:path_provider/path_provider.dart';

/// Persistent file-based storage for network logs
/// Stores logs in a JSON file and persists them across app restarts
class PersistentNetworkLogStorage implements NetworkLogStorage {
  final int maxEntries;
  final Duration retentionPeriod;
  final String _fileName = 'network_logs.json';

  List<NetworkLogEntry> _entries = [];
  Map<String, NetworkLogEntry> _entriesById = <String, NetworkLogEntry>{};
  File? _logFile;
  bool _isInitialized = false;
  bool _initializationFailed = false;

  @visibleForTesting
  static bool? debugIsWeb;

  @visibleForTesting
  static Future<void> Function(Duration)? debugRemoveOldEntries;

  @visibleForTesting
  static bool debugThrowOnEnforceLimits = false;

  @visibleForTesting
  static bool debugThrowBeforeEnforce = false;

  @visibleForTesting
  static bool debugRethrowSaveErrors = false;

  @visibleForTesting
  static void resetTestOverrides() {
    debugIsWeb = null;
    debugRemoveOldEntries = null;
    debugThrowOnEnforceLimits = false;
    debugThrowBeforeEnforce = false;
    debugRethrowSaveErrors = false;
  }

  bool get _isWebPlatform => debugIsWeb ?? kIsWeb;

  PersistentNetworkLogStorage({
    this.maxEntries = 200000,
    this.retentionPeriod = const Duration(days: 7),
  });

  /// Initialize storage by loading existing logs from file
  Future<void> _ensureInitialized() async {
    if (_isInitialized) return;

    // Skip file operations on web platform
    if (_isWebPlatform) {
      _initializationFailed = true;
      _isInitialized = true;
      LoggerManagerBase.logErrorMessage(
        message:
            'PersistentNetworkLogStorage: File storage not supported on web, using in-memory only',
        error: null,
      );
      return;
    }

    try {
      // Add timeout to prevent blocking indefinitely
      final directory = await getApplicationDocumentsDirectory().timeout(
        const Duration(seconds: 5),
      );
      _logFile = File('${directory.path}/$_fileName');

      // Load existing logs if file exists
      final fileExists = await _logFile!.exists();
      if (fileExists) {
        await _loadFromFile().timeout(const Duration(seconds: 5));
      }

      // Cleanup old entries on initialization (non-blocking)
      // Only cleanup if we have entries loaded
      if (_entries.isNotEmpty) {
        final beforeCleanup = _entries.length;
        final removeOld = debugRemoveOldEntries ?? _removeOldEntriesInternal;
        await removeOld(retentionPeriod).catchError((e) {
          LoggerManagerBase.logErrorMessage(
            message: 'PersistentNetworkLogStorage: Cleanup failed: $e',
            error: e,
          );
        });
        final afterCleanup = _entries.length;
        if (kDebugMode && beforeCleanup != afterCleanup) {
          LoggerManagerBase.logInfo(
            message:
                'PersistentNetworkLogStorage: Cleaned up ${beforeCleanup - afterCleanup} old entries on initialization',
          );
        }
      }

      _isInitialized = true;
      _initializationFailed = false;
      if (kDebugMode) {
        LoggerManagerBase.logInfo(
          message:
              'PersistentNetworkLogStorage: Initialized successfully with ${_entries.length} existing entries',
        );
      }
    } catch (e) {
      // If initialization fails, start with empty storage but continue working
      // Don't clear entries if they were already loaded
      if (_entries.isEmpty) {
        _entries = [];
        _entriesById = {};
      }
      _initializationFailed = true;
      _isInitialized = true;
      LoggerManagerBase.logErrorMessage(
        message:
            'PersistentNetworkLogStorage: Initialization failed, using in-memory only. Error: $e',
        error: e,
      );
    }
  }

  /// Load logs from JSON file
  Future<void> _loadFromFile() async {
    if (_logFile == null || !await _logFile!.exists()) {
      return;
    }

    try {
      final fileContent = await _logFile!.readAsString();
      if (fileContent.isEmpty) {
        _entries = [];
        _entriesById = {};
        return;
      }

      final jsonData = jsonDecode(fileContent) as Map<String, dynamic>;
      final entriesList = jsonData['entries'] as List<dynamic>? ?? [];

      _entries = entriesList
          .map((e) => NetworkLogEntry.fromJson(e as Map<String, dynamic>))
          .toList();

      _entriesById = {for (final entry in _entries) entry.id: entry};
    } catch (e) {
      // If loading fails, start with empty storage
      _entries = [];
      _entriesById = {};
      LoggerManagerBase.logErrorMessage(
        message: 'PersistentNetworkLogStorage: Failed to load from file: $e',
        error: e,
      );
    }
  }

  /// Save logs to JSON file
  Future<void> _saveToFile() async {
    // Skip saving if initialization failed or on web
    if (_logFile == null || _initializationFailed || _isWebPlatform) return;

    try {
      final jsonData = {
        'entries': _entries.map((e) => e.toJson()).toList(),
        'lastUpdated': DateTime.now().toIso8601String(),
      };

      await _logFile!.writeAsString(jsonEncode(jsonData));
    } catch (e) {
      if (debugRethrowSaveErrors) {
        rethrow;
      }
      // Silently fail - logging errors shouldn't break the app
      LoggerManagerBase.logErrorMessage(
        message: 'PersistentNetworkLogStorage: Failed to save to file: $e',
        error: e,
      );
    }
  }

  @override
  Future<void> store(NetworkLogEntry entry) async {
    try {
      await _ensureInitialized();

      // Remove existing entry with same ID (for updates)
      if (_entriesById.containsKey(entry.id)) {
        _entries.removeWhere((e) => e.id == entry.id);
      }

      _entries.add(entry);
      _entriesById[entry.id] = entry;

      if (debugThrowBeforeEnforce) {
        throw Exception('store failed before enforce');
      }

      // Enforce limits
      await _enforceLimits();

      // Save to file after each store operation (non-blocking)
      await _saveToFile().catchError((e) {
        LoggerManagerBase.logErrorMessage(
          message: 'PersistentNetworkLogStorage: Failed to save entry: $e',
          error: e,
        );
      });
    } catch (e) {
      // Never let storage errors break the app
      // Even if initialization failed, still store in memory
      try {
        _entries.add(entry);
        _entriesById[entry.id] = entry;
        await _enforceLimits();
        if (kDebugMode) {
          LoggerManagerBase.logInfo(
            message:
                'PersistentNetworkLogStorage: Stored entry in memory (file storage failed)',
          );
        }
      } catch (memoryError) {
        LoggerManagerBase.logErrorMessage(
          message:
              'PersistentNetworkLogStorage: Failed to store entry even in memory: $memoryError',
          error: memoryError,
        );
      }
      LoggerManagerBase.logErrorMessage(
        message: 'PersistentNetworkLogStorage: Failed to store entry: $e',
        error: e,
      );
    }
  }

  @override
  Future<List<NetworkLogEntry>> getAll() async {
    await _ensureInitialized();
    if (kDebugMode) {
      LoggerManagerBase.logInfo(
        message:
            'PersistentNetworkLogStorage: getAll() returning ${_entries.length} entries',
      );
    }
    return List.unmodifiable(_entries);
  }

  @override
  Future<List<NetworkLogEntry>> getByTimeRange(
    DateTime start,
    DateTime end,
  ) async {
    await _ensureInitialized();
    return _entries
        .where(
          (entry) =>
              entry.requestTimestamp.isAfter(start) &&
              entry.requestTimestamp.isBefore(end),
        )
        .toList();
  }

  @override
  Future<List<NetworkLogEntry>> getByUrlPattern(String pattern) async {
    await _ensureInitialized();
    final regex = RegExp(pattern, caseSensitive: false);
    return _entries.where((entry) => regex.hasMatch(entry.url)).toList();
  }

  @override
  Future<List<NetworkLogEntry>> getByStatusCode(
    int? minCode,
    int? maxCode,
  ) async {
    await _ensureInitialized();
    return _entries.where((entry) {
      if (entry.statusCode == null) return false;
      if (minCode != null && entry.statusCode! < minCode) return false;
      if (maxCode != null && entry.statusCode! > maxCode) return false;
      return true;
    }).toList();
  }

  @override
  Future<void> clear() async {
    await _ensureInitialized();
    _entries.clear();
    _entriesById.clear();
    await _saveToFile();
  }

  @override
  Future<int> getCount() async {
    await _ensureInitialized();
    return _entries.length;
  }

  @override
  Future<void> removeOldEntries(Duration maxAge) async {
    await _ensureInitialized();
    await _removeOldEntriesInternal(maxAge);
  }

  Future<void> _removeOldEntriesInternal(Duration maxAge) async {
    final cutoff = DateTime.now().subtract(maxAge);
    final initialCount = _entries.length;

    // Only remove entries that are older than the cutoff
    _entries.removeWhere((entry) => entry.requestTimestamp.isBefore(cutoff));
    _entriesById.removeWhere(
      (_, entry) => entry.requestTimestamp.isBefore(cutoff),
    );

    // Save to file if entries were removed
    if (_entries.length != initialCount) {
      if (kDebugMode) {
        LoggerManagerBase.logInfo(
          message:
              'PersistentNetworkLogStorage: Removed ${initialCount - _entries.length} entries older than ${maxAge.inDays} days',
        );
      }
      await _saveToFile();
    }
  }

  @override
  Future<int> getMemoryUsage() async {
    await _ensureInitialized();
    int totalBytes = 0;
    for (final entry in _entries) {
      totalBytes += _calculateEntrySize(entry);
    }
    return totalBytes;
  }

  /// Enforce entry limits (max entries)
  Future<void> _enforceLimits() async {
    if (debugThrowOnEnforceLimits) {
      throw Exception('enforce limits failed');
    }
    // Remove oldest entries if we exceed max count
    while (_entries.length > maxEntries) {
      final removed = _entries.removeAt(0);
      _entriesById.remove(removed.id);
    }
  }

  /// Calculate approximate size of an entry in bytes
  int _calculateEntrySize(NetworkLogEntry entry) {
    // Rough estimation of memory usage
    final json = entry.toJson();
    return utf8.encode(jsonEncode(json)).length;
  }
}
