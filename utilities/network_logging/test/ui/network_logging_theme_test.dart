import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_logging/src/ui/theme/network_logging_theme.dart';

void main() {
  testWidgets('textStyles fall back when theme text styles are missing', (
    tester,
  ) async {
    late NetworkLoggingTextStyles styles;

    await tester.pumpWidget(
      MaterialApp(
        theme: ThemeData(textTheme: const TextTheme()),
        home: Builder(
          builder: (context) {
            styles = NetworkLoggingTheme.textStyles(context);
            return const SizedBox();
          },
        ),
      ),
    );

    expect(styles.textXl.fontSize, 20);
    expect(styles.textLg.fontSize, 18);
    expect(styles.textMd.fontSize, 16);
  });
}
