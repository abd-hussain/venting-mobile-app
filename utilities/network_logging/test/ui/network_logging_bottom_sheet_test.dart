import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:network_logging/src/data/models/network_log_entry.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';
import 'package:network_logging/src/interceptor/network_logger_interceptor_base.dart';
import 'package:network_logging/src/network_log_manager.dart';
import 'package:network_logging/src/ui/network_logging_bottom_sheet.dart';
import 'package:package_info_plus/package_info_plus.dart';

class FakeNetworkLogStorage implements NetworkLogStorage {
  FakeNetworkLogStorage(this.entries);

  List<NetworkLogEntry> entries;

  @override
  Future<void> clear() async => entries.clear();

  @override
  Future<List<NetworkLogEntry>> getAll() async => List.of(entries);

  @override
  Future<int> getCount() async => entries.length;

  @override
  Future<List<NetworkLogEntry>> getByStatusCode(
    int? minCode,
    int? maxCode,
  ) async => [];

  @override
  Future<List<NetworkLogEntry>> getByTimeRange(
    DateTime start,
    DateTime end,
  ) async => [];

  @override
  Future<List<NetworkLogEntry>> getByUrlPattern(String pattern) async => [];

  @override
  Future<int> getMemoryUsage() async => 0;

  @override
  Future<void> removeOldEntries(Duration maxAge) async {}

  @override
  Future<void> store(NetworkLogEntry entry) async {
    entries.add(entry);
  }
}

class FakeNetworkLogManager extends NetworkLogManager {
  FakeNetworkLogManager(this._storage);

  final FakeNetworkLogStorage _storage;

  @override
  NetworkLogStorage? httpStorage() => _storage;

  @override
  NetworkLoggerInterceptorBase httpInterceptor() => throw UnimplementedError();

  @override
  Widget? logTrackerWidget(BuildContext context) => null;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late FakeNetworkLogManager fakeManager;
  late FakeNetworkLogStorage fakeStorage;
  late List<NetworkLogEntry> logs;

  NetworkLogEntry httpLog({
    required String id,
    required String url,
    String method = 'GET',
    DateTime? timestamp,
    int? statusCode,
    String? errorMessage,
    String? requestBody,
    String? responseBody,
    Map<String, dynamic>? requestHeaders,
    Map<String, dynamic>? responseHeaders,
    int? duration,
    DateTime? responseTimestamp,
  }) {
    return NetworkLogEntry(
      id: id,
      url: url,
      method: method,
      requestTimestamp: timestamp ?? DateTime.now(),
      responseTimestamp: responseTimestamp,
      requestHeaders:
          requestHeaders ?? const {'Content-Type': 'application/json'},
      requestBody: requestBody,
      statusCode: statusCode,
      responseHeaders: responseHeaders,
      responseBody: responseBody,
      errorMessage: errorMessage,
      duration: duration ?? 120,
    );
  }

  NetworkLogEntry socketLog({required String id, DateTime? timestamp}) {
    return NetworkLogEntry(
      id: id,
      url: 'wss://socket.test/stream',
      method: 'SUBSCRIBE',
      requestTimestamp: timestamp ?? DateTime.now(),
      requestHeaders: const {},
      eventType: NetworkEventType.socket,
      socketEvent: 'SubscribeToQuotes',
      socketTargets: const ['quotes'],
      socketArgs: const [1, 2],
    );
  }

  Widget buildTestApp({ThemeMode themeMode = ThemeMode.light}) {
    return MaterialApp(
      themeMode: themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const Scaffold(
        body: SizedBox(
          width: 1200,
          height: 2000,
          child: NetworkLoggingBottomSheet(),
        ),
      ),
    );
  }

