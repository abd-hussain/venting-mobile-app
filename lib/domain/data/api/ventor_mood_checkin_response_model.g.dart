// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_mood_checkin_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorMoodCheckinResponseModel _$VentorMoodCheckinResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorMoodCheckinResponseModel(
  status: json['status'] as String,
  data: VentorMoodCheckinData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorMoodCheckinResponseModelToJson(
  _VentorMoodCheckinResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorMoodCheckinData _$VentorMoodCheckinDataFromJson(
  Map<String, dynamic> json,
) => _VentorMoodCheckinData(
  id: json['id'] as String? ?? '',
  mood: json['mood'] as String? ?? '',
  note: json['note'] as String?,
  at: json['at'] as String? ?? '',
  streak: json['streak'] == null
      ? null
      : VentorMoodCheckinStreakModel.fromJson(
          json['streak'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$VentorMoodCheckinDataToJson(
  _VentorMoodCheckinData instance,
) => <String, dynamic>{
  'id': instance.id,
  'mood': instance.mood,
  'note': instance.note,
  'at': instance.at,
  'streak': instance.streak,
};

_VentorMoodCheckinStreakModel _$VentorMoodCheckinStreakModelFromJson(
  Map<String, dynamic> json,
) => _VentorMoodCheckinStreakModel(
  current_days: (json['current_days'] as num?)?.toInt() ?? 0,
  reward_unlocked: json['reward_unlocked'] as bool? ?? false,
);

Map<String, dynamic> _$VentorMoodCheckinStreakModelToJson(
  _VentorMoodCheckinStreakModel instance,
) => <String, dynamic>{
  'current_days': instance.current_days,
  'reward_unlocked': instance.reward_unlocked,
};
