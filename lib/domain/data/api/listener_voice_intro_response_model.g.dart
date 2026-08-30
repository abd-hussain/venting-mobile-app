// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_voice_intro_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerVoiceIntroResponseModel _$ListenerVoiceIntroResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerVoiceIntroResponseModel(
  status: json['status'] as String,
  data: ListenerVoiceIntroData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerVoiceIntroResponseModelToJson(
  _ListenerVoiceIntroResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerVoiceIntroData _$ListenerVoiceIntroDataFromJson(
  Map<String, dynamic> json,
) => _ListenerVoiceIntroData(
  voice_intro_url: json['voice_intro_url'] as String? ?? '',
  voice_intro_seconds: (json['voice_intro_seconds'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ListenerVoiceIntroDataToJson(
  _ListenerVoiceIntroData instance,
) => <String, dynamic>{
  'voice_intro_url': instance.voice_intro_url,
  'voice_intro_seconds': instance.voice_intro_seconds,
};