  Future<void> pumpBottomSheet(WidgetTester tester) async {
    tester.view.physicalSize = const Size(1200, 2000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(buildTestApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pump(const Duration(milliseconds: 50));
    await tester.pump(const Duration(milliseconds: 50));
    tester.takeException();
  }

  setUpAll(() {
    PackageInfo.setMockInitialValues(
      appName: 'Zalleon',
      packageName: 'com.zain.iraq',
      version: '2.0.0',
      buildNumber: '42',
      buildSignature: '',
    );
  });

  setUp(() {
    logs = [
      httpLog(id: '1', url: 'https://api.test/users', statusCode: 200),
      httpLog(
        id: '2',
        url: 'https://api.test/orders',
        method: 'POST',
        statusCode: 404,
        errorMessage: 'Not found',
        requestBody: '{"id":1}',
        responseBody: '{"error":"missing"}',
        responseHeaders: const {'x-test': '1'},
        responseTimestamp: DateTime.now(),
      ),
      httpLog(
        id: '3',
        url: 'https://api.test/reports',
        method: 'PUT',
        statusCode: 500,
      ),
      httpLog(
        id: '4',
        url: 'https://api.test/archive',
        method: 'DELETE',
        statusCode: 204,
      ),
      httpLog(
        id: '5',
        url: 'https://api.test/patch',
        method: 'PATCH',
        statusCode: 199,
      ),
      httpLog(
        id: '6',
        url: 'https://api.test/custom',
        method: 'OPTIONS',
        duration: 30,
        timestamp: DateTime.now().subtract(const Duration(seconds: 20)),
      ),
      socketLog(id: 'socket-1'),
    ];

    fakeStorage = FakeNetworkLogStorage(List.of(logs));
    fakeManager = FakeNetworkLogManager(fakeStorage);

    if (GetIt.instance.isRegistered<NetworkLogManager>()) {
      GetIt.instance.unregister<NetworkLogManager>();
    }
    GetIt.instance.registerSingleton<NetworkLogManager>(fakeManager);
  });

  tearDown(() async {
    NetworkLoggingBottomSheet.debugForceCurlError = false;
    if (GetIt.instance.isRegistered<NetworkLogManager>()) {
      await GetIt.instance.unregister<NetworkLogManager>();
    }
  });

  group(NetworkLoggingBottomSheet, () {
    test('fake storage returns seeded entries', () async {
      final storage = FakeNetworkLogStorage([
        httpLog(id: '1', url: 'https://api.test/users'),
      ]);

      expect((await storage.getAll()).single.url, contains('users'));
    });

    testWidgets('loads and displays HTTP logs', (tester) async {
      await pumpBottomSheet(tester);

      expect(find.textContaining('Network Events (7)'), findsOneWidget);
      expect(find.byType(ListTile), findsWidgets);
      expect(find.text('/custom'), findsOneWidget);

      await tester.scrollUntilVisible(
        find.text('/users'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      expect(find.text('/users'), findsOneWidget);
      expect(find.text('/orders'), findsOneWidget);
      expect(find.text('Version'), findsOneWidget);
      expect(find.text('2.0.0'), findsOneWidget);
    });

    testWidgets('refresh reloads logs from storage', (tester) async {
      await pumpBottomSheet(tester);

      fakeStorage.entries.add(httpLog(id: '7', url: 'https://api.test/new'));

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(find.text('/new'), findsOneWidget);
    });

    testWidgets('clear removes logs via storage', (tester) async {
      await pumpBottomSheet(tester);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(fakeStorage.entries, isEmpty);
      expect(find.text('No HTTP requests logged yet'), findsOneWidget);
    });

    testWidgets('search filters logs by URL', (tester) async {
      await pumpBottomSheet(tester);

      await tester.enterText(find.byType(TextField), 'orders');
      await tester.pump();

      expect(find.text('/orders'), findsOneWidget);
      expect(find.text('/users'), findsNothing);
      expect(find.text('No requests match your filters'), findsNothing);
    });

    testWidgets('search with no matches shows empty filter message', (
      tester,
    ) async {
      await pumpBottomSheet(tester);

      await tester.enterText(find.byType(TextField), 'missing-url');
      await tester.pump();

      expect(find.text('No requests match your filters'), findsOneWidget);
    });

    testWidgets('day filter limits logs to selected day', (tester) async {
      fakeStorage.entries
        ..clear()
        ..addAll([
          httpLog(
            id: 'today',
            url: 'https://api.test/today',
            timestamp: DateTime.now(),
          ),
          httpLog(
            id: 'yesterday',
            url: 'https://api.test/yesterday',
            timestamp: DateTime.now().subtract(const Duration(days: 1)),
          ),
        ]);

      await pumpBottomSheet(tester);

      expect(find.text('/today'), findsOneWidget);
      expect(find.text('/yesterday'), findsNothing);

      await tester.tap(find.byType(DropdownButtonFormField<int>));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Yesterday').last);
      await tester.pump();

      expect(find.text('/yesterday'), findsOneWidget);
      expect(find.text('/today'), findsNothing);
    });

    testWidgets('opens request details and copies curl/body', (tester) async {
      await pumpBottomSheet(tester);

      await tester.scrollUntilVisible(
        find.text('/orders'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('/orders'));
      await tester.pumpAndSettle();

      expect(find.text('Request Details'), findsOneWidget);
      expect(find.text('Not found'), findsWidgets);
      expect(find.text('cURL Command'), findsOneWidget);

      await tester.tap(find.byTooltip('Copy cURL').first);
      await tester.pump();

      expect(find.text('Copied'), findsWidgets);

      await tester.tap(find.byIcon(Icons.close).last);
      await tester.pumpAndSettle();
      expect(find.text('Request Details'), findsNothing);
    });

    testWidgets('renders method and status styling in dark mode', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          themeMode: ThemeMode.dark,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          home: const Scaffold(
            body: SizedBox(
              width: 1200,
              height: 2000,
              child: NetworkLoggingBottomSheet(),
            ),
          ),
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));
      tester.takeException();

      expect(find.text('POST'), findsOneWidget);
      expect(find.text('PUT'), findsOneWidget);
      expect(find.text('DELETE'), findsOneWidget);
      expect(find.text('PATCH'), findsOneWidget);
      expect(find.text('Pending'), findsWidgets);
    });

    testWidgets('share shows snackbar when there are no filtered logs', (
      tester,
    ) async {
      await pumpBottomSheet(tester);

      await tester.enterText(find.byType(TextField), 'no-match');
      await tester.pump();
      await tester.tap(find.byIcon(Icons.share));
      await tester.pump();

      expect(find.text('No logs events to share'), findsOneWidget);
    });

    testWidgets('refresh handles storage errors gracefully', (tester) async {
      final throwingStorage = _ThrowingNetworkLogStorage();
      GetIt.instance.unregister<NetworkLogManager>();
      GetIt.instance.registerSingleton<NetworkLogManager>(
        FakeNetworkLogManager(throwingStorage),
      );

      await pumpBottomSheet(tester);

      await tester.tap(find.byIcon(Icons.refresh));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(tester.takeException(), isNull);
    });

    testWidgets('clear handles storage errors gracefully', (tester) async {
      final throwingStorage = _ClearThrowingNetworkLogStorage(logs);
      GetIt.instance.unregister<NetworkLogManager>();
      GetIt.instance.registerSingleton<NetworkLogManager>(
        FakeNetworkLogManager(throwingStorage),
      );

      await pumpBottomSheet(tester);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 200));

      expect(tester.takeException(), isNull);
    });

    testWidgets('renders socket events in the list', (tester) async {
      await pumpBottomSheet(tester);

      expect(find.text('WS'), findsOneWidget);
      expect(find.text('SubscribeToQuotes'), findsOneWidget);

      await tester.tap(find.text('SubscribeToQuotes'));
      await tester.pumpAndSettle();

      expect(find.text('Socket Event Details'), findsOneWidget);
      expect(find.text('Targets'), findsOneWidget);
      expect(find.text('Arguments'), findsOneWidget);
      expect(find.text('quotes'), findsOneWidget);
    });

    testWidgets('formats timestamps as minutes ago', (tester) async {
      fakeStorage.entries
        ..clear()
        ..add(
          httpLog(
            id: 'minutes',
            url: 'https://api.test/minutes',
            timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
          ),
        );

      await pumpBottomSheet(tester);

      expect(find.textContaining('m ago'), findsOneWidget);
    });

    testWidgets('copies request body from details sheet', (tester) async {
      await pumpBottomSheet(tester);

      await tester.scrollUntilVisible(
        find.text('/orders'),
        100,
        scrollable: find.byType(Scrollable).first,
      );
      await tester.tap(find.text('/orders'));
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip('Copy').first);
      await tester.pump();

      expect(find.text('Copied'), findsWidgets);
    });

    testWidgets('generates curl for non-json request bodies', (tester) async {
      fakeStorage.entries
        ..clear()
        ..add(
          httpLog(
            id: 'raw-body',
            url: 'https://api.test/raw',
            method: 'POST',
            requestBody: 'plain-text-body',
          ),
        );

      await pumpBottomSheet(tester);

      await tester.tap(find.text('/raw'));
      await tester.pumpAndSettle();

      expect(find.textContaining('plain-text-body'), findsWidgets);
      await tester.tap(find.byTooltip('Copy cURL').first);
      await tester.pump();
      expect(find.text('Copied'), findsWidgets);
    });

    testWidgets('formats clock time for older requests', (tester) async {
      final older = DateTime.now().subtract(const Duration(hours: 2));
      fakeStorage.entries
        ..clear()
        ..add(
          httpLog(id: 'older', url: 'https://api.test/older', timestamp: older),
        );

      await pumpBottomSheet(tester);

      final timeLabel =
          '${older.hour.toString().padLeft(2, '0')}:${older.minute.toString().padLeft(2, '0')}';
      expect(find.text(timeLabel), findsOneWidget);
    });

    testWidgets('shows curl generation error in details', (tester) async {
      NetworkLoggingBottomSheet.debugForceCurlError = true;
      fakeStorage.entries
        ..clear()
        ..add(httpLog(id: 'curl-error', url: 'https://api.test/curl-error'));

      await pumpBottomSheet(tester);

      await tester.tap(find.text('/curl-error'));
      await tester.pumpAndSettle();

      expect(
        find.textContaining('Error generating cURL command'),
        findsOneWidget,
      );
    });
  });

  group(NetworkLoggingSheet, () {
    tearDown(NetworkLoggingSheet.resetShowingForTesting);

    test('can be constructed', () {
      expect(const NetworkLoggingSheet(), isA<NetworkLoggingSheet>());
    });

    testWidgets('shows modal bottom sheet once', (tester) async {
      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return SizedBox(
                width: 1200,
                height: 2000,
                child: ElevatedButton(
                  onPressed: () => NetworkLoggingSheet.show(context),
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      tester.takeException();

      expect(find.text('Network Logs'), findsOneWidget);

      await tester.tap(find.text('Open'));
      await tester.pump();
      tester.takeException();

      expect(find.text('Network Logs'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      tester.takeException();
    });

    testWidgets('resets showing flag when sheet is dismissed', (tester) async {
      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return SizedBox(
                width: 1200,
                height: 2000,
                child: ElevatedButton(
                  onPressed: () => NetworkLoggingSheet.show(context),
                  child: const Text('Open'),
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      tester.takeException();
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle();
      tester.takeException();

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 300));
      tester.takeException();

      expect(find.text('Network Logs'), findsOneWidget);
    });

    testWidgets('shows fallback overlay when Material is unavailable', (
      tester,
    ) async {
      tester.view.physicalSize = const Size(1200, 2000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => Center(
                  child: GestureDetector(
                    onTap: () => NetworkLoggingSheet.show(context),
                    child: const Text('Open'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

      await tester.tap(find.text('Open'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(
        find.text('Network logging is not available in this context.'),
        findsOneWidget,
      );

      await tester.pump(const Duration(seconds: 3));
    });

    testWidgets('logs when fallback overlay cannot be shown', (tester) async {
      await tester.pumpWidget(
        const Directionality(
          textDirection: TextDirection.ltr,
          child: SizedBox(),
        ),
      );

      final context = tester.element(find.byType(SizedBox));
      NetworkLoggingSheet.show(context);
      await tester.pump();

      expect(tester.takeException(), isNull);
    });
  });
}

class _ThrowingNetworkLogStorage extends FakeNetworkLogStorage {
  _ThrowingNetworkLogStorage() : super(const []);

  int calls = 0;

  @override
  Future<List<NetworkLogEntry>> getAll() async {
    calls++;
    if (calls > 1) {
      throw Exception('refresh failed');
    }
    return super.getAll();
  }
}

class _ClearThrowingNetworkLogStorage extends FakeNetworkLogStorage {
  _ClearThrowingNetworkLogStorage(super.entries);

  @override
  Future<void> clear() async {
    throw Exception('clear failed');
  }
}
