import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:logger_manager/logger_manager.dart';
import 'package:network_logging/src/config/dev_network_log_config.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';
import 'package:network_logging/src/data/storage/persistent_network_log_storage.dart';
import 'package:network_logging/src/interceptor/development_network_logger_interceptor.dart';
import 'package:network_logging/src/interceptor/network_logger_interceptor_base.dart';
import 'package:network_logging/src/network_log_manager.dart';
import 'package:network_logging/src/ui/draggable_fab.dart';
import 'package:network_logging/src/ui/network_logging_bottom_sheet.dart';

class DebugNetworkLogManager extends NetworkLogManager {
  NetworkLoggerInterceptorBase? _httpInterceptor;
  NetworkLogStorage? _networkStorage;

  @override
  NetworkLoggerInterceptorBase httpInterceptor() {
    if (_httpInterceptor != null) {
      return _httpInterceptor!;
    }
    final config = const DevNetworkLogConfig();
    final storage = PersistentNetworkLogStorage(
      maxEntries: config.maxEntries,
      retentionPeriod: config.retentionPeriod,
    );

    if (kDebugMode) {
      LoggerManagerBase.logInfo(
        message:
            '[NetworkLog] Debug manager using persistent storage '
            '[NetworkLog] instance ${identityHashCode(storage)}',
      );
    }

    _httpInterceptor = DevelopmentNetworkLoggerInterceptor(storage, config);
    _networkStorage = storage;
    return _httpInterceptor!;
  }

  @override
  Widget? logTrackerWidget(BuildContext context) {
    return DraggableFAB(
      onFabPressed: () {
        NetworkLoggingSheet.show(context);
      },
    );
  }

  @override
  NetworkLogStorage? httpStorage() {
    return _networkStorage;
  }
}
