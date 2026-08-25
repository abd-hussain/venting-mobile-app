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
  // ignore: sort_unnamed_constructors_first
  const AuthMeData._();

  factory AuthMeData.fromJson(Map<String, dynamic> json) {
    bool readBool(Object? value) {
      if (value is bool) return value;
      if (value is num) return value != 0;
      if (value is String) {
        final normalized = value.trim().toLowerCase();
        return normalized == 'true' || normalized == '1';
      }
      return false;
    }

    return AuthMeData(
      id: '${json['id'] ?? ''}',
      email: '${json['email'] ?? ''}'.trim().toLowerCase(),
      role: '${json['role'] ?? 'ventor'}'.trim().toLowerCase(),
      display_name: (json['display_name'] ?? json['displayName']) as String?,
      avatar_url: (json['avatar_url'] ?? json['avatarUrl']) as String?,
      registration_complete: readBool(
        json['registration_complete'] ??
            json['registrationComplete'] ??
            json['profile_complete'] ??
            json['profileComplete'],
      ),
      listener_profile_status:
          (json['listener_profile_status'] ?? json['listenerProfileStatus'])
              as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'role': role,
    'display_name': display_name,
    'avatar_url': avatar_url,
    'registration_complete': registration_complete,
    'listener_profile_status': listener_profile_status,
  };
}
