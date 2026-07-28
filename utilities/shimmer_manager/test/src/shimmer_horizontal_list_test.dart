import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_horizontal_list.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerHorizontalList, () {
    testWidgets('builds horizontal list with configured items', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerHorizontalList(
          itemCount: 4,
          itemWidth: 120,
          itemHeight: 80,
        ),
      );

      expect(find.byType(ShimmerHorizontalList), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Container), findsNWidgets(4));
    });

    testWidgets('uses provided item dimensions', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerHorizontalList(
          itemCount: 1,
          itemWidth: 200,
          itemHeight: 100,
        ),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(ShimmerHorizontalList),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.height, 100);
    });
  });
}
