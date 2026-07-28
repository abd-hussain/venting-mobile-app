import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/debug_network_log_manager.dart';
import 'package:network_logging/src/ui/draggable_fab.dart';
import 'package:network_logging/src/ui/network_logging_bottom_sheet.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  tearDown(NetworkLoggingSheet.resetShowingForTesting);

  group(DebugNetworkLogManager, () {
    testWidgets('logTrackerWidget renders draggable FAB', (tester) async {
      final manager = DebugNetworkLogManager();

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Stack(
                  children: [
                    manager.logTrackerWidget(context) ?? const SizedBox(),
                  ],
                ),
              );
            },
          ),
        ),
      );

      expect(find.byType(DraggableFAB), findsOneWidget);
    });

    testWidgets('FAB opens network logging sheet', (tester) async {
      var opened = false;
      NetworkLoggingSheet.debugShowOverride = (_) {
        opened = true;
      };

      final manager = DebugNetworkLogManager();

      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              return Scaffold(
                body: Stack(
                  children: [
                    manager.logTrackerWidget(context) ?? const SizedBox(),
                  ],
                ),
              );
            },
          ),
        ),
      );

      await tester.tap(find.byType(DraggableFAB));
      await tester.pump();

      expect(opened, isTrue);
    });
  });
}
