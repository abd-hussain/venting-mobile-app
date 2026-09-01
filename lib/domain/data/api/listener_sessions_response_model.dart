import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_sessions_response_model.freezed.dart';
part 'listener_sessions_response_model.g.dart';

@freezed
abstract class ListenerSessionsListResponseModel
    with _$ListenerSessionsListResponseModel {
  const factory ListenerSessionsListResponseModel({
    required String status,
    required ListenerSessionsListData data,
  }) = _ListenerSessionsListResponseModel;

  factory ListenerSessionsListResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerSessionsListResponseModelFromJson(json);
}

@freezed
abstract class ListenerSessionsListData with _$ListenerSessionsListData {
  const factory ListenerSessionsListData({
    @Default(<ListenerSessionModel>[]) List<ListenerSessionModel> items,
  }) = _ListenerSessionsListData;

  factory ListenerSessionsListData.fromJson(Map<String, dynamic> json) =>
      _$ListenerSessionsListDataFromJson(json);
}

@freezed
abstract class ListenerSessionModel with _$ListenerSessionModel {
  const factory ListenerSessionModel({
    @Default('') String id,
    @Default('') String scheduled_at,
    @Default(0) int duration_minutes,
    @Default('') String ventor_name,
    String? ventor_avatar_url,
    @Default('') String message,
    @Default('') String chosen_reason,
    @Default(<String>[]) List<String> tags,
    String? speech_language,
    @Default(false) bool is_waiting,
    @Default(false) bool can_join_now,
    @Default(false) bool is_instant,
    @Default(false) bool is_video_call,
    @Default(0) num ventor_rating,
    String? status_label,
    num? session_cost,
    @Default(false) bool is_missed,
    String? history_outcome,
  }) = _ListenerSessionModel;

  factory ListenerSessionModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerSessionModelFromJson(json);
}

@freezed
abstract class ListenerSessionStatsResponseModel
    with _$ListenerSessionStatsResponseModel {
  const factory ListenerSessionStatsResponseModel({
    required String status,
    required ListenerSessionStatsData data,
  }) = _ListenerSessionStatsResponseModel;

  factory ListenerSessionStatsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerSessionStatsResponseModelFromJson(json);
}

@freezed
abstract class ListenerSessionStatsData with _$ListenerSessionStatsData {
  const factory ListenerSessionStatsData({
    @Default(0) int accepted_count,
    @Default(0) int declined_count,
    @Default(0) int missed_count,
  }) = _ListenerSessionStatsData;

  factory ListenerSessionStatsData.fromJson(Map<String, dynamic> json) =>
      _$ListenerSessionStatsDataFromJson(json);
}

@freezed
abstract class ListenerSessionRequestsResponseModel
    with _$ListenerSessionRequestsResponseModel {
  const factory ListenerSessionRequestsResponseModel({
    required String status,
    required ListenerSessionRequestsData data,
  }) = _ListenerSessionRequestsResponseModel;

  factory ListenerSessionRequestsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerSessionRequestsResponseModelFromJson(json);
}

@freezed
abstract class ListenerSessionRequestsData with _$ListenerSessionRequestsData {
  const factory ListenerSessionRequestsData({
    @Default(<ListenerSessionRequestModel>[])
    List<ListenerSessionRequestModel> items,
  }) = _ListenerSessionRequestsData;

  factory ListenerSessionRequestsData.fromJson(Map<String, dynamic> json) =>
      _$ListenerSessionRequestsDataFromJson(json);
}

@freezed
abstract class ListenerSessionRequestModel with _$ListenerSessionRequestModel {
  const factory ListenerSessionRequestModel({
    @Default('') String id,
    @Default('') String ventor_name,
    String? ventor_avatar_url,
    @Default('') String message,
    @Default('') String chosen_reason,
    @Default('') String scheduled_at,
    @Default(0) int duration_minutes,
    @Default(<String>[]) List<String> tags,
    @Default('') String received_at,
    String? speech_language,
    @Default(false) bool is_instant,
    @Default(false) bool is_video_call,
    @Default(0) num ventor_rating,
  }) = _ListenerSessionRequestModel;

  factory ListenerSessionRequestModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerSessionRequestModelFromJson(json);
}

@freezed
abstract class ListenerAcceptSessionRequestResponseModel
    with _$ListenerAcceptSessionRequestResponseModel {
  const factory ListenerAcceptSessionRequestResponseModel({
    required String status,
    required ListenerAcceptSessionRequestData data,
  }) = _ListenerAcceptSessionRequestResponseModel;

  factory ListenerAcceptSessionRequestResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerAcceptSessionRequestResponseModelFromJson(json);
}

@freezed
abstract class ListenerAcceptSessionRequestData
    with _$ListenerAcceptSessionRequestData {
  const factory ListenerAcceptSessionRequestData({
    @Default('') String session_id,
    @Default('') String status,
  }) = _ListenerAcceptSessionRequestData;

  factory ListenerAcceptSessionRequestData.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerAcceptSessionRequestDataFromJson(json);
}
