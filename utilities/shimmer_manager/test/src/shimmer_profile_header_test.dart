import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_profile_header.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerProfileHeader, () {
    testWidgets('builds profile header shimmer', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerProfileHeader());

      expect(find.byType(ShimmerProfileHeader), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(Row), findsOneWidget);
    });

    testWidgets('applies custom padding', (tester) async {
      const padding = EdgeInsets.all(24);
      await pumpShimmerWidget(
        tester,
        const ShimmerProfileHeader(padding: padding),
      );

      final paddingWidget = tester.widget<Padding>(
        find.ancestor(
          of: find.descendant(
            of: find.byType(ShimmerProfileHeader),
            matching: find.byType(Shimmer),
          ),
          matching: find.byType(Padding),
        ),
      );
      expect(paddingWidget.padding, padding);
    });
  });
}
