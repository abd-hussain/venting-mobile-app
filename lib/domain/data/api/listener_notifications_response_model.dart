import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_notifications_response_model.freezed.dart';
part 'listener_notifications_response_model.g.dart';

@freezed
abstract class ListenerNotificationsResponseModel
    with _$ListenerNotificationsResponseModel {
  const factory ListenerNotificationsResponseModel({
    required String status,
    required ListenerNotificationsData data,
  }) = _ListenerNotificationsResponseModel;

  factory ListenerNotificationsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerNotificationsResponseModelFromJson(json);
}

@freezed
abstract class ListenerNotificationsData with _$ListenerNotificationsData {
  const factory ListenerNotificationsData({
    @Default(<ListenerNotificationItemModel>[])
    List<ListenerNotificationItemModel> items,
  }) = _ListenerNotificationsData;

  factory ListenerNotificationsData.fromJson(Map<String, dynamic> json) =>
      _$ListenerNotificationsDataFromJson(json);
}

@freezed
abstract class ListenerNotificationItemModel
    with _$ListenerNotificationItemModel {
  const factory ListenerNotificationItemModel({
    @Default('') String id,
    @Default('') String type,
    @Default('') String title,
    @Default('') String body,
    @Default('') String created_at,
    @Default(false) bool is_read,
    @Default(<String, dynamic>{}) Map<String, dynamic> data,
  }) = _ListenerNotificationItemModel;

  factory ListenerNotificationItemModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerNotificationItemModelFromJson(json);
}
