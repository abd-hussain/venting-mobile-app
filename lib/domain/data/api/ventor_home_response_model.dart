import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_home_response_model.freezed.dart';
part 'ventor_home_response_model.g.dart';

@freezed
abstract class VentorHomeResponseModel with _$VentorHomeResponseModel {
  const factory VentorHomeResponseModel({
    required String status,
    required VentorHomeData data,
  }) = _VentorHomeResponseModel;

  factory VentorHomeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorHomeResponseModelFromJson(json);
}

@freezed
abstract class VentorHomeData with _$VentorHomeData {
  const factory VentorHomeData({
    @Default('') String display_name,
    VentorHomeMoodCheckinModel? mood_checkin_today,
    VentorHomeStreakModel? streak,
    VentorHomeBookedSessionModel? upcoming_session,
    @Default(<VentorHomeRecentSessionModel>[])
    List<VentorHomeRecentSessionModel> recent_sessions,
    String? motivation,
  }) = _VentorHomeData;

  factory VentorHomeData.fromJson(Map<String, dynamic> json) =>
      _$VentorHomeDataFromJson(json);
}

@freezed
abstract class VentorHomeMoodCheckinModel with _$VentorHomeMoodCheckinModel {
  const factory VentorHomeMoodCheckinModel({
    @Default('') String mood,
    String? note,
  }) = _VentorHomeMoodCheckinModel;

  factory VentorHomeMoodCheckinModel.fromJson(Map<String, dynamic> json) =>
      _$VentorHomeMoodCheckinModelFromJson(json);
}

@freezed
abstract class VentorHomeStreakModel with _$VentorHomeStreakModel {
  const factory VentorHomeStreakModel({
    @Default(0) int current_days,
    @Default(7) int target_days,
    String? reward_offer_id,
    @Default(0) int discount_percent,
  }) = _VentorHomeStreakModel;

  factory VentorHomeStreakModel.fromJson(Map<String, dynamic> json) =>
      _$VentorHomeStreakModelFromJson(json);
}

@freezed
abstract class VentorHomeBookedSessionModel
    with _$VentorHomeBookedSessionModel {
  const factory VentorHomeBookedSessionModel({
    @Default('') String id,
    @Default('') String listener_id,
    @Default('') String listener_name,
    @Default('') String listener_avatar_url,
    @Default(0) int duration_minutes,
    @Default('upcoming') String status,
    @Default('voice') String call_mode,
    @Default('') String speech_language,
    @Default(0) num amount_paid,
    @Default(false) bool voice_change_enabled,
    String? scheduled_at,
    @Default(false) bool is_instant,
    num? refunded_to_balance,
  }) = _VentorHomeBookedSessionModel;

  factory VentorHomeBookedSessionModel.fromJson(Map<String, dynamic> json) =>
      _$VentorHomeBookedSessionModelFromJson(json);
}

@freezed
abstract class VentorHomeRecentSessionModel
    with _$VentorHomeRecentSessionModel {
  const factory VentorHomeRecentSessionModel({
    @Default('') String id,
    @Default('') String listener_name,
    @Default('') String listener_avatar_url,
    @Default('') String when_label,
    @Default(0) int duration_minutes,
    @Default(false) bool is_favorite,
  }) = _VentorHomeRecentSessionModel;

  factory VentorHomeRecentSessionModel.fromJson(Map<String, dynamic> json) =>
      _$VentorHomeRecentSessionModelFromJson(json);
}
