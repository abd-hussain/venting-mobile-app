import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_online_status_response_model.freezed.dart';
part 'listener_online_status_response_model.g.dart';

@freezed
abstract class ListenerOnlineStatusResponseModel
    with _$ListenerOnlineStatusResponseModel {
  const factory ListenerOnlineStatusResponseModel({
    required String status,
    required ListenerOnlineStatusData data,
  }) = _ListenerOnlineStatusResponseModel;

  factory ListenerOnlineStatusResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerOnlineStatusResponseModelFromJson(json);
}

@freezed
abstract class ListenerOnlineStatusData with _$ListenerOnlineStatusData {
  const factory ListenerOnlineStatusData({@Default(false) bool is_online}) =
      _ListenerOnlineStatusData;

  factory ListenerOnlineStatusData.fromJson(Map<String, dynamic> json) =>
      _$ListenerOnlineStatusDataFromJson(json);
}
