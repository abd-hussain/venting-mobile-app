import 'package:api_client/src/ui/vpn_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows snackbar when scaffold messenger key is set', (
    tester,
  ) async {
    final key = GlobalKey<ScaffoldMessengerState>();
    await tester.pumpWidget(
      MaterialApp(
        scaffoldMessengerKey: key,
        home: const Scaffold(body: SizedBox()),
      ),
    );

    VpnToast.setScaffoldMessengerKey(key);
    VpnToast.show('Please connect to VPN');
    await tester.pump();

    expect(find.text('Please connect to VPN'), findsOneWidget);
  });

  test('no-ops when scaffold messenger key is not set', () {
    VpnToast.setScaffoldMessengerKey(GlobalKey<ScaffoldMessengerState>());
    expect(() => VpnToast.show('ignored'), returnsNormally);
  });
}
