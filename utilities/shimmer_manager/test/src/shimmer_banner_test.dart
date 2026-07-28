import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_banner.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerBanner, () {
    testWidgets('builds banner with configured size', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerBanner(width: 320, height: 120),
      );

      expect(find.byType(ShimmerBanner), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Shimmer),
          matching: find.byType(Container),
        ),
      );
      expect(container.constraints?.maxWidth, 320);
      expect(container.constraints?.maxHeight, 120);
    });

    testWidgets('applies custom margin', (tester) async {
      const margin = EdgeInsets.all(8);
      await pumpShimmerWidget(
        tester,
        const ShimmerBanner(width: 100, height: 50, margin: margin),
      );

      final container = tester.widget<Container>(
        find
            .descendant(
              of: find.byType(ShimmerBanner),
              matching: find.byType(Container),
            )
            .first,
      );
      expect(container.margin, margin);
    });
  });
}
