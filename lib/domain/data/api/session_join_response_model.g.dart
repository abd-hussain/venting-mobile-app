// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_join_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionJoinResponseModel _$SessionJoinResponseModelFromJson(
  Map<String, dynamic> json,
) => _SessionJoinResponseModel(
  status: json['status'] as String,
  data: SessionJoinData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionJoinResponseModelToJson(
  _SessionJoinResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_SessionJoinData _$SessionJoinDataFromJson(Map<String, dynamic> json) =>
    _SessionJoinData(
      call_token: json['call_token'] as String? ?? '',
      channel_id: json['channel_id'] as String? ?? '',
      expires_at: json['expires_at'] as String? ?? '',
      ice_servers: (json['ice_servers'] as List<dynamic>?)
          ?.map(
            (e) =>
                SessionJoinIceServerModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$SessionJoinDataToJson(_SessionJoinData instance) =>
    <String, dynamic>{
      'call_token': instance.call_token,
      'channel_id': instance.channel_id,
      'expires_at': instance.expires_at,
      'ice_servers': instance.ice_servers,
    };

_SessionJoinIceServerModel _$SessionJoinIceServerModelFromJson(
  Map<String, dynamic> json,
) => _SessionJoinIceServerModel(
  urls:
      (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
);

Map<String, dynamic> _$SessionJoinIceServerModelToJson(
  _SessionJoinIceServerModel instance,
) => <String, dynamic>{'urls': instance.urls};
