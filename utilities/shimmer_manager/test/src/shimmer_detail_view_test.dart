import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_detail_view.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerDetailView, () {
    testWidgets('builds detail shimmer layout', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerDetailView());

      expect(find.byType(ShimmerDetailView), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });

    testWidgets('applies custom padding', (tester) async {
      const padding = EdgeInsets.symmetric(horizontal: 20);
      await pumpShimmerWidget(
        tester,
        const ShimmerDetailView(padding: padding),
      );

      final paddingWidget = tester.widget<Padding>(
        find.ancestor(
          of: find.descendant(
            of: find.byType(ShimmerDetailView),
            matching: find.byType(Shimmer),
          ),
          matching: find.byType(Padding),
        ),
      );
      expect(paddingWidget.padding, padding);
    });
  });
}
