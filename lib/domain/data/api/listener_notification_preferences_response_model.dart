import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_notification_preferences_response_model.freezed.dart';
part 'listener_notification_preferences_response_model.g.dart';

@freezed
abstract class ListenerNotificationPreferencesResponseModel
    with _$ListenerNotificationPreferencesResponseModel {
  const factory ListenerNotificationPreferencesResponseModel({
    required String status,
    required ListenerNotificationPreferencesData data,
  }) = _ListenerNotificationPreferencesResponseModel;

  factory ListenerNotificationPreferencesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerNotificationPreferencesResponseModelFromJson(json);
}

@freezed
abstract class ListenerNotificationPreferencesData
    with _$ListenerNotificationPreferencesData {
  const factory ListenerNotificationPreferencesData({
    @Default(true) bool push_enabled,
    @Default(true) bool new_session_requests,
    @Default(true) bool session_reminder_15_min,
    @Default(true) bool session_reminder_10_min,
    @Default(true) bool session_reminder_5_min,
    @Default(true) bool reviews_feedback,
    @Default(true) bool tips_earnings,
    @Default(false) bool promotions_updates,
    @Default(true) bool email_enabled,
  }) = _ListenerNotificationPreferencesData;

  factory ListenerNotificationPreferencesData.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerNotificationPreferencesDataFromJson(json);
}
