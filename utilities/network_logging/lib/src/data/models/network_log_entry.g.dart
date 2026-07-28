// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NetworkLogEntry _$NetworkLogEntryFromJson(Map<String, dynamic> json) =>
    _NetworkLogEntry(
      id: json['id'] as String,
      url: json['url'] as String,
      method: json['method'] as String,
      requestTimestamp: DateTime.parse(json['requestTimestamp'] as String),
      responseTimestamp: json['responseTimestamp'] == null
          ? null
          : DateTime.parse(json['responseTimestamp'] as String),
      requestHeaders: json['requestHeaders'] as Map<String, dynamic>,
      requestBody: json['requestBody'] as String?,
      statusCode: (json['statusCode'] as num?)?.toInt(),
      responseHeaders: json['responseHeaders'] as Map<String, dynamic>?,
      responseBody: json['responseBody'] as String?,
      errorMessage: json['errorMessage'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
      isSensitive: json['isSensitive'] as bool? ?? false,
      isBodyTruncated: json['isBodyTruncated'] as bool? ?? false,
      requestBodySize: (json['requestBodySize'] as num?)?.toInt(),
      responseBodySize: (json['responseBodySize'] as num?)?.toInt(),
      eventType:
          $enumDecodeNullable(_$NetworkEventTypeEnumMap, json['eventType']) ??
          NetworkEventType.http,
      socketEvent: json['socketEvent'] as String?,
      socketTargets: (json['socketTargets'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      socketArgs: (json['socketArgs'] as List<dynamic>?)
          ?.map((e) => e as Object)
          .toList(),
    );

Map<String, dynamic> _$NetworkLogEntryToJson(_NetworkLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'method': instance.method,
      'requestTimestamp': instance.requestTimestamp.toIso8601String(),
      'responseTimestamp': instance.responseTimestamp?.toIso8601String(),
      'requestHeaders': instance.requestHeaders,
      'requestBody': instance.requestBody,
      'statusCode': instance.statusCode,
      'responseHeaders': instance.responseHeaders,
      'responseBody': instance.responseBody,
      'errorMessage': instance.errorMessage,
      'duration': instance.duration,
      'isSensitive': instance.isSensitive,
      'isBodyTruncated': instance.isBodyTruncated,
      'requestBodySize': instance.requestBodySize,
      'responseBodySize': instance.responseBodySize,
      'eventType': _$NetworkEventTypeEnumMap[instance.eventType]!,
      'socketEvent': instance.socketEvent,
      'socketTargets': instance.socketTargets,
      'socketArgs': instance.socketArgs,
    };

const _$NetworkEventTypeEnumMap = {
  NetworkEventType.http: 'http',
  NetworkEventType.socket: 'socket',
};
