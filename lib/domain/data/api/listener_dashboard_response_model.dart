import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_dashboard_response_model.freezed.dart';
part 'listener_dashboard_response_model.g.dart';

@freezed
abstract class ListenerDashboardResponseModel
    with _$ListenerDashboardResponseModel {
  const factory ListenerDashboardResponseModel({
    required String status,
    required ListenerDashboardData data,
  }) = _ListenerDashboardResponseModel;

  factory ListenerDashboardResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerDashboardResponseModelFromJson(json);
}

@freezed
abstract class ListenerDashboardData with _$ListenerDashboardData {
  const factory ListenerDashboardData({
    @Default('') String display_name,
    ListenerDashboardReminderModel? reminder,
  }) = _ListenerDashboardData;

  factory ListenerDashboardData.fromJson(Map<String, dynamic> json) =>
      _$ListenerDashboardDataFromJson(json);
}

@freezed
abstract class ListenerDashboardReminderModel
    with _$ListenerDashboardReminderModel {
  const factory ListenerDashboardReminderModel({
    @Default('') String title,
    @Default('') String message,
  }) = _ListenerDashboardReminderModel;

  factory ListenerDashboardReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerDashboardReminderModelFromJson(json);
}
