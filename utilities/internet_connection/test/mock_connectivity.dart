import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:mocktail/mocktail.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockConnectivityPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements ConnectivityPlatform {}

void registerConnectivityMocktailFallbacks() {
  registerFallbackValue([ConnectivityResult.none]);
}

void stubConnectivity({
  required MockConnectivityPlatform mockPlatform,
  required List<ConnectivityResult> connectivityResult,
  Stream<List<ConnectivityResult>>? connectivityStream,
}) {
  when(
    () => mockPlatform.checkConnectivity(),
  ).thenAnswer((_) async => connectivityResult);

  if (connectivityStream != null) {
    when(
      () => mockPlatform.onConnectivityChanged,
    ).thenAnswer((_) => connectivityStream);
  }
}
