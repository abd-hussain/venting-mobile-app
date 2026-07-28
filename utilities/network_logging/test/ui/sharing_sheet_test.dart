import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/ui/widgets/sharing_sheet.dart';
import 'package:share_plus/share_plus.dart';

import '../support/test_support.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const pathProviderChannel = MethodChannel('plugins.flutter.io/path_provider');
  const emailChannel = MethodChannel('flutter_email_sender');
  const shareChannel = MethodChannel('dev.fluttercommunity.plus/share');

  late Directory tempDir;
  final logs = [buildEntry(id: '1', statusCode: 200)];

  setUp(() {
    tempDir = Directory(
      '${Directory.systemTemp.path}/sharing_sheet_${DateTime.now().microsecondsSinceEpoch}',
    )..createSync(recursive: true);

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
        .setMockMethodCallHandler(shareChannel, (call) async {
          return 'success';
        });

    SharingSheet.resetTestOverrides();
    SharingSheet.useTestBehavior = true;
    SharingSheet.debugGetApplicationDocumentsDirectory = () async => tempDir;
    SharingSheet.debugCreateJsonFile = (jsonData) async {
      final file = File('${tempDir.path}/network_logs.json');
      await file.writeAsString(jsonData);
      return file;
    };
    SharingSheet.debugRunEmailShare = () async {};
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
  });

  tearDown(() async {
    if (tempDir.existsSync()) {
      await tempDir.delete(recursive: true);
    }
  });

  test('SharingSheet can be constructed', () {
    expect(const SharingSheet(), isA<SharingSheet>());
  });

  test('mocked email sender returns quickly', () async {
    await FlutterEmailSender.send(Email(body: 'body', subject: 'subject'));
  });

  test('createJsonFile uses debug hook quickly', () async {
    SharingSheet.resetTestOverrides();
    SharingSheet.debugCreateJsonFile = (jsonData) async {
      final file = File('${tempDir.path}/quick.json');
      await file.writeAsString(jsonData);
      return file;
    };

    final file = await SharingSheet.createJsonFileForTesting('{}');
    expect(file.path, endsWith('quick.json'));
  });

  test('createJsonFile uses documents directory when unmocked', () async {
    SharingSheet.resetTestOverrides();
    SharingSheet.useTestBehavior = false;
    SharingSheet.debugGetApplicationDocumentsDirectory = () async => tempDir;

    final file = await SharingSheet.createJsonFileForTesting('{"logs":[]}');
    expect(await file.exists(), isTrue);
  });

  Future<void> pumpHost(
    WidgetTester tester, {
    required Future<void> Function(BuildContext context) onPressed,
  }) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: ElevatedButton(
                onPressed: () async => onPressed(context),
                child: const Text('Action'),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<BuildContext> hostContext(WidgetTester tester) async {
    late BuildContext context;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (ctx) {
              context = ctx;
              return const SizedBox();
            },
          ),
        ),
      ),
    );
    return context;
  }

  Future<void> openShareDialog(WidgetTester tester) async {
    await pumpHost(
      tester,
      onPressed: (context) => SharingSheet.shareNetworkLogs(context, logs),
    );
    await tester.tap(find.text('Action'));
    await tester.pumpAndSettle();
  }

  testWidgets('shareNetworkLogs shows snackbar when logs are empty', (
    tester,
  ) async {
    await pumpHost(
      tester,
      onPressed: (context) => SharingSheet.shareNetworkLogs(context, []),
    );
    await tester.tap(find.text('Action'));
    await tester.pump();

    expect(find.text('No logs events to share'), findsOneWidget);
  });

  testWidgets('shareNetworkLogs shows snackbar when preparation fails', (
    tester,
  ) async {
    SharingSheet.debugThrowOnPrepare = true;

    await pumpHost(
      tester,
      onPressed: (context) => SharingSheet.shareNetworkLogs(context, logs),
    );
    await tester.tap(find.text('Action'));
    await tester.pump();

    expect(
      find.textContaining('Error preparing events to share'),
      findsOneWidget,
    );
  });

  testWidgets('shareNetworkLogs shows share dialog for non-empty logs', (
    tester,
  ) async {
    await openShareDialog(tester);

    expect(find.text('Share all Network Logs'), findsOneWidget);
    expect(find.text('Copy JSON'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets('copy JSON copies logs and shows confirmation', (tester) async {
    String? copied;
    SharingSheet.debugSetClipboard = (text) async => copied = text;

    await pumpHost(
      tester,
      onPressed: (context) async {
        SharingSheet.copyToClipboardForTesting(context, '{"logs":[]}');
      },
    );
    await tester.tap(find.text('Action'));
    await tester.pump();

    expect(copied, isNotEmpty);
    expect(find.text('Network logs copied to clipboard'), findsOneWidget);
  });

  testWidgets('cancel closes the dialog', (tester) async {
    await openShareDialog(tester);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.text('Share all Network Logs'), findsNothing);
  });

  testWidgets('email opens email client when available', (tester) async {
    var sent = false;
    SharingSheet.debugRunEmailShare = () async {
      sent = true;
    };

    final context = await hostContext(tester);
    await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');
    await tester.pump();

    expect(sent, isTrue);
    expect(find.text('Email app opened with attachment'), findsOneWidget);
  });

  testWidgets('email failure falls back to platform share', (tester) async {
    var shared = false;
    SharingSheet.debugRunEmailShare = () async {
      throw Exception('no email app');
    };
    SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
      shared = true;
      return const ShareResult('ok', ShareResultStatus.success);
    };

    final context = await hostContext(tester);
    await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');
    await tester.pump();

    expect(shared, isTrue);
  });

  testWidgets('dismissed platform share does not show error snackbar', (
    tester,
  ) async {
    SharingSheet.debugRunEmailShare = () async {
      throw Exception('no email app');
    };
    SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
      return const ShareResult('dismissed', ShareResultStatus.dismissed);
    };

    final context = await hostContext(tester);
    await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');
    await tester.pump();

    expect(
      find.text('Sharing failed. JSON copied to clipboard.'),
      findsNothing,
    );
  });

  testWidgets('missing share plugin copies JSON to clipboard', (tester) async {
    String? copied;
    SharingSheet.debugRunEmailShare = () async {
      throw Exception('no email app');
    };
    SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
      throw Exception('MissingPluginException(no implementation)');
    };
    SharingSheet.debugSetClipboard = (text) async => copied = text;

    final context = await hostContext(tester);
    await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');
    await tester.pump();

    expect(copied, isNotEmpty);
    expect(
      find.text(
        'Share plugin not available. Please rebuild the app. JSON copied to clipboard.',
      ),
      findsOneWidget,
    );
  });

  testWidgets('share failure falls back to clipboard', (tester) async {
    String? copied;
    SharingSheet.debugRunEmailShare = () async {
      throw Exception('no email app');
    };
    SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
      throw Exception('share failed');
    };
    SharingSheet.debugSetClipboard = (text) async => copied = text;

    final context = await hostContext(tester);
    await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');
    await tester.pump();

    expect(copied, isNotEmpty);
    expect(
      find.text('Sharing failed. JSON copied to clipboard.'),
      findsOneWidget,
    );
  });

  testWidgets('share and clipboard failure shows manual copy hint', (
    tester,
  ) async {
    SharingSheet.debugRunEmailShare = () async {
      throw Exception('no email app');
    };
    SharingSheet.debugShareXFiles = ({required files, text, subject}) async {
      throw Exception('share failed');
    };
    SharingSheet.debugSetClipboard = (_) async {
      throw Exception('clipboard failed');
    };

    final context = await hostContext(tester);
    await SharingSheet.shareViaEmailForTesting(context, '{"logs":[]}');
    await tester.pump();

    expect(
      find.text('Unable to share. Please use "Copy JSON" option instead.'),
      findsOneWidget,
    );
  });

  testWidgets('dialog copy JSON button copies logs', (tester) async {
    String? copied;
    SharingSheet.debugSetClipboard = (text) async => copied = text;

    await openShareDialog(tester);
    await tester.tap(find.text('Copy JSON'));
    await tester.pump();

    expect(copied, isNotEmpty);
    expect(find.text('Network logs copied to clipboard'), findsOneWidget);
  });

  testWidgets('dialog email button triggers share flow', (tester) async {
    var sent = false;
    SharingSheet.debugRunEmailShare = () async {
      sent = true;
    };

    await openShareDialog(tester);
    await tester.tap(find.text('Email'));
    await tester.pumpAndSettle();

    expect(sent, isTrue);
  });
}
