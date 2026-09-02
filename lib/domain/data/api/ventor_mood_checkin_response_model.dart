import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_mood_checkin_response_model.freezed.dart';
part 'ventor_mood_checkin_response_model.g.dart';

@freezed
abstract class VentorMoodCheckinResponseModel
    with _$VentorMoodCheckinResponseModel {
  const factory VentorMoodCheckinResponseModel({
    required String status,
    required VentorMoodCheckinData data,
  }) = _VentorMoodCheckinResponseModel;

  factory VentorMoodCheckinResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorMoodCheckinResponseModelFromJson(json);
}

@freezed
abstract class VentorMoodCheckinData with _$VentorMoodCheckinData {
  const factory VentorMoodCheckinData({
    @Default('') String id,
    @Default('') String mood,
    String? note,
    @Default('') String at,
    VentorMoodCheckinStreakModel? streak,
  }) = _VentorMoodCheckinData;

  factory VentorMoodCheckinData.fromJson(Map<String, dynamic> json) =>
      _$VentorMoodCheckinDataFromJson(json);
}

@freezed
abstract class VentorMoodCheckinStreakModel with _$VentorMoodCheckinStreakModel {
  const factory VentorMoodCheckinStreakModel({
    @Default(0) int current_days,
    @Default(false) bool reward_unlocked,
  }) = _VentorMoodCheckinStreakModel;

  factory VentorMoodCheckinStreakModel.fromJson(Map<String, dynamic> json) =>
      _$VentorMoodCheckinStreakModelFromJson(json);
}
