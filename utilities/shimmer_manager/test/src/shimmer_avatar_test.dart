import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_avatar.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerAvatar, () {
    testWidgets('builds circular avatar with given size', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerAvatar(size: 64));

      expect(find.byType(ShimmerAvatar), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Shimmer),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(
        container.constraints?.maxWidth ?? container.constraints?.minWidth,
        isNotNull,
      );
      expect(decoration.shape, BoxShape.circle);
    });

    testWidgets('applies custom background color', (tester) async {
      await pumpShimmerWidget(
        tester,
        const ShimmerAvatar(size: 48, backgroundColor: Colors.red),
      );

      final container = tester.widget<Container>(
        find.descendant(
          of: find.byType(Shimmer),
          matching: find.byType(Container),
        ),
      );
      final decoration = container.decoration! as BoxDecoration;
      expect(decoration.color, Colors.red);
    });
  });
}
