import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_text_header.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerTextHeader, () {
    testWidgets('builds text header shimmer', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerTextHeader(height: 20, width: 180),
      );

      expect(find.byType(ShimmerTextHeader), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
    });

    testWidgets('builds with custom shimmer colors', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerTextHeader(
          height: 16,
          baseColor: Colors.black,
          highlightColor: Colors.grey,
        ),
      );

      expect(find.byType(ShimmerTextHeader), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
    });
  });
}
