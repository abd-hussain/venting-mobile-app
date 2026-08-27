import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_profile_response_model.freezed.dart';
part 'listener_profile_response_model.g.dart';

@freezed
abstract class ListenerProfileResponseModel
    with _$ListenerProfileResponseModel {
  const factory ListenerProfileResponseModel({
    required String status,
    required ListenerProfileData data,
  }) = _ListenerProfileResponseModel;

  factory ListenerProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerProfileResponseModelFromJson(json);
}

@freezed
abstract class ListenerProfileData with _$ListenerProfileData {
  const factory ListenerProfileData({
    @Default('') String phone,
    @Default('') String phone_country,
  }) = _ListenerProfileData;

  factory ListenerProfileData.fromJson(Map<String, dynamic> json) =>
      _$ListenerProfileDataFromJson(json);
}
