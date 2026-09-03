import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_join_response_model.freezed.dart';
part 'session_join_response_model.g.dart';

@freezed
abstract class SessionJoinResponseModel with _$SessionJoinResponseModel {
  const factory SessionJoinResponseModel({
    required String status,
    required SessionJoinData data,
  }) = _SessionJoinResponseModel;

  factory SessionJoinResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionJoinResponseModelFromJson(json);
}

@freezed
abstract class SessionJoinData with _$SessionJoinData {
  const factory SessionJoinData({
    @Default('') String call_token,
    @Default('') String channel_id,
    @Default('') String expires_at,
    List<SessionJoinIceServerModel>? ice_servers,
  }) = _SessionJoinData;

  factory SessionJoinData.fromJson(Map<String, dynamic> json) =>
      _$SessionJoinDataFromJson(json);
}

@freezed
abstract class SessionJoinIceServerModel with _$SessionJoinIceServerModel {
  const factory SessionJoinIceServerModel({
    @Default(<String>[]) List<String> urls,
  }) = _SessionJoinIceServerModel;

  factory SessionJoinIceServerModel.fromJson(Map<String, dynamic> json) =>
      _$SessionJoinIceServerModelFromJson(json);
}
