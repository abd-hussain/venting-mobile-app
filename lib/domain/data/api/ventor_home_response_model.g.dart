// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_home_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorHomeResponseModel _$VentorHomeResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorHomeResponseModel(
  status: json['status'] as String,
  data: VentorHomeData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorHomeResponseModelToJson(
  _VentorHomeResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorHomeData _$VentorHomeDataFromJson(Map<String, dynamic> json) =>
    _VentorHomeData(
      display_name: json['display_name'] as String? ?? '',
      mood_checkin_today: json['mood_checkin_today'] == null
          ? null
          : VentorHomeMoodCheckinModel.fromJson(
              json['mood_checkin_today'] as Map<String, dynamic>,
            ),
      streak: json['streak'] == null
          ? null
          : VentorHomeStreakModel.fromJson(
              json['streak'] as Map<String, dynamic>,
            ),
      upcoming_session: json['upcoming_session'] == null
          ? null
          : VentorHomeBookedSessionModel.fromJson(
              json['upcoming_session'] as Map<String, dynamic>,
            ),
      recent_sessions:
          (json['recent_sessions'] as List<dynamic>?)
              ?.map(
                (e) => VentorHomeRecentSessionModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <VentorHomeRecentSessionModel>[],
      motivation: json['motivation'] as String?,
    );

Map<String, dynamic> _$VentorHomeDataToJson(_VentorHomeData instance) =>
    <String, dynamic>{
      'display_name': instance.display_name,
      'mood_checkin_today': instance.mood_checkin_today,
      'streak': instance.streak,
      'upcoming_session': instance.upcoming_session,
      'recent_sessions': instance.recent_sessions,
      'motivation': instance.motivation,
    };

_VentorHomeMoodCheckinModel _$VentorHomeMoodCheckinModelFromJson(
  Map<String, dynamic> json,
) => _VentorHomeMoodCheckinModel(
  mood: json['mood'] as String? ?? '',
  note: json['note'] as String?,
);

Map<String, dynamic> _$VentorHomeMoodCheckinModelToJson(
  _VentorHomeMoodCheckinModel instance,
) => <String, dynamic>{'mood': instance.mood, 'note': instance.note};

_VentorHomeStreakModel _$VentorHomeStreakModelFromJson(
  Map<String, dynamic> json,
) => _VentorHomeStreakModel(
  current_days: (json['current_days'] as num?)?.toInt() ?? 0,
  target_days: (json['target_days'] as num?)?.toInt() ?? 7,
  reward_offer_id: json['reward_offer_id'] as String?,
  discount_percent: (json['discount_percent'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VentorHomeStreakModelToJson(
  _VentorHomeStreakModel instance,
) => <String, dynamic>{
  'current_days': instance.current_days,
  'target_days': instance.target_days,
  'reward_offer_id': instance.reward_offer_id,
  'discount_percent': instance.discount_percent,
};

_VentorHomeBookedSessionModel _$VentorHomeBookedSessionModelFromJson(
  Map<String, dynamic> json,
) => _VentorHomeBookedSessionModel(
  id: json['id'] as String? ?? '',
  listener_id: json['listener_id'] as String? ?? '',
  listener_name: json['listener_name'] as String? ?? '',
  listener_avatar_url: json['listener_avatar_url'] as String? ?? '',
  duration_minutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
  status: json['status'] as String? ?? 'upcoming',
  call_mode: json['call_mode'] as String? ?? 'voice',
  speech_language: json['speech_language'] as String? ?? '',
  amount_paid: json['amount_paid'] as num? ?? 0,
  voice_change_enabled: json['voice_change_enabled'] as bool? ?? false,
  scheduled_at: json['scheduled_at'] as String?,
  is_instant: json['is_instant'] as bool? ?? false,
  refunded_to_balance: json['refunded_to_balance'] as num?,
);

Map<String, dynamic> _$VentorHomeBookedSessionModelToJson(
  _VentorHomeBookedSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'listener_id': instance.listener_id,
  'listener_name': instance.listener_name,
  'listener_avatar_url': instance.listener_avatar_url,
  'duration_minutes': instance.duration_minutes,
  'status': instance.status,
  'call_mode': instance.call_mode,
  'speech_language': instance.speech_language,
  'amount_paid': instance.amount_paid,
  'voice_change_enabled': instance.voice_change_enabled,
  'scheduled_at': instance.scheduled_at,
  'is_instant': instance.is_instant,
  'refunded_to_balance': instance.refunded_to_balance,
};

_VentorHomeRecentSessionModel _$VentorHomeRecentSessionModelFromJson(
  Map<String, dynamic> json,
) => _VentorHomeRecentSessionModel(
  id: json['id'] as String? ?? '',
  listener_name: json['listener_name'] as String? ?? '',
  listener_avatar_url: json['listener_avatar_url'] as String? ?? '',
  when_label: json['when_label'] as String? ?? '',
  duration_minutes: (json['duration_minutes'] as num?)?.toInt() ?? 0,
  is_favorite: json['is_favorite'] as bool? ?? false,
);

Map<String, dynamic> _$VentorHomeRecentSessionModelToJson(
  _VentorHomeRecentSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'listener_name': instance.listener_name,
  'listener_avatar_url': instance.listener_avatar_url,
  'when_label': instance.when_label,
  'duration_minutes': instance.duration_minutes,
  'is_favorite': instance.is_favorite,
};
