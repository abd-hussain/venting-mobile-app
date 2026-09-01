import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection/core/connection_exceptions.dart';

/// A repository for managing network connectivity information and monitoring.
///
/// This class provides functionality to:
/// - Monitor real-time network connectivity changes
/// - Check internet connectivity on app launch
/// - Verify actual internet access (not just network connection)
/// - Provide a stream of network state updates
///
/// The repository distinguishes between being connected to a network
/// (WiFi, mobile, etc.) and having actual internet access by performing
/// DNS lookups to verify connectivity.
class NetworkInfoRepository {
  final StreamController<bool> _networkStateController =
      StreamController<bool>.broadcast();
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  /// Initializes network connection monitoring.
  void initNetworkConnectionCheck() {
    // Cancel any existing subscription before starting a new one
    _connectivitySubscription?.cancel();

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((
      event,
    ) async {
      final isConnected = _isConnected(event);
      final hasInternet = isConnected ? await _internetLookupCheck() : false;
      _networkStateController.sink.add(hasInternet);
    });
  }

  /// Checks network connectivity on app launch.
  Future<bool> checkConnectivityOnLaunch() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (_isConnected(connectivityResult)) {
      final isInternetAvailable = await _internetLookupCheck();
      _networkStateController.sink.add(isInternetAvailable);
      return isInternetAvailable;
    } else {
      _networkStateController.sink.add(false);
      throw ConnectionException(message: 'No Internet Connection');
    }
  }

  /// Determines if a given connectivity result indicates an active connection.
  bool _isConnected(List<ConnectivityResult> result) {
    return result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.ethernet) ||
        result.contains(ConnectivityResult.vpn) ||
        result.contains(ConnectivityResult.other);
  }

  /// Hosts used to verify that DNS + internet actually work.
  ///
  /// Android emulators often inherit broken corporate DNS from the host; a
  /// single-host lookup then falsely reports offline. Trying a few public
  /// hosts (with a short timeout) is more reliable.
  static const _lookupHosts = <String>[
    'dns.google',
    'one.one.one.one',
    'google.com',
  ];

  /// Performs an Internet lookup check to confirm connectivity.
  Future<bool> _internetLookupCheck() async {
    for (final host in _lookupHosts) {
      try {
        final lookupResult = await InternetAddress.lookup(
          host,
        ).timeout(const Duration(seconds: 2));
        if (lookupResult.isNotEmpty &&
            lookupResult.first.rawAddress.isNotEmpty) {
          return true;
        }
      } catch (_) {
        // Try the next host.
      }
    }
    return false;
  }

  /// Gets the current network type asynchronously.
  ///
  /// Returns the type of network connection currently active on the device.
  /// Possible values: 'WiFi', 'Mobile', 'Ethernet', 'VPN', 'Bluetooth', 'Other', 'None', or 'Unknown'.
  ///
  /// Returns:
  ///   A [Future<String>] that completes with the network type string.
  Future<String> getNetworkType() async {
    try {
      final connectivityResult = await _connectivity.checkConnectivity();

      if (connectivityResult.isEmpty) {
        return 'None';
      }

      // Return the first available connection type
      if (connectivityResult.contains(ConnectivityResult.wifi)) {
        return 'WiFi';
      } else if (connectivityResult.contains(ConnectivityResult.mobile)) {
        return 'Mobile';
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        return 'Ethernet';
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        return 'VPN';
      } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
        return 'Bluetooth';
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        return 'Other';
      }

      return 'Unknown';
    } catch (e) {
      return 'Unknown';
    }
  }

  /// A stream providing real-time network state updates.
  Stream<bool> get networkStateStream => _networkStateController.stream;

  /// Disposes of resources used by the service.
  void dispose() {
    _connectivitySubscription?.cancel();
    _networkStateController.close();
  }
}
