// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_online_status_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerOnlineStatusResponseModel _$ListenerOnlineStatusResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerOnlineStatusResponseModel(
  status: json['status'] as String,
  data: ListenerOnlineStatusData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerOnlineStatusResponseModelToJson(
  _ListenerOnlineStatusResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerOnlineStatusData _$ListenerOnlineStatusDataFromJson(
  Map<String, dynamic> json,
) => _ListenerOnlineStatusData(is_online: json['is_online'] as bool? ?? false);

Map<String, dynamic> _$ListenerOnlineStatusDataToJson(
  _ListenerOnlineStatusData instance,
) => <String, dynamic>{'is_online': instance.is_online};
