// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_forgot_password_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthForgotPasswordResponseModel _$AuthForgotPasswordResponseModelFromJson(
  Map<String, dynamic> json,
) => _AuthForgotPasswordResponseModel(
  status: json['status'] as String,
  data: AuthForgotPasswordData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AuthForgotPasswordResponseModelToJson(
  _AuthForgotPasswordResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_AuthForgotPasswordData _$AuthForgotPasswordDataFromJson(
  Map<String, dynamic> json,
) => _AuthForgotPasswordData(
  email: json['email'] as String,
  sent: json['sent'] as bool? ?? true,
);

Map<String, dynamic> _$AuthForgotPasswordDataToJson(
  _AuthForgotPasswordData instance,
) => <String, dynamic>{'email': instance.email, 'sent': instance.sent};
