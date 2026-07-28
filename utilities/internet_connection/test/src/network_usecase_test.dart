import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection/src/network_usecase.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_connectivity.dart';

void main() {
  late MockConnectivityPlatform mockConnectivityPlatform;

  setUpAll(registerConnectivityMocktailFallbacks);

  setUp(() {
    mockConnectivityPlatform = MockConnectivityPlatform();
    ConnectivityPlatform.instance = mockConnectivityPlatform;
  });

  group(NetworkUseCase, () {
    group('checkInternetConnection', () {
      test('returns false when device is offline', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.none],
        );

        final result = await NetworkUseCase.checkInternetConnection();

        expect(result, isFalse);
        verify(() => mockConnectivityPlatform.checkConnectivity()).called(1);
      });
    });

    group('getNetworkType', () {
      test('returns network type from repository', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.wifi],
        );

        final result = await NetworkUseCase.getNetworkType();

        expect(result, 'WiFi');
      });
    });

    group('initialize', () {
      test('starts connectivity monitoring without throwing', () {
        final connectivityStream =
            const Stream<List<ConnectivityResult>>.empty().asBroadcastStream();
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.wifi],
          connectivityStream: connectivityStream,
        );

        expect(NetworkUseCase.initialize, returnsNormally);
      });
    });

    test('exposes network state stream', () {
      expect(NetworkUseCase.networkStateStream, isA<Stream<bool>>());
    });
  });
}
