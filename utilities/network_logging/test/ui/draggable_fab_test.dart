import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/ui/draggable_fab.dart';

void main() {
  testWidgets('DraggableFAB renders and invokes callback on tap', (
    tester,
  ) async {
    var pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(
            children: [DraggableFAB(onFabPressed: () => pressed = true)],
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.network_check), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(pressed, isTrue);
  });

  testWidgets('DraggableFAB clamps drag position within screen bounds', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Stack(children: [DraggableFAB(onFabPressed: () {})]),
        ),
      ),
    );

    final fab = find.byType(Draggable);
    expect(fab, findsOneWidget);

    await tester.drag(fab, const Offset(-500, -500));
    await tester.pump();

    final positioned = tester.widget<Positioned>(find.byType(Positioned));
    expect(positioned.left, greaterThanOrEqualTo(16));
    expect(positioned.top, greaterThanOrEqualTo(80));
  });
}
