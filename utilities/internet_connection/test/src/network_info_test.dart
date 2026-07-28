import 'dart:async';

import 'package:connectivity_plus_platform_interface/connectivity_plus_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection/core/connection_exceptions.dart';
import 'package:internet_connection/src/network_info.dart';
import 'package:mocktail/mocktail.dart';

import '../mock_connectivity.dart';

void main() {
  late MockConnectivityPlatform mockConnectivityPlatform;
  late NetworkInfoRepository repository;

  setUpAll(registerConnectivityMocktailFallbacks);

  setUp(() {
    mockConnectivityPlatform = MockConnectivityPlatform();
    ConnectivityPlatform.instance = mockConnectivityPlatform;
    repository = NetworkInfoRepository();
  });

  tearDown(() {
    repository.dispose();
  });

  group(NetworkInfoRepository, () {
    group('checkConnectivityOnLaunch', () {
      test('throws ConnectionException when device is offline', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.none],
        );

        await expectLater(
          repository.checkConnectivityOnLaunch(),
          throwsA(
            isA<ConnectionException>().having(
              (error) => error.message,
              'message',
              'No Internet Connection',
            ),
          ),
        );
      });

      test('emits false to stream when device is offline', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.none],
        );

        final states = <bool>[];
        final streamCompleter = Completer<void>();
        final subscription = repository.networkStateStream.listen((state) {
          states.add(state);
          if (!streamCompleter.isCompleted) {
            streamCompleter.complete();
          }
        });

        await expectLater(
          repository.checkConnectivityOnLaunch(),
          throwsA(isA<ConnectionException>()),
        );
        await streamCompleter.future;
        await subscription.cancel();

        expect(states, [false]);
      });

      test('returns connectivity result when network is available', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.wifi],
        );

        final result = await repository.checkConnectivityOnLaunch();

        expect(result, isA<bool>());
        verify(() => mockConnectivityPlatform.checkConnectivity()).called(1);
      });
    });

    group('getNetworkType', () {
      test('returns WiFi when connected via wifi', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.wifi],
        );

        final result = await repository.getNetworkType();

        expect(result, 'WiFi');
      });

      test('returns Mobile when connected via mobile data', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.mobile],
        );

        final result = await repository.getNetworkType();

        expect(result, 'Mobile');
      });

      test('returns Ethernet when connected via ethernet', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.ethernet],
        );

        final result = await repository.getNetworkType();

        expect(result, 'Ethernet');
      });

      test('returns VPN when connected via vpn', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.vpn],
        );

        final result = await repository.getNetworkType();

        expect(result, 'VPN');
      });

      test('returns Bluetooth when connected via bluetooth', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.bluetooth],
        );

        final result = await repository.getNetworkType();

        expect(result, 'Bluetooth');
      });

      test('returns Other for other connection types', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.other],
        );

        final result = await repository.getNetworkType();

        expect(result, 'Other');
      });

      test('returns None when connectivity result is empty', () async {
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [],
        );

        final result = await repository.getNetworkType();

        expect(result, 'None');
      });

      test('returns Unknown when connectivity check fails', () async {
        when(
          () => mockConnectivityPlatform.checkConnectivity(),
        ).thenThrow(Exception('platform error'));

        final result = await repository.getNetworkType();

        expect(result, 'Unknown');
      });
    });

    group('initNetworkConnectionCheck', () {
      test('emits false when connectivity changes to offline', () async {
        final connectivityController =
            StreamController<List<ConnectivityResult>>.broadcast();
        stubConnectivity(
          mockPlatform: mockConnectivityPlatform,
          connectivityResult: [ConnectivityResult.wifi],
          connectivityStream: connectivityController.stream,
        );

        final states = <bool>[];
        final subscription = repository.networkStateStream.listen(states.add);

        repository.initNetworkConnectionCheck();
        connectivityController.add([ConnectivityResult.none]);
        await Future<void>.delayed(Duration.zero);

        await subscription.cancel();
        await connectivityController.close();

        expect(states, [false]);
      });

      test(
        'runs internet lookup when connectivity changes to online',
        () async {
          final connectivityController =
              StreamController<List<ConnectivityResult>>.broadcast();
          stubConnectivity(
            mockPlatform: mockConnectivityPlatform,
            connectivityResult: [ConnectivityResult.none],
            connectivityStream: connectivityController.stream,
          );

          final states = <bool>[];
          final completer = Completer<void>();
          final subscription = repository.networkStateStream.listen((state) {
            states.add(state);
            if (!completer.isCompleted) {
              completer.complete();
            }
          });

          repository.initNetworkConnectionCheck();
          connectivityController.add([ConnectivityResult.wifi]);
          await completer.future.timeout(const Duration(seconds: 5));

          await subscription.cancel();
          await connectivityController.close();

          expect(states, hasLength(1));
          expect(states.single, isA<bool>());
        },
      );
    });
  });
}
