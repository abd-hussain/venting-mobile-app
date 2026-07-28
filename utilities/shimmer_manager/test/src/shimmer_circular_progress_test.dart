import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_circular_progress.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerCircularProgress, () {
    testWidgets('builds circular progress shimmer', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerCircularProgress(size: 48));

      expect(find.byType(ShimmerCircularProgress), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('uses custom size and stroke width', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerCircularProgress(size: 64, strokeWidth: 6),
      );

      final sizedBox = tester.widget<SizedBox>(
        find.descendant(
          of: find.byType(Shimmer),
          matching: find.byType(SizedBox),
        ),
      );
      expect(sizedBox.width, 64);
      expect(sizedBox.height, 64);

      final progress = tester.widget<CircularProgressIndicator>(
        find.byType(CircularProgressIndicator),
      );
      expect(progress.strokeWidth, 6);
    });
  });
}
