import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_model.freezed.dart';

@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    required String id,
    required String email,
    required String role,
    @Default(false) bool is_new,
    @Default(false) bool registration_complete,
  }) = _AuthUserModel;
  // ignore: sort_unnamed_constructors_first
  const AuthUserModel._();

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    bool readBool(Object? value) {
      if (value is bool) return value;
      if (value is num) return value != 0;
      if (value is String) {
        final normalized = value.trim().toLowerCase();
        return normalized == 'true' || normalized == '1';
      }
      return false;
    }

    return AuthUserModel(
      id: '${json['id'] ?? ''}',
      email: '${json['email'] ?? ''}'.trim().toLowerCase(),
      role: '${json['role'] ?? 'ventor'}'.trim().toLowerCase(),
      is_new: readBool(json['is_new'] ?? json['isNew']),
      registration_complete: readBool(
        json['registration_complete'] ??
            json['registrationComplete'] ??
            json['profile_complete'] ??
            json['profileComplete'],
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'role': role,
    'is_new': is_new,
    'registration_complete': registration_complete,
  };
}
