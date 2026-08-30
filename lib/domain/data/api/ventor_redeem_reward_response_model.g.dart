// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_redeem_reward_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorRedeemRewardResponseModel _$VentorRedeemRewardResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorRedeemRewardResponseModel(
  status: json['status'] as String,
  data: VentorRedeemRewardData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorRedeemRewardResponseModelToJson(
  _VentorRedeemRewardResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorRedeemRewardData _$VentorRedeemRewardDataFromJson(
  Map<String, dynamic> json,
) => _VentorRedeemRewardData(
  points_remaining: (json['points_remaining'] as num?)?.toInt() ?? 0,
  trade: json['trade'] == null
      ? null
      : VentorRewardTradeItemModel.fromJson(
          json['trade'] as Map<String, dynamic>,
        ),
  active_offer_id: json['active_offer_id'] as String?,
);

Map<String, dynamic> _$VentorRedeemRewardDataToJson(
  _VentorRedeemRewardData instance,
) => <String, dynamic>{
  'points_remaining': instance.points_remaining,
  'trade': instance.trade,
  'active_offer_id': instance.active_offer_id,
};
