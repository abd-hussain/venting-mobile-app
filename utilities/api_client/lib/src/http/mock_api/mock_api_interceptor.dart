import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:api_client/src/http/mock_api/mock_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class MockApiInterceptor extends Interceptor {
  /// List of request keys to ignore while generating unique key for the request.
  /// These keys will be removed from the request parameters before generating the unique key.
  /// This is done to avoid generating different keys for the same request with different values.
  /// Used in Record Mode to generate unique key for the request.
  final List<String> _ignoreRequestKeys = ["Authorization"];

  /// Flag to enable Mock Mode
  /// When Mock Mode is enabled, the actual API call will not be made and the response will be mocked either by developer saved JSON or recorded json from previous sessions.
  bool isMockEnabled = true;

  /// Flag to enable Record Mode
  /// When Record Mode is enabled, the actual API call will be made and the response will be saved to disk.
  /// This response will be used in Mock Mode. if there is not developer saved response avaliable
  bool isRecordEnabled = false;

  /// Path to save the mocked data
  /// This path should be a directory where the mocked data will be saved.
  /// Example : /Users/<username>>/Desktop/MockedData
  String mockDataPath = "";

  /// Access token to be used in record mode.
  /// This token will be used to make the actual API call in Record Mode.
  String accessToken = "";

  Map<String, List<MockResponse>> apiPathToMockResponseMapping = {};

  // ignore: use_setters_to_change_properties
  void reply(Map<String, List<MockResponse>> mapping) {
    apiPathToMockResponseMapping = mapping;
  }

  // ignore: use_setters_to_change_properties
  void setMocking(bool enabled) {
    isMockEnabled = enabled;
  }

  String _makeFilePathSafe(Map<String, dynamic> jsonObject) {
    // Convert the JSON object to a string
    final String input = jsonEncode(jsonObject);
    // Define invalid characters for file paths
    final invalidCharacters = RegExp(r'[<>:"/\\|?*\x00-\x1F]');

    // Replace invalid characters with an underscore and Trim trailing spaces and dots (invalid for file names in Windows)
    String sanitized = input
        .replaceAll(invalidCharacters, '_')
        .trim()
        .replaceAll(RegExp(r'[. ]+$'), '');

    // Ensure the result is not empty
    if (sanitized.isEmpty) {
      sanitized = 'default_file_name';
    }

    return sanitized;
  }

  void onResponse(
    Response<Object?> response,
    ResponseInterceptorHandler handler,
  ) {
    if (isRecordEnabled) {
      if (mockDataPath.isEmpty || accessToken.isEmpty) {
        throw Exception(
          'Mock data path or accessToken must not be empty in Record Mode',
        );
      }
      _recordResponse(response);
    }
    handler.next(response);
  }

  String _uniqueKeyFor(
    Map<String, dynamic> queryParameters,
    String path,
    String method,
  ) {
    /// Read URL and Request Parameters and generate a unique key.
    /// Save the response in a map with the key in disk.
    /// Generate unique key for all the request parameters.
    final requestParams = queryParameters;

    /// remove the ignore keys.
    _ignoreRequestKeys.forEach(requestParams.remove);

    final uniqueKeyJSON = {
      'path': path,
      'method': method,
      'params': requestParams,
    };

    /// URL encode the uniqueKey
    final filelName = _makeFilePathSafe(uniqueKeyJSON);
    return filelName;
  }

  void _recordResponse(Response<Object?> response) {
    if ((response.statusCode ?? 0) >= 200) {
      final filelName = _uniqueKeyFor(
        response.requestOptions.queryParameters,
        response.requestOptions.path,
        response.requestOptions.method,
      );
      final responseBody = json.encode(response.data);

      /// Write responseBody to disk.
      /// Write the file with the unique key.
      final file = File('$mockDataPath/$filelName.json');
      try {
        file.writeAsStringSync(responseBody);
      } catch (e) {
        log("Error writing response body to disk: $e");
      }
    }
  }

  Future<void> _handleMockedResponse(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final path = options.path;
    final mocks = _getMocksForPath(path);

    final mockResponse = mocks.firstOrNull;
    final responseDelayInMillis = mockResponse?.delayInMillis;
    await Future<void>.delayed(Duration(milliseconds: responseDelayInMillis!));

    final responseBodyString = await _getResponseBody(mockResponse!);
    final responseBodyJson = json.decode(responseBodyString);

    final response = _createResponse(
      options,
      responseBodyJson,
      mockResponse.code,
    );

    _updateMocksList(mocks);
    handler.resolve(response);
  }

  Future<void> _handleRecordedResponse(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final path = options.path;
    final fileName = _uniqueKeyFor(
      options.queryParameters,
      path,
      options.method,
    );
    final filePath = '$mockDataPath/$fileName.json';
    final file = File(filePath);

    if (file.existsSync()) {
      final responseBody = file.readAsStringSync();
      final responseBodyJson = json.decode(responseBody);
      final response = _createResponse(options, responseBodyJson, 200);
      await Future<void>.delayed(const Duration(milliseconds: 300));
      handler.resolve(response);
      return;
    }
    {
      throw DioException(requestOptions: options);
    }
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (isRecordEnabled) {
      options.headers['Authorization'] = "Bearer $accessToken";
      return handler.next(options);
    }

    if (!isMockEnabled) {
      return handler.next(options);
    }

    try {
      await _handleMockedResponse(options, handler);
    } catch (e) {
      try {
        await _handleRecordedResponse(options, handler);
      } catch (e) {
        handler.reject(DioException(requestOptions: options, error: e));
      }
    }
  }

  List<MockResponse> _getMocksForPath(String path) {
    if (!apiPathToMockResponseMapping.containsKey(path)) {
      throw Exception('No mapping found for $path');
    }
    final mocks = apiPathToMockResponseMapping[path];
    if (mocks == null || mocks.isEmpty) {
      throw Exception('No mock found for $path');
    }
    return mocks;
  }

  Future<String> _getResponseBody(MockResponse mockResponse) async {
    if (mockResponse.body.isNotEmpty) {
      return mockResponse.body;
    }
    if (mockResponse.bodyFilePath.isNotEmpty) {
      return rootBundle.loadString(mockResponse.bodyFilePath, cache: false);
    }
    if (mockResponse.code < 400) {
      throw Exception(
        'No mock response body or file path found for $mockResponse',
      );
    }
    return '';
  }

  Response<Object?> _createResponse(
    RequestOptions options,
    Object? data,
    int statusCode,
  ) {
    return Response(
      requestOptions: options,
      data: data,
      statusCode: statusCode,
    );
  }

  void _updateMocksList(List<MockResponse> mocks) {
    if (mocks.length > 1) {
      mocks.removeAt(0);
    }
  }

  void reset() {
    isMockEnabled = true;
    apiPathToMockResponseMapping = {};
  }
}
