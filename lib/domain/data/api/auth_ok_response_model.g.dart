// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_ok_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthOkResponseModel _$AuthOkResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthOkResponseModel(
      status: json['status'] as String,
      data: AuthOkData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthOkResponseModelToJson(
  _AuthOkResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_AuthOkData _$AuthOkDataFromJson(Map<String, dynamic> json) =>
    _AuthOkData(ok: json['ok'] as bool? ?? true);

Map<String, dynamic> _$AuthOkDataToJson(_AuthOkData instance) =>
    <String, dynamic>{'ok': instance.ok};
