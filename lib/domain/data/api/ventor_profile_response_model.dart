import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_profile_response_model.freezed.dart';
part 'ventor_profile_response_model.g.dart';

@freezed
abstract class VentorProfileResponseModel with _$VentorProfileResponseModel {
  const factory VentorProfileResponseModel({
    required String status,
    required VentorProfileData data,
  }) = _VentorProfileResponseModel;

  factory VentorProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorProfileResponseModelFromJson(json);
}

@freezed
abstract class VentorProfileData with _$VentorProfileData {
  const factory VentorProfileData({
    required String id,
    required String nickname,
    String? email,
    String? avatar_url,
    String? gender,
    String? quote,
    @Default(true) bool is_anonymous,
    VentorProfileStats? stats,
    @Default(<String>[]) List<String> language_ids,
    @Default(<String>[]) List<String> interest_ids,
    String? other_interest_text,
  }) = _VentorProfileData;

  factory VentorProfileData.fromJson(Map<String, dynamic> json) =>
      _$VentorProfileDataFromJson(json);
}

@freezed
abstract class VentorProfileStats with _$VentorProfileStats {
  const factory VentorProfileStats({
    @Default(0) int sessions_count,
    @Default(0) int points,
    @Default(0) int streak_days,
  }) = _VentorProfileStats;

  factory VentorProfileStats.fromJson(Map<String, dynamic> json) =>
      _$VentorProfileStatsFromJson(json);
}
