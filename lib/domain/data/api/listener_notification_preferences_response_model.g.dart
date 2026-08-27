// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_notification_preferences_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerNotificationPreferencesResponseModel
_$ListenerNotificationPreferencesResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerNotificationPreferencesResponseModel(
  status: json['status'] as String,
  data: ListenerNotificationPreferencesData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$ListenerNotificationPreferencesResponseModelToJson(
  _ListenerNotificationPreferencesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerNotificationPreferencesData
_$ListenerNotificationPreferencesDataFromJson(Map<String, dynamic> json) =>
    _ListenerNotificationPreferencesData(
      push_enabled: json['push_enabled'] as bool? ?? true,
      new_session_requests: json['new_session_requests'] as bool? ?? true,
      session_reminder_15_min: json['session_reminder_15_min'] as bool? ?? true,
      session_reminder_10_min: json['session_reminder_10_min'] as bool? ?? true,
      session_reminder_5_min: json['session_reminder_5_min'] as bool? ?? true,
      reviews_feedback: json['reviews_feedback'] as bool? ?? true,
      tips_earnings: json['tips_earnings'] as bool? ?? true,
      promotions_updates: json['promotions_updates'] as bool? ?? false,
      email_enabled: json['email_enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$ListenerNotificationPreferencesDataToJson(
  _ListenerNotificationPreferencesData instance,
) => <String, dynamic>{
  'push_enabled': instance.push_enabled,
  'new_session_requests': instance.new_session_requests,
  'session_reminder_15_min': instance.session_reminder_15_min,
  'session_reminder_10_min': instance.session_reminder_10_min,
  'session_reminder_5_min': instance.session_reminder_5_min,
  'reviews_feedback': instance.reviews_feedback,
  'tips_earnings': instance.tips_earnings,
  'promotions_updates': instance.promotions_updates,
  'email_enabled': instance.email_enabled,
};
