// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_find_listeners_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorFindListenersResponseModel _$VentorFindListenersResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorFindListenersResponseModel(
  status: json['status'] as String,
  data: VentorFindListenersData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorFindListenersResponseModelToJson(
  _VentorFindListenersResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorFindListenersData _$VentorFindListenersDataFromJson(
  Map<String, dynamic> json,
) => _VentorFindListenersData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) => VentorFindListenerModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <VentorFindListenerModel>[],
  total: (json['total'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VentorFindListenersDataToJson(
  _VentorFindListenersData instance,
) => <String, dynamic>{'items': instance.items, 'total': instance.total};

_VentorFindListenerResponseModel _$VentorFindListenerResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorFindListenerResponseModel(
  status: json['status'] as String,
  data: VentorFindListenerModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorFindListenerResponseModelToJson(
  _VentorFindListenerResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorFindListenerModel _$VentorFindListenerModelFromJson(
  Map<String, dynamic> json,
) => _VentorFindListenerModel(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  avatar_url: json['avatar_url'] as String? ?? '',
  rating: (json['rating'] as num?)?.toDouble() ?? 0,
  review_count: (json['review_count'] as num?)?.toInt() ?? 0,
  session_count: (json['session_count'] as num?)?.toInt() ?? 0,
  topics:
      (json['topics'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  languages:
      (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  gender: json['gender'] as String? ?? '',
  rate_per_minute: (json['rate_per_minute'] as num?)?.toDouble() ?? 0,
  bio: json['bio'] as String? ?? '',
  help_with:
      (json['help_with'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  voice_preview_seconds: (json['voice_preview_seconds'] as num?)?.toInt() ?? 0,
  voice_intro_url: json['voice_intro_url'] as String? ?? '',
  is_online: json['is_online'] as bool? ?? false,
  is_verified: json['is_verified'] as bool? ?? false,
  rating_breakdown: json['rating_breakdown'] as Map<String, dynamic>?,
  country: json['country'] as String? ?? '',
  city: json['city'] as String? ?? '',
  country_iso: json['country_iso'] as String? ?? '',
  life_experiences: json['life_experiences'],
  boundaries: json['boundaries'],
  availability: json['availability'] == null
      ? null
      : VentorFindListenerAvailabilityModel.fromJson(
          json['availability'] as Map<String, dynamic>,
        ),
  is_favorite: json['is_favorite'] as bool? ?? false,
);

Map<String, dynamic> _$VentorFindListenerModelToJson(
  _VentorFindListenerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'avatar_url': instance.avatar_url,
  'rating': instance.rating,
  'review_count': instance.review_count,
  'session_count': instance.session_count,
  'topics': instance.topics,
  'languages': instance.languages,
  'gender': instance.gender,
  'rate_per_minute': instance.rate_per_minute,
  'bio': instance.bio,
  'help_with': instance.help_with,
  'voice_preview_seconds': instance.voice_preview_seconds,
  'voice_intro_url': instance.voice_intro_url,
  'is_online': instance.is_online,
  'is_verified': instance.is_verified,
  'rating_breakdown': instance.rating_breakdown,
  'country': instance.country,
  'city': instance.city,
  'country_iso': instance.country_iso,
  'life_experiences': instance.life_experiences,
  'boundaries': instance.boundaries,
  'availability': instance.availability,
  'is_favorite': instance.is_favorite,
};

_VentorFindListenerAvailabilityModel
_$VentorFindListenerAvailabilityModelFromJson(Map<String, dynamic> json) =>
    _VentorFindListenerAvailabilityModel(
      days:
          (json['days'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      from_hour: json['from_hour'] as String? ?? '',
      to_hour: json['to_hour'] as String? ?? '',
      time_zone_id: json['time_zone_id'] as String? ?? '',
      accept_instant_call: json['accept_instant_call'] as bool? ?? false,
      session_minutes:
          (json['session_minutes'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const <int>[],
    );

Map<String, dynamic> _$VentorFindListenerAvailabilityModelToJson(
  _VentorFindListenerAvailabilityModel instance,
) => <String, dynamic>{
  'days': instance.days,
  'from_hour': instance.from_hour,
  'to_hour': instance.to_hour,
  'time_zone_id': instance.time_zone_id,
  'accept_instant_call': instance.accept_instant_call,
  'session_minutes': instance.session_minutes,
};
