// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_me_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthMeResponseModel _$AuthMeResponseModelFromJson(Map<String, dynamic> json) =>
    _AuthMeResponseModel(
      status: json['status'] as String,
      data: AuthMeData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthMeResponseModelToJson(
  _AuthMeResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};
