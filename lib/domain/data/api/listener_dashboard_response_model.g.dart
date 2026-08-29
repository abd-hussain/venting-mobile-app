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

_ListenerDashboardData _$ListenerDashboardDataFromJson(
  Map<String, dynamic> json,
) => _ListenerDashboardData(
  display_name: json['display_name'] as String? ?? '',
  reminder: json['reminder'] == null
      ? null
      : ListenerDashboardReminderModel.fromJson(
          json['reminder'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ListenerDashboardDataToJson(
  _ListenerDashboardData instance,
) => <String, dynamic>{
  'display_name': instance.display_name,
  'reminder': instance.reminder,
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
