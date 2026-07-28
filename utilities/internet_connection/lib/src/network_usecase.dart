import 'package:internet_connection/core/connection_exceptions.dart';
import 'package:internet_connection/src/network_info.dart';

/// A use case class that provides high-level network connectivity operations.
///
/// This class serves as a facade for network connectivity functionality,
/// providing simple static methods to initialize network monitoring and
/// check internet connectivity status.
class NetworkUseCase {
  static final NetworkInfoRepository _networkInfoRepository =
      NetworkInfoRepository();

  /// Initializes network connection monitoring.
  ///
  /// This method sets up real-time monitoring of network connectivity changes.
  /// Call this method once during app initialization to start monitoring
  /// network state changes.
  static void initialize() {
    _networkInfoRepository.initNetworkConnectionCheck();
  }

  /// Checks if the device has an active internet connection.
  ///
  /// Returns `true` if the device is connected to the internet and can
  /// successfully perform DNS lookups. Returns `false` if there's no
  /// network connection or if internet access is not available.
  ///
  /// This method handles [ConnectionException] internally and returns
  /// `false` in case of any connectivity issues.
  ///
  /// Returns:
  ///   A [Future<bool>] that completes with `true` if internet is available,
  ///   `false` otherwise.
  static Future<bool> checkInternetConnection() async {
    try {
      return await _networkInfoRepository.checkConnectivityOnLaunch();
    } catch (e) {
      final _ = e as ConnectionException;
      return false;
    }
  }

  /// Gets the current network type asynchronously.
  ///
  /// Returns the type of network connection currently active on the device.
  /// Possible values: 'WiFi', 'Mobile', 'Ethernet', 'VPN', 'Bluetooth', 'Other', 'None', or 'Unknown'.
  ///
  /// Returns:
  ///   A [Future<String>] that completes with the network type string.
  static Future<String> getNetworkType() async {
    return _networkInfoRepository.getNetworkType();
  }

  /// A stream of real-time internet availability updates.
  static Stream<bool> get networkStateStream =>
      _networkInfoRepository.networkStateStream;
}
