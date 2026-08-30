// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_notification_preferences_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorNotificationPreferencesResponseModel
_$VentorNotificationPreferencesResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorNotificationPreferencesResponseModel(
  status: json['status'] as String,
  data: VentorNotificationPreferencesData.fromJson(
    json['data'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$VentorNotificationPreferencesResponseModelToJson(
  _VentorNotificationPreferencesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorNotificationPreferencesData _$VentorNotificationPreferencesDataFromJson(
  Map<String, dynamic> json,
) => _VentorNotificationPreferencesData(
  push_enabled: json['push_enabled'] as bool? ?? true,
  session_reminder_30_min: json['session_reminder_30_min'] as bool? ?? true,
  session_reminder_15_min: json['session_reminder_15_min'] as bool? ?? true,
  session_reminder_10_min: json['session_reminder_10_min'] as bool? ?? true,
  session_reminder_5_min: json['session_reminder_5_min'] as bool? ?? true,
  rewards_updates: json['rewards_updates'] as bool? ?? true,
  promotions_updates: json['promotions_updates'] as bool? ?? true,
  email_enabled: json['email_enabled'] as bool? ?? true,
);

Map<String, dynamic> _$VentorNotificationPreferencesDataToJson(
  _VentorNotificationPreferencesData instance,
) => <String, dynamic>{
  'push_enabled': instance.push_enabled,
  'session_reminder_30_min': instance.session_reminder_30_min,
  'session_reminder_15_min': instance.session_reminder_15_min,
  'session_reminder_10_min': instance.session_reminder_10_min,
  'session_reminder_5_min': instance.session_reminder_5_min,
  'rewards_updates': instance.rewards_updates,
  'promotions_updates': instance.promotions_updates,
  'email_enabled': instance.email_enabled,
};
