import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_forgot_password_response_model.freezed.dart';
part 'auth_forgot_password_response_model.g.dart';

@freezed
abstract class AuthForgotPasswordResponseModel
    with _$AuthForgotPasswordResponseModel {
  const factory AuthForgotPasswordResponseModel({
    required String status,
    required AuthForgotPasswordData data,
  }) = _AuthForgotPasswordResponseModel;

  factory AuthForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthForgotPasswordResponseModelFromJson(json);
}

@freezed
abstract class AuthForgotPasswordData with _$AuthForgotPasswordData {
  const factory AuthForgotPasswordData({
    required String email,
    @Default(true) bool sent,
  }) = _AuthForgotPasswordData;

  factory AuthForgotPasswordData.fromJson(Map<String, dynamic> json) =>
      _$AuthForgotPasswordDataFromJson(json);
}
