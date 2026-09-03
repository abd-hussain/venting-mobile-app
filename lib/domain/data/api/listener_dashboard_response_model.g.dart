// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_dashboard_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerDashboardResponseModel _$ListenerDashboardResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerDashboardResponseModel(
  status: json['status'] as String,
  data: ListenerDashboardData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerDashboardResponseModelToJson(
  _ListenerDashboardResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

Map<String, dynamic> _$ListenerDashboardDataToJson(
  _ListenerDashboardData instance,
) => <String, dynamic>{
  'display_name': instance.display_name,
  'reminder': instance.reminder,
  'next_upcoming_session': instance.next_upcoming_session,
};

_ListenerDashboardUpcomingSessionModel
_$ListenerDashboardUpcomingSessionModelFromJson(Map<String, dynamic> json) =>
    _ListenerDashboardUpcomingSessionModel(
      id: json['id'] as String? ?? '',
      ventor_name: json['ventor_name'] as String? ?? '',
      when_label: json['when_label'] as String? ?? '',
      duration_minutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
      ventor_avatar_url: json['ventor_avatar_url'] as String?,
    );

Map<String, dynamic> _$ListenerDashboardUpcomingSessionModelToJson(
  _ListenerDashboardUpcomingSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'ventor_name': instance.ventor_name,
  'when_label': instance.when_label,
  'duration_minutes': instance.duration_minutes,
  'ventor_avatar_url': instance.ventor_avatar_url,
};

_ListenerDashboardReminderModel _$ListenerDashboardReminderModelFromJson(
  Map<String, dynamic> json,
) => _ListenerDashboardReminderModel(
  title: json['title'] as String? ?? '',
  message: json['message'] as String? ?? '',
);

Map<String, dynamic> _$ListenerDashboardReminderModelToJson(
  _ListenerDashboardReminderModel instance,
) => <String, dynamic>{'title': instance.title, 'message': instance.message};
