// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerRegisterResponseModel _$ListenerRegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerRegisterResponseModel(
  status: json['status'] as String,
  data: ListenerRegisterData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerRegisterResponseModelToJson(
  _ListenerRegisterResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerRegisterData _$ListenerRegisterDataFromJson(
  Map<String, dynamic> json,
) => _ListenerRegisterData(
  listener_id: json['listener_id'] as String,
  profile_status: json['profile_status'] as String,
);

Map<String, dynamic> _$ListenerRegisterDataToJson(
  _ListenerRegisterData instance,
) => <String, dynamic>{
  'listener_id': instance.listener_id,
  'profile_status': instance.profile_status,
};
