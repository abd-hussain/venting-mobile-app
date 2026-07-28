import 'package:dio/dio.dart';

/// Interceptor that adds common headers to all API requests
class CommonHeadersInterceptor extends Interceptor {
  CommonHeadersInterceptor({
    required String platform,
    required String osVersion,
    required String appVersion,
    required String installationId,
    required String userAgent,
    required String networkType,
    required String phoneVersion,
    String? Function()? getLanguageCode,
  }) : _platform = platform,
       _osVersion = osVersion,
       _appVersion = appVersion,
       _installationId = installationId,
       _userAgent = userAgent,
       _networkType = networkType,
       _phoneVersion = phoneVersion,
       _getLanguageCode = getLanguageCode;

  final String _platform;
  final String _osVersion;
  final String _appVersion;
  final String _installationId;
  final String _userAgent;
  final String _networkType;
  final String _phoneVersion;
  final String? Function()? _getLanguageCode;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add common headers
    options.headers['skel-platform'] = _platform;
    options.headers['skel-os-version'] = _osVersion;
    options.headers['skel-fix-version'] = _appVersion;
    options.headers['skel-installation-id'] = _installationId;
    options.headers['skel-network-type'] = _networkType;
    options.headers['skel-phone-version'] = _phoneVersion;

    // Add user-agent if not already set
    if (!options.headers.containsKey('user-agent')) {
      options.headers['user-agent'] = _userAgent;
    }

    // Add accept language dynamically if getter is provided and not already set
    if (_getLanguageCode != null) {
      final languageCode = _getLanguageCode();
      if (languageCode != null && languageCode.isNotEmpty) {
        // Add skel-accept-language (custom header)
        if (!options.headers.containsKey('skel-accept-language')) {
          options.headers['skel-accept-language'] = languageCode == "ckb"
              ? "kd"
              : languageCode;
        }
        // Add accept-language (standard HTTP header)
        if (!options.headers.containsKey('accept-language')) {
          options.headers['accept-language'] = languageCode;
        }
      }
    }

    // Set default content type if not already set
    if (!options.headers.containsKey('content-type')) {
      options.headers['content-type'] = 'application/json; charset=UTF-8';
    }

    // Set default accept header if not already set
    if (!options.headers.containsKey('accept')) {
      options.headers['accept'] = '*/*';
    }

    handler.next(options);
  }
}
