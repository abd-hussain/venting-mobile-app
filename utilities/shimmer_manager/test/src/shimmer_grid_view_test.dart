import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_grid_view.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerGridView, () {
    testWidgets('builds grid with default item count', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerGridView());

      expect(find.byType(ShimmerGridView), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(GridView), findsOneWidget);
    });

    testWidgets('builds configured number of items', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerGridView(itemCount: 3, crossAxisCount: 3),
      );

      expect(find.byType(Container), findsNWidgets(3));
    });

    testWidgets('applies custom padding', (tester) async {
      const padding = EdgeInsets.all(12);
      await pumpShimmerWidget(tester, const ShimmerGridView(padding: padding));

      final gridView = tester.widget<GridView>(find.byType(GridView));
      expect(gridView.padding, padding);
    });
  });
}
