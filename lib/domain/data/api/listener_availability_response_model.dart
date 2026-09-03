import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_availability_response_model.freezed.dart';
part 'listener_availability_response_model.g.dart';

@freezed
abstract class ListenerAvailabilityResponseModel
    with _$ListenerAvailabilityResponseModel {
  const factory ListenerAvailabilityResponseModel({
    required String status,
    required ListenerAvailabilityData data,
  }) = _ListenerAvailabilityResponseModel;

  factory ListenerAvailabilityResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerAvailabilityResponseModelFromJson(json);
}

@freezed
abstract class ListenerAvailabilityData with _$ListenerAvailabilityData {
  const factory ListenerAvailabilityData({
    @Default(30) int break_length_minutes,
    @Default('') String time_zone_id,
    @Default(<String>[]) List<String> language_ids,
    @Default(<ListenerAvailabilityDayData>[])
    List<ListenerAvailabilityDayData> days,
    Object? session_minutes,
    int? session_length_minutes,
  }) = _ListenerAvailabilityData;

  factory ListenerAvailabilityData.fromJson(Map<String, dynamic> json) =>
      _$ListenerAvailabilityDataFromJson(json);
}

@freezed
abstract class ListenerAvailabilityDayData with _$ListenerAvailabilityDayData {
  const factory ListenerAvailabilityDayData({
    @Default('') String day,
    @Default(<ListenerAvailabilitySlotData>[])
    List<ListenerAvailabilitySlotData> slots,
  }) = _ListenerAvailabilityDayData;

  factory ListenerAvailabilityDayData.fromJson(Map<String, dynamic> json) =>
      _$ListenerAvailabilityDayDataFromJson(json);
}

@freezed
abstract class ListenerAvailabilitySlotData
    with _$ListenerAvailabilitySlotData {
  const factory ListenerAvailabilitySlotData({
    @Default('') String start,
    @Default('') String end,
  }) = _ListenerAvailabilitySlotData;

  factory ListenerAvailabilitySlotData.fromJson(Map<String, dynamic> json) =>
      _$ListenerAvailabilitySlotDataFromJson(json);
}
