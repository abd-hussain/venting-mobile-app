import 'package:flutter/material.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';
import 'package:network_logging/src/debug_network_log_manager.dart';
import 'package:network_logging/src/interceptor/network_logger_interceptor_base.dart';
import 'package:network_logging/src/production_network_log_manager.dart';

abstract class NetworkLogManager {
  NetworkLoggerInterceptorBase httpInterceptor();
  NetworkLogStorage? httpStorage();

  Widget? logTrackerWidget(BuildContext context);
}

class NetworkLogManagerFactory {
  static NetworkLogManager? _manager;

  @visibleForTesting
  static void resetForTesting() {
    _manager = null;
  }

  static NetworkLogManager create(String env) {
    if (_manager != null) {
      return _manager!;
    }
    NetworkLogManager manager;
    switch (env) {
      case 'dev':
      case 'rel':
      case 'stg':
        manager = DebugNetworkLogManager();
        break;
      case 'prod':
      default:
        manager = ProductionNetworkLogManager();
    }
    _manager = manager;
    return manager;
  }
}
