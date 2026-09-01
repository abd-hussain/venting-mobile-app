import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_notification_preferences_response_model.freezed.dart';
part 'ventor_notification_preferences_response_model.g.dart';

@freezed
abstract class VentorNotificationPreferencesResponseModel
    with _$VentorNotificationPreferencesResponseModel {
  const factory VentorNotificationPreferencesResponseModel({
    required String status,
    required VentorNotificationPreferencesData data,
  }) = _VentorNotificationPreferencesResponseModel;

  factory VentorNotificationPreferencesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorNotificationPreferencesResponseModelFromJson(json);
}

@freezed
abstract class VentorNotificationPreferencesData
    with _$VentorNotificationPreferencesData {
  const factory VentorNotificationPreferencesData({
    @Default(true) bool push_enabled,
    @Default(true) bool session_reminder_30_min,
    @Default(true) bool session_reminder_15_min,
    @Default(true) bool session_reminder_10_min,
    @Default(true) bool session_reminder_5_min,
    @Default(true) bool rewards_updates,
    @Default(true) bool promotions_updates,
    @Default(true) bool email_enabled,
  }) = _VentorNotificationPreferencesData;

  factory VentorNotificationPreferencesData.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorNotificationPreferencesDataFromJson(json);
}
