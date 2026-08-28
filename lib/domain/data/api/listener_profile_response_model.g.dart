// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerProfileResponseModel _$ListenerProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerProfileResponseModel(
  status: json['status'] as String,
  data: ListenerProfileData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerProfileResponseModelToJson(
  _ListenerProfileResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerProfileData _$ListenerProfileDataFromJson(Map<String, dynamic> json) =>
    _ListenerProfileData(
      id: json['id'] as String? ?? '',
      full_name: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      phone_country: json['phone_country'] as String? ?? '',
      avatar_url: json['avatar_url'] as String?,
      about_me: json['about_me'] as String?,
      country: json['country'] as String?,
      country_iso: json['country_iso'] as String? ?? '',
      city: json['city'] as String? ?? '',
      language_ids:
          (json['language_ids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      life_experiences: json['life_experiences'],
      comfort_areas: json['comfort_areas'],
      boundaries: json['boundaries'],
      voice_intro_url: json['voice_intro_url'] as String?,
      voice_intro_seconds: (json['voice_intro_seconds'] as num?)?.toInt() ?? 0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      review_count: (json['review_count'] as num?)?.toInt() ?? 0,
      session_count: (json['session_count'] as num?)?.toInt() ?? 0,
      is_online: json['is_online'] as bool? ?? false,
      profile_status: json['profile_status'] as String? ?? '',
      rate_per_minute: (json['rate_per_minute'] as num?)?.toDouble() ?? 0.0,
      date_of_birth: json['date_of_birth'] as String?,
      rating_breakdown: json['rating_breakdown'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$ListenerProfileDataToJson(
  _ListenerProfileData instance,
) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.full_name,
  'email': instance.email,
  'phone': instance.phone,
  'phone_country': instance.phone_country,
  'avatar_url': instance.avatar_url,
  'about_me': instance.about_me,
  'country': instance.country,
  'country_iso': instance.country_iso,
  'city': instance.city,
  'language_ids': instance.language_ids,
  'life_experiences': instance.life_experiences,
  'comfort_areas': instance.comfort_areas,
  'boundaries': instance.boundaries,
  'voice_intro_url': instance.voice_intro_url,
  'voice_intro_seconds': instance.voice_intro_seconds,
  'rating': instance.rating,
  'review_count': instance.review_count,
  'session_count': instance.session_count,
  'is_online': instance.is_online,
  'profile_status': instance.profile_status,
  'rate_per_minute': instance.rate_per_minute,
  'date_of_birth': instance.date_of_birth,
  'rating_breakdown': instance.rating_breakdown,
};
