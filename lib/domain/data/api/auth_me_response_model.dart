import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_me_response_model.freezed.dart';
part 'auth_me_response_model.g.dart';

@freezed
abstract class AuthMeResponseModel with _$AuthMeResponseModel {
  const factory AuthMeResponseModel({
    required String status,
    required AuthMeData data,
  }) = _AuthMeResponseModel;

  factory AuthMeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AuthMeResponseModelFromJson(json);
}

@freezed
abstract class AuthMeData with _$AuthMeData {
  const factory AuthMeData({
    required String id,
    required String email,
    required String role,
    String? display_name,
    String? avatar_url,
    @Default(false) bool registration_complete,
    String? listener_profile_status,
  }) = _AuthMeData;

  factory AuthMeData.fromJson(Map<String, dynamic> json) =>
      _$AuthMeDataFromJson(json);
}
