import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimeer_card_view.dart';

import '../test_helpers.dart';

void main() {
  group(ShimeerCardView, () {
    testWidgets('builds card shimmer with configured size', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimeerCardView(width: 180, height: 220),
      );

      expect(find.byType(ShimeerCardView), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(ClipRRect), findsOneWidget);

      final sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(ShimeerCardView),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, 180);
      expect(sizedBox.height, 220);
    });
  });
}
