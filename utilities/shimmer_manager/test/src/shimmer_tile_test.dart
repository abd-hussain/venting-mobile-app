import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_tile.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerTile, () {
    testWidgets('builds shimmer tile with defaults', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerTile());

      expect(find.byType(ShimmerTile), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('hides leading and trailing when disabled', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerTile(hasLeading: false, hasTrailing: false),
      );

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.children.length, 1);
    });

    testWidgets('shows leading and trailing when enabled', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerTile());

      final row = tester.widget<Row>(find.byType(Row));
      expect(row.children.length, greaterThan(1));
    });

    testWidgets('applies custom padding', (tester) async {
      const padding = EdgeInsets.all(24);
      await pumpShimmerWidget(tester, const ShimmerTile(padding: padding));

      final paddingWidget = tester.widget<Padding>(
        find.ancestor(
          of: find.descendant(
            of: find.byType(ShimmerTile),
            matching: find.byType(Shimmer),
          ),
          matching: find.byType(Padding),
        ),
      );
      expect(paddingWidget.padding, padding);
    });
  });
}
