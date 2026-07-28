import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart' hide FileOutput;
import 'package:logger_manager/logger_manager.dart';
import 'package:logger_manager/src/file_logger.dart';
import 'package:logger_manager/src/logger_config.dart';

void main() {
  group('LoggerManagerBase', () {
    final captured = <OutputEvent>[];
    late void Function(OutputEvent) listener;

    setUp(() {
      captured.clear();
      LoggerManagerBase.initialize();
      listener = captured.add;
      Logger.addOutputListener(listener);
    });

    tearDown(() {
      Logger.removeOutputListener(listener);
    });

    test('logger getter returns a Logger (lazy init)', () {
      expect(LoggerManagerBase.logger, isA<Logger>());
    });

    test('logDebugMessage logs at debug level', () {
      LoggerManagerBase.logDebugMessage(message: 'hello');
      expect(captured.last.level, Level.debug);
      expect(captured.last.origin.message, 'hello');
    });

    test('logInfo logs at info level', () {
      LoggerManagerBase.logInfo(message: 'hello');
      expect(captured.last.level, Level.info);
      expect(captured.last.origin.message, 'hello');
    });

    test('logWarning logs at warning level', () {
      LoggerManagerBase.logWarning(message: 'careful');
      expect(captured.last.level, Level.warning);
      expect(captured.last.origin.message, 'careful');
    });

    test(
      'logErrorMessage logs at error level with prefix, error and stack',
      () {
        final error = Exception('boom');
        final stack = StackTrace.current;

        LoggerManagerBase.logErrorMessage(
          message: 'failed',
          error: error,
          stackTrace: stack,
        );

        final event = captured.last;
        expect(event.level, Level.error);
        expect(event.origin.message, contains('## ERROR - failed'));
        expect(event.origin.error, error);
        expect(event.origin.stackTrace, stack);
      },
    );

    test('logCritical logs at fatal level with prefix, error and stack', () {
      final error = Exception('fatal');
      final stack = StackTrace.current;

      LoggerManagerBase.logCritical(
        message: 'crashed',
        error: error,
        stackTrace: stack,
      );

      final event = captured.last;
      expect(event.level, Level.fatal);
      expect(event.origin.message, contains('## CRITICAL - crashed'));
      expect(event.origin.error, error);
      expect(event.origin.stackTrace, stack);
    });

    test('production config filters out logs below warning', () {
      LoggerManagerBase.initialize(config: LoggerConfig.production);
      captured.clear();

      LoggerManagerBase.logDebugMessage(message: 'debug');
      LoggerManagerBase.logInfo(message: 'info');
      expect(captured, isEmpty);

      LoggerManagerBase.logWarning(message: 'warn');
      expect(captured.single.level, Level.warning);
    });
  });

  group('FileLogger', () {
    const channel = MethodChannel('plugins.flutter.io/path_provider');
    late Directory tempDir;
    final captured = <OutputEvent>[];
    late void Function(OutputEvent) listener;

    setUp(() async {
      TestWidgetsFlutterBinding.ensureInitialized();
      captured.clear();
      listener = captured.add;
      Logger.addOutputListener(listener);
      tempDir = await Directory.systemTemp.createTemp('logger_manager_test');
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (_) async => tempDir.path);
    });

    tearDown(() async {
      Logger.removeOutputListener(listener);
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, null);
      if (tempDir.existsSync()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('log before initialize returns early without writing', () async {
      FileLogger.log(Level.info, 'should not persist');
      await _flushFileWrites();

      expect(await FileLogger.getLogFilePath(), isNull);
      expect(await FileLogger.readLogs(), isEmpty);
      expect(
        captured.any((event) {
          final message = event.origin.message;
          return message is String && message.contains('not initialized');
        }),
        isTrue,
      );
    });

    test(
      'getLogFilePath readLogs and clearLogs no-op when not initialized',
      () async {
        expect(await FileLogger.getLogFilePath(), isNull);
        expect(await FileLogger.readLogs(), isEmpty);

        await FileLogger.clearLogs();

        expect(await FileLogger.readLogs(), isEmpty);
      },
    );

    test('initialize failure when path_provider throws', () async {
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(channel, (_) async {
            throw PlatformException(code: 'no_path');
          });

      await FileLogger.initialize(fileName: 'failed.txt');

      expect(await FileLogger.getLogFilePath(), isNull);
      expect(
        captured.any((event) {
          final message = event.origin.message;
          return message is String &&
              message.contains('Failed to initialize file logger');
        }),
        isTrue,
      );
    });

    test('initialize points the log file at the documents directory', () async {
      await FileLogger.initialize(fileName: 'test_logs.txt');

      expect(
        await FileLogger.getLogFilePath(),
        '${tempDir.path}/test_logs.txt',
      );
    });

    test('log writes a message that can be read back', () async {
      await FileLogger.initialize(fileName: 'round_trip.txt');

      FileLogger.log(Level.info, 'persisted message');
      await _flushFileWrites();

      expect(await FileLogger.readLogs(), contains('persisted message'));
    });

    test('clearLogs empties the file', () async {
      await FileLogger.initialize(fileName: 'clear.txt');
      FileLogger.log(Level.info, 'to be cleared');
      await _flushFileWrites();

      await FileLogger.clearLogs();

      expect(await FileLogger.readLogs(), isEmpty);
    });

    test('log writes debug warning error and fatal levels', () async {
      await FileLogger.initialize(fileName: 'levels.txt');

      FileLogger.log(Level.debug, 'debug line');
      await _flushFileWrites();
      FileLogger.log(Level.warning, 'warning line');
      await _flushFileWrites();
      FileLogger.log(Level.error, 'error line', error: Exception('boom'));
      await _flushFileWrites();
      FileLogger.log(
        Level.fatal,
        'fatal line',
        error: Exception('fatal'),
        stackTrace: StackTrace.current,
      );
      await _flushFileWrites();

      final contents = await FileLogger.readLogs();
      expect(contents, contains('debug line'));
      expect(contents, contains('warning line'));
      expect(contents, contains('error line'));
      expect(contents, contains('fatal line'));
    });

    test('log uses default branch for unknown level', () async {
      await FileLogger.initialize(fileName: 'default_level.txt');

      FileLogger.log(Level.trace, 'trace falls through to debug');
      await _flushFileWrites();

      expect(
        await FileLogger.readLogs(),
        contains('trace falls through to debug'),
      );
    });
  });

  group('FileOutput', () {
    test('appends each line with a trailing newline', () async {
      final tempDir = await Directory.systemTemp.createTemp('file_output_test');
      final file = File('${tempDir.path}/out.txt');

      await FileOutput(file).output(
        OutputEvent(LogEvent(Level.info, 'x'), ['line one', 'line two']),
      );

      expect(await file.readAsString(), 'line one\nline two\n');
      await tempDir.delete(recursive: true);
    });
  });
}

/// [FileLogger.log] does not await the async file write, so give the append a
/// moment to land before reading the file back.
Future<void> _flushFileWrites() =>
    Future<void>.delayed(const Duration(milliseconds: 50));
