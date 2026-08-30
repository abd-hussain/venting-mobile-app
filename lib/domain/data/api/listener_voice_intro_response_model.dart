import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_voice_intro_response_model.freezed.dart';
part 'listener_voice_intro_response_model.g.dart';

@freezed
abstract class ListenerVoiceIntroResponseModel
    with _$ListenerVoiceIntroResponseModel {
  const factory ListenerVoiceIntroResponseModel({
    required String status,
    required ListenerVoiceIntroData data,
  }) = _ListenerVoiceIntroResponseModel;

  factory ListenerVoiceIntroResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerVoiceIntroResponseModelFromJson(json);
}

@freezed
abstract class ListenerVoiceIntroData with _$ListenerVoiceIntroData {
  const factory ListenerVoiceIntroData({
    @Default('') String voice_intro_url,
    @Default(0) int voice_intro_seconds,
  }) = _ListenerVoiceIntroData;

  factory ListenerVoiceIntroData.fromJson(Map<String, dynamic> json) =>
      _$ListenerVoiceIntroDataFromJson(json);
}
