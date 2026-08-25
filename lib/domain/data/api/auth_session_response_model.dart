import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/domain/data/api/auth_user_model.dart';

part 'auth_session_response_model.freezed.dart';

@freezed
abstract class AuthSessionResponseModel with _$AuthSessionResponseModel {
  const factory AuthSessionResponseModel({
    required String status,
    required AuthSessionData data,
  }) = _AuthSessionResponseModel;

  factory AuthSessionResponseModel.fromJson(Map<String, dynamic> json) {
    // Support both `{ status, data: { tokens, user } }` and a bare session payload.
    final rawData = json['data'];
    if (rawData is Map) {
      return AuthSessionResponseModel(
        status: (json['status'] as String?) ?? 'success',
        data: AuthSessionData.fromJson(Map<String, dynamic>.from(rawData)),
      );
    }
    return AuthSessionResponseModel(
      status: (json['status'] as String?) ?? 'success',
      data: AuthSessionData.fromJson(json),
    );
  }
}

@freezed
abstract class AuthSessionData with _$AuthSessionData {
  const factory AuthSessionData({
    required String access_token,
    required String refresh_token,
    required AuthUserModel user,
  }) = _AuthSessionData;

  factory AuthSessionData.fromJson(Map<String, dynamic> json) {
    final rawUser = json['user'];
    if (rawUser is! Map) {
      throw const FormatException('Auth session response missing user object');
    }
    return AuthSessionData(
      access_token: json['access_token'] as String,
      refresh_token: json['refresh_token'] as String,
      user: AuthUserModel.fromJson(Map<String, dynamic>.from(rawUser)),
    );
  }
}
