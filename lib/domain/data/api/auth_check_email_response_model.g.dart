// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_check_email_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthCheckEmailResponseModel _$AuthCheckEmailResponseModelFromJson(
  Map<String, dynamic> json,
) => _AuthCheckEmailResponseModel(
  status: json['status'] as String,
  data: AuthCheckEmailData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthCheckEmailResponseModelToJson(
  _AuthCheckEmailResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_AuthCheckEmailData _$AuthCheckEmailDataFromJson(Map<String, dynamic> json) =>
    _AuthCheckEmailData(
      exists: json['exists'] as bool,
      email: json['email'] as String,
      role: json['role'] as String?,
      registration_complete: json['registration_complete'] as bool?,
      listener_profile_status: json['listener_profile_status'] as String?,
    );

Map<String, dynamic> _$AuthCheckEmailDataToJson(_AuthCheckEmailData instance) =>
    <String, dynamic>{
      'exists': instance.exists,
      'email': instance.email,
      'role': instance.role,
      'registration_complete': instance.registration_complete,
      'listener_profile_status': instance.listener_profile_status,
    };
