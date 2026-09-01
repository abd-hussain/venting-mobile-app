import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_register_response_model.freezed.dart';
part 'listener_register_response_model.g.dart';

@freezed
abstract class ListenerRegisterResponseModel with _$ListenerRegisterResponseModel {
  const factory ListenerRegisterResponseModel({
    required String status,
    required ListenerRegisterData data,
  }) = _ListenerRegisterResponseModel;

  factory ListenerRegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerRegisterResponseModelFromJson(json);
}

@freezed
abstract class ListenerRegisterData with _$ListenerRegisterData {
  const factory ListenerRegisterData({
    required String listener_id,
    required String profile_status,
  }) = _ListenerRegisterData;

  factory ListenerRegisterData.fromJson(Map<String, dynamic> json) =>
      _$ListenerRegisterDataFromJson(json);
}
