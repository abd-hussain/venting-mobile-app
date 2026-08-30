// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_rewards_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorRewardsResponseModel _$VentorRewardsResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorRewardsResponseModel(
  status: json['status'] as String,
  data: VentorRewardsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorRewardsResponseModelToJson(
  _VentorRewardsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorRewardsData _$VentorRewardsDataFromJson(Map<String, dynamic> json) =>
    _VentorRewardsData(
      points: (json['points'] as num?)?.toInt() ?? 0,
      completed_sessions: (json['completed_sessions'] as num?)?.toInt() ?? 0,
      active_offer_id: json['active_offer_id'] as String?,
      welcome_gift_claimed: json['welcome_gift_claimed'] as bool? ?? false,
      offers:
          (json['offers'] as List<dynamic>?)
              ?.map(
                (e) => VentorRewardOfferItemModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <VentorRewardOfferItemModel>[],
      earn_rules: json['earn_rules'] == null
          ? null
          : VentorRewardEarnRulesModel.fromJson(
              json['earn_rules'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VentorRewardsDataToJson(_VentorRewardsData instance) =>
    <String, dynamic>{
      'points': instance.points,
      'completed_sessions': instance.completed_sessions,
      'active_offer_id': instance.active_offer_id,
      'welcome_gift_claimed': instance.welcome_gift_claimed,
      'offers': instance.offers,
      'earn_rules': instance.earn_rules,
    };

_VentorRewardOfferItemModel _$VentorRewardOfferItemModelFromJson(
  Map<String, dynamic> json,
) => _VentorRewardOfferItemModel(
  id: json['id'] as String? ?? '',
  kind: json['kind'] as String? ?? '',
  points_cost: (json['points_cost'] as num?)?.toInt() ?? 0,
  percent_off: (json['percent_off'] as num?)?.toInt(),
  free_minutes: (json['free_minutes'] as num?)?.toInt(),
  audience: json['audience'] == null
      ? null
      : VentorRewardAudienceModel.fromJson(
          json['audience'] as Map<String, dynamic>,
        ),
  is_welcome_gift: json['is_welcome_gift'] as bool? ?? false,
);

Map<String, dynamic> _$VentorRewardOfferItemModelToJson(
  _VentorRewardOfferItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'kind': instance.kind,
  'points_cost': instance.points_cost,
  'percent_off': instance.percent_off,
  'free_minutes': instance.free_minutes,
  'audience': instance.audience,
  'is_welcome_gift': instance.is_welcome_gift,
};

_VentorRewardAudienceModel _$VentorRewardAudienceModelFromJson(
  Map<String, dynamic> json,
) => _VentorRewardAudienceModel(
  min_tier: json['min_tier'] as String?,
  max_tier: json['max_tier'] as String?,
);

Map<String, dynamic> _$VentorRewardAudienceModelToJson(
  _VentorRewardAudienceModel instance,
) => <String, dynamic>{
  'min_tier': instance.min_tier,
  'max_tier': instance.max_tier,
};

_VentorRewardEarnRulesModel _$VentorRewardEarnRulesModelFromJson(
  Map<String, dynamic> json,
) => _VentorRewardEarnRulesModel(
  points_per_session: (json['points_per_session'] as num?)?.toInt() ?? 0,
  points_per_friend_register:
      (json['points_per_friend_register'] as num?)?.toInt() ?? 0,
  points_per_invite_first_session:
      (json['points_per_invite_first_session'] as num?)?.toInt() ?? 0,
  points_per_friend_booking:
      (json['points_per_friend_booking'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VentorRewardEarnRulesModelToJson(
  _VentorRewardEarnRulesModel instance,
) => <String, dynamic>{
  'points_per_session': instance.points_per_session,
  'points_per_friend_register': instance.points_per_friend_register,
  'points_per_invite_first_session': instance.points_per_invite_first_session,
  'points_per_friend_booking': instance.points_per_friend_booking,
};
