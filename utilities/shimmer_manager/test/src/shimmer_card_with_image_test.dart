import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_card_with_image.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerCardWithImage, () {
    testWidgets('builds card with image and content sections', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerCardWithImage(
          width: 200,
          imageHeight: 120,
          contentHeight: 80,
        ),
      );

      expect(find.byType(ShimmerCardWithImage), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(Column), findsNWidgets(2));
    });

    testWidgets('applies custom padding', (tester) async {
      const padding = EdgeInsets.all(8);
      await pumpShimmerWidget(
        tester,
        const ShimmerCardWithImage(
          width: 200,
          imageHeight: 100,
          contentHeight: 60,
          padding: padding,
        ),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(ShimmerCardWithImage),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.padding, padding);
    });
  });
}
