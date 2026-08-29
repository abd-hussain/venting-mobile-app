import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_mood_journey_response_model.freezed.dart';
part 'ventor_mood_journey_response_model.g.dart';

@freezed
abstract class VentorMoodJourneyResponseModel
    with _$VentorMoodJourneyResponseModel {
  const factory VentorMoodJourneyResponseModel({
    required String status,
    required VentorMoodJourneyData data,
  }) = _VentorMoodJourneyResponseModel;

  factory VentorMoodJourneyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorMoodJourneyResponseModelFromJson(json);
}

@freezed
abstract class VentorMoodJourneyData with _$VentorMoodJourneyData {
  const factory VentorMoodJourneyData({
    @Default(<VentorMoodJourneyPointModel>[])
    List<VentorMoodJourneyPointModel> points,
  }) = _VentorMoodJourneyData;

  factory VentorMoodJourneyData.fromJson(Map<String, dynamic> json) =>
      _$VentorMoodJourneyDataFromJson(json);
}

@freezed
abstract class VentorMoodJourneyPointModel with _$VentorMoodJourneyPointModel {
  const factory VentorMoodJourneyPointModel({
    @Default(0) int day_index,
    @Default(0) num mood,
  }) = _VentorMoodJourneyPointModel;

  factory VentorMoodJourneyPointModel.fromJson(Map<String, dynamic> json) =>
      _$VentorMoodJourneyPointModelFromJson(json);
}
