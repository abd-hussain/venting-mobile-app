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

_AuthMeData _$AuthMeDataFromJson(Map<String, dynamic> json) => _AuthMeData(
  id: json['id'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
  display_name: json['display_name'] as String?,
  avatar_url: json['avatar_url'] as String?,
  registration_complete: json['registration_complete'] as bool? ?? false,
  listener_profile_status: json['listener_profile_status'] as String?,
);

Map<String, dynamic> _$AuthMeDataToJson(_AuthMeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'role': instance.role,
      'display_name': instance.display_name,
      'avatar_url': instance.avatar_url,
      'registration_complete': instance.registration_complete,
      'listener_profile_status': instance.listener_profile_status,
    };
