import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/ui/network_logging_bottom_sheet.dart';
import 'package:network_logging/src/ui/widgets/sharing_sheet.dart';
import 'package:share_plus/share_plus.dart';

class _FakeBuildContext extends Fake implements BuildContext {
  @override
  bool get mounted => true;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const pathProviderChannel = MethodChannel('plugins.flutter.io/path_provider');
  const emailChannel = MethodChannel('flutter_email_sender');
  const shareChannel = MethodChannel('dev.fluttercommunity.plus/share');

  late Directory tempDir;
  late _FakeBuildContext context;
  final messages = <String>[];

  setUp(() {
    tempDir = Directory(
      '${Directory.systemTemp.path}/sharing_unit_${DateTime.now().microsecondsSinceEpoch}',
    )..createSync(recursive: true);
    context = _FakeBuildContext();
    messages.clear();

    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, (call) async {
          if (call.method == 'getApplicationDocumentsDirectory') {
            return tempDir.path;
          }
          return null;
        });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(emailChannel, (call) async => null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(shareChannel, (call) async => 'success');

    SharingSheet.resetTestOverrides();
    SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);
    SharingSheet.debugGetApplicationDocumentsDirectory = () async => tempDir;
    SharingSheet.debugCreateJsonFile = (jsonData) async {
      final file = File('${tempDir.path}/network_logs.json');
      await file.writeAsString(jsonData);
      return file;
    };
    SharingSheet.debugShareXFiles = ({required files, text, subject}) async =>
        const ShareResult('ok', ShareResultStatus.success);
    SharingSheet.debugSetClipboard = (_) async {};
  });

  tearDown(() {
    SharingSheet.resetTestOverrides();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(pathProviderChannel, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(emailChannel, null);
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(shareChannel, null);
    if (tempDir.existsSync()) {
      tempDir.deleteSync(recursive: true);
    }
  });

  group('SharingSheet unit coverage', () {
    test('can be constructed', () {
      final sheet = const SharingSheet();
      expect(sheet, isA<SharingSheet>());
    });

    test('resetTestOverrides restores defaults', () {
      SharingSheet.shareOperationTimeout = const Duration(seconds: 5);
      SharingSheet.resetTestOverrides();

      expect(SharingSheet.shareOperationTimeout, const Duration(seconds: 30));
    });

    test('createJsonFile uses system temp in test behavior', () async {
      SharingSheet.resetTestOverrides();
      SharingSheet.useTestBehavior = true;

      final file = await SharingSheet.createJsonFileForTesting('{"logs":[]}');

      expect(await file.exists(), isTrue);
      expect(file.path, contains('network_logs_export'));
    });

    test('createJsonFile uses path provider when unmocked', () async {
      SharingSheet.resetTestOverrides();
      SharingSheet.useTestBehavior = false;
      SharingSheet.debugCreateJsonFile = null;
      SharingSheet.debugGetApplicationDocumentsDirectory = null;

      final file = await SharingSheet.createJsonFileForTesting('{"logs":[]}');

      expect(await file.exists(), isTrue);
      expect(file.path, startsWith(tempDir.path));
    });

    test('copy uses platform clipboard when debug hook is absent', () async {
      SharingSheet.resetTestOverrides();
      SharingSheet.useTestBehavior = true;
      SharingSheet.debugSetClipboard = null;
      SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);

      Map<String, dynamic>? clipboardData;
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, (call) async {
            if (call.method == 'Clipboard.setData') {
              clipboardData = call.arguments as Map<String, dynamic>?;
              return null;
            }
            return null;
          });

      SharingSheet.copyToClipboardForTesting(context, '{"logs":[]}');
      await Future<void>.delayed(const Duration(milliseconds: 10));

      expect(clipboardData?['text'], '{"logs":[]}');
      expect(messages.single, 'Network logs copied to clipboard');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(SystemChannels.platform, null);
    });

    test('test path creates file when debug hooks are absent', () async {
      SharingSheet.resetTestOverrides();
      SharingSheet.useTestBehavior = true;
      SharingSheet.debugRunEmailShare = null;
      SharingSheet.debugSendEmail = null;
      SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);
      SharingSheet.debugCreateJsonFile = (jsonData) async {
        final file = File('${tempDir.path}/created.json');
        await file.writeAsString(jsonData);
        return file;
      };

      await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');

      expect(messages, contains('Email app opened with attachment'));
    });

    test('test path returns early when share hook is absent', () async {
      SharingSheet.resetTestOverrides();
      SharingSheet.useTestBehavior = true;
      SharingSheet.debugRunEmailShare = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = null;
      SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);
      SharingSheet.debugCreateJsonFile = (jsonData) async {
        final file = File('${tempDir.path}/share_fallback.json');
        await file.writeAsString(jsonData);
        return file;
      };

      await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');

      expect(messages, isEmpty);
    });

    test('test path falls back when export file is missing', () async {
      String? copied;
      SharingSheet.resetTestOverrides();
      SharingSheet.useTestBehavior = true;
      SharingSheet.debugRunEmailShare = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = null;
      SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);
      SharingSheet.debugCreateJsonFile = (_) async {
        return File('${tempDir.path}/missing/network_logs.json');
      };
      SharingSheet.debugSetClipboard = (text) async => copied = text;

      await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');

      expect(copied, isNotEmpty);
      expect(messages.single, 'Sharing failed. JSON copied to clipboard.');
    });

    test('production uses platform share when debug hook is absent', () async {
      SharingSheet.resetTestOverrides();
      SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);
      SharingSheet.debugGetApplicationDocumentsDirectory = () async => tempDir;
      SharingSheet.debugCreateJsonFile = (jsonData) async {
        final file = File('${tempDir.path}/network_logs.json');
        await file.writeAsString(jsonData);
        return file;
      };
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = null;

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(messages, isEmpty);
    });

    test('production falls back to clipboard when share times out', () async {
      String? copied;
      SharingSheet.resetTestOverrides();
      SharingSheet.debugShowSnackBar = (_, message) => messages.add(message);
      SharingSheet.debugGetApplicationDocumentsDirectory = () async => tempDir;
      SharingSheet.debugCreateJsonFile = (jsonData) async {
        final file = File('${tempDir.path}/network_logs.json');
        await file.writeAsString(jsonData);
        return file;
      };
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = null;
      SharingSheet.debugSetClipboard = (text) async => copied = text;
      SharingSheet.shareOperationTimeout = const Duration(milliseconds: 1);

      final completer = Completer<Object?>();
      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(shareChannel, (_) => completer.future);

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(copied, isNotEmpty);
      expect(messages.single, 'Sharing failed. JSON copied to clipboard.');

      TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
          .setMockMethodCallHandler(shareChannel, (call) async => 'success');
    });
  });

  group('NetworkLoggingSheet unit coverage', () {
    test('can be constructed', () {
      final sheet = const NetworkLoggingSheet();
      expect(sheet, isA<NetworkLoggingSheet>());
    });
  });
}
