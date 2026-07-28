import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shimmer_manager/src/shimmer_list_view.dart';

import '../test_helpers.dart';

void main() {
  group(ShimmerList, () {
    testWidgets('builds list shimmer with five items', (tester) async {
      await pumpShimmerWidget(tester, const ShimmerList());

      expect(find.byType(ShimmerList), findsOneWidget);
      expect(find.byType(Shimmer), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsNWidgets(5));
    });
  });
}
