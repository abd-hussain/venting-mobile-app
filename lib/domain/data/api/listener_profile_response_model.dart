import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_profile_response_model.freezed.dart';
part 'listener_profile_response_model.g.dart';

@freezed
abstract class ListenerProfileResponseModel
    with _$ListenerProfileResponseModel {
  const factory ListenerProfileResponseModel({
    required String status,
    required ListenerProfileData data,
  }) = _ListenerProfileResponseModel;

  factory ListenerProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerProfileResponseModelFromJson(json);
}

@freezed
abstract class ListenerProfileData with _$ListenerProfileData {
  const factory ListenerProfileData({
    @Default('') String id,
    @Default('') String full_name,
    @Default('') String email,
    @Default('') String phone,
    @Default('') String phone_country,
    String? avatar_url,
    String? about_me,
    String? country,
    @Default('') String country_iso,
    @Default('') String city,
    @Default(<String>[]) List<String> language_ids,
    Object? life_experiences,
    Object? comfort_areas,
    Object? boundaries,
    String? voice_intro_url,
    @Default(0) int voice_intro_seconds,
    @Default(0.0) double rating,
    @Default(0) int review_count,
    @Default(0) int session_count,
    @Default(false) bool is_online,
    @Default('') String profile_status,
    @Default(0.0) double rate_per_minute,
    String? date_of_birth,
    Map<String, dynamic>? rating_breakdown,
  }) = _ListenerProfileData;

  factory ListenerProfileData.fromJson(Map<String, dynamic> json) =>
      _$ListenerProfileDataFromJson(json);
}
