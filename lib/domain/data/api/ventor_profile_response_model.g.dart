// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorProfileResponseModel _$VentorProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorProfileResponseModel(
  status: json['status'] as String,
  data: VentorProfileData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorProfileResponseModelToJson(
  _VentorProfileResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorProfileData _$VentorProfileDataFromJson(Map<String, dynamic> json) =>
    _VentorProfileData(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      email: json['email'] as String?,
      avatar_url: json['avatar_url'] as String?,
      gender: json['gender'] as String?,
      quote: json['quote'] as String?,
      is_anonymous: json['is_anonymous'] as bool? ?? true,
      stats: json['stats'] == null
          ? null
          : VentorProfileStats.fromJson(json['stats'] as Map<String, dynamic>),
      language_ids:
          (json['language_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      interest_ids:
          (json['interest_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      other_interest_text: json['other_interest_text'] as String?,
    );

Map<String, dynamic> _$VentorProfileDataToJson(_VentorProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'email': instance.email,
      'avatar_url': instance.avatar_url,
      'gender': instance.gender,
      'quote': instance.quote,
      'is_anonymous': instance.is_anonymous,
      'stats': instance.stats,
      'language_ids': instance.language_ids,
      'interest_ids': instance.interest_ids,
      'other_interest_text': instance.other_interest_text,
    };

_VentorProfileStats _$VentorProfileStatsFromJson(Map<String, dynamic> json) =>
    _VentorProfileStats(
      sessions_count: (json['sessions_count'] as num?)?.toInt() ?? 0,
      points: (json['points'] as num?)?.toInt() ?? 0,
      streak_days: (json['streak_days'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VentorProfileStatsToJson(_VentorProfileStats instance) =>
    <String, dynamic>{
      'sessions_count': instance.sessions_count,
      'points': instance.points,
      'streak_days': instance.streak_days,
    };
