// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_end_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionEndResponseModel _$SessionEndResponseModelFromJson(
  Map<String, dynamic> json,
) => _SessionEndResponseModel(
  status: json['status'] as String,
  data: SessionEndData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionEndResponseModelToJson(
  _SessionEndResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_SessionEndData _$SessionEndDataFromJson(Map<String, dynamic> json) =>
    _SessionEndData(
      session_id: json['session_id'] as String? ?? '',
      status: json['status'] as String? ?? 'completed',
    );

Map<String, dynamic> _$SessionEndDataToJson(_SessionEndData instance) =>
    <String, dynamic>{
      'session_id': instance.session_id,
      'status': instance.status,
    };
