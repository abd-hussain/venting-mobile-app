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

ListenerDashboardReminderModel? _reminderFromJson(Object? json) {
  if (json == null) return null;
  if (json is Map<String, dynamic>) {
    return ListenerDashboardReminderModel.fromJson(json);
  }
  if (json is String) {
    final message = json.trim();
    if (message.isEmpty) return null;
    return ListenerDashboardReminderModel(message: message);
  }
  return null;
}

ListenerDashboardUpcomingSessionModel? _upcomingFromJson(Object? json) {
  if (json is! Map<String, dynamic>) return null;
  return ListenerDashboardUpcomingSessionModel.fromJson(json);
}

@Freezed(fromJson: false)
abstract class ListenerDashboardData with _$ListenerDashboardData {
  const factory ListenerDashboardData({
    @Default('') String display_name,
    @Default(false) bool is_online,
    ListenerDashboardReminderModel? reminder,
    ListenerDashboardUpcomingSessionModel? next_upcoming_session,
  }) = _ListenerDashboardData;

  factory ListenerDashboardData.fromJson(Map<String, dynamic> json) =>
      ListenerDashboardData(
        display_name: json['display_name'] as String? ?? '',
        is_online: json['is_online'] as bool? ?? false,
        reminder: _reminderFromJson(json['reminder']),
        next_upcoming_session: _upcomingFromJson(json['next_upcoming_session']),
      );
}

@freezed
abstract class ListenerDashboardUpcomingSessionModel
    with _$ListenerDashboardUpcomingSessionModel {
  const factory ListenerDashboardUpcomingSessionModel({
    @Default('') String id,
    @Default('') String ventor_name,
    @Default('') String when_label,
    @Default(0) int duration_minutes,
    String? ventor_avatar_url,
  }) = _ListenerDashboardUpcomingSessionModel;

  factory ListenerDashboardUpcomingSessionModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerDashboardUpcomingSessionModelFromJson(json);
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
