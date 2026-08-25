import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_check_email_response_model.freezed.dart';
part 'auth_check_email_response_model.g.dart';

@freezed
abstract class AuthCheckEmailResponseModel with _$AuthCheckEmailResponseModel {
  const factory AuthCheckEmailResponseModel({
    required String status,
    required AuthCheckEmailData data,
  }) = _AuthCheckEmailResponseModel;

  factory AuthCheckEmailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthCheckEmailResponseModelFromJson(json);
}

@freezed
abstract class AuthCheckEmailData with _$AuthCheckEmailData {
  const factory AuthCheckEmailData({
    required bool exists,
    required String email,
    String? role,
    bool? registration_complete,
    String? listener_profile_status,
  }) = _AuthCheckEmailData;

  factory AuthCheckEmailData.fromJson(Map<String, dynamic> json) =>
      _$AuthCheckEmailDataFromJson(json);
}
