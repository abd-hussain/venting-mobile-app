import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
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
      '${Directory.systemTemp.path}/sharing_prod_${DateTime.now().microsecondsSinceEpoch}',
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

  group('production share path', () {
    test('sends email via debug hook', () async {
      var sent = false;
      SharingSheet.debugSendEmail = () async {
        sent = true;
      };

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(sent, isTrue);
      expect(messages, contains('Email app opened with attachment'));
    });

    test('falls back to platform share when email fails', () async {
      var shared = false;
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
        shared = true;
        return const ShareResult('ok', ShareResultStatus.success);
      };

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(shared, isTrue);
    });

    test('returns early when platform share is dismissed', () async {
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
        return const ShareResult('dismissed', ShareResultStatus.dismissed);
      };

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(messages, isEmpty);
    });

    test('copies JSON when share plugin is missing', () async {
      String? copied;
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
        throw Exception('MissingPluginException(no implementation)');
      };
      SharingSheet.debugSetClipboard = (text) async => copied = text;

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(copied, isNotEmpty);
      expect(
        messages.single,
        'Share plugin not available. Please rebuild the app. JSON copied to clipboard.',
      );
    });

    test('copies JSON when platform share fails', () async {
      String? copied;
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
        throw Exception('share failed');
      };
      SharingSheet.debugSetClipboard = (text) async => copied = text;

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(copied, isNotEmpty);
      expect(messages.single, 'Sharing failed. JSON copied to clipboard.');
    });

    test('shows manual copy hint when clipboard fails', () async {
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
        throw Exception('share failed');
      };
      SharingSheet.debugSetClipboard = (_) async {
        throw Exception('clipboard failed');
      };

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(
        messages.single,
        'Unable to share. Please use "Copy JSON" option instead.',
      );
    });

    test('falls back to clipboard when export file is missing', () async {
      SharingSheet.debugSendEmail = () async {
        throw Exception('no email app');
      };
      SharingSheet.debugCreateJsonFile = (_) async {
        return File('${tempDir.path}/missing/network_logs.json');
      };

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(messages.single, 'Sharing failed. JSON copied to clipboard.');
    });

    test('uses platform email sender when debug hook is absent', () async {
      SharingSheet.debugSendEmail = null;

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(messages, contains('Email app opened with attachment'));
    });

    test('test path uses debugSendEmail hook', () async {
      var sent = false;
      SharingSheet.useTestBehavior = true;
      SharingSheet.debugRunEmailShare = null;
      SharingSheet.debugSendEmail = () async {
        sent = true;
      };

      await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');

      expect(sent, isTrue);
      expect(messages, contains('Email app opened with attachment'));
    });

    test('creates json file in documents directory when unmocked', () async {
      SharingSheet.debugCreateJsonFile = null;
      SharingSheet.debugSendEmail = () async {};

      await SharingSheet.shareViaEmailProductionForTesting(
        context,
        '{"logs":[]}',
      );

      expect(tempDir.listSync().whereType<File>().length, greaterThan(0));
    });
  });
}
