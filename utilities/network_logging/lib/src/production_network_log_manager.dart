import 'package:flutter/widgets.dart';
import 'package:network_logging/network_logging.dart';
import 'package:network_logging/src/data/storage/network_log_storage.dart';
import 'package:network_logging/src/interceptor/network_logger_interceptor_base.dart';
import 'package:network_logging/src/interceptor/production_network_logger_interceptor.dart';

class ProductionNetworkLogManager extends NetworkLogManager {
  @override
  NetworkLoggerInterceptorBase httpInterceptor() {
    return ProductionNetworkLoggerInterceptor();
  }

  @override
  Widget? logTrackerWidget(BuildContext context) {
    return null;
  }

  @override
  NetworkLogStorage? httpStorage() {
    return null;
  }
}
