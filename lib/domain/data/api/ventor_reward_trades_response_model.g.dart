// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_reward_trades_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorRewardTradesResponseModel _$VentorRewardTradesResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorRewardTradesResponseModel(
  status: json['status'] as String,
  data: VentorRewardTradesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorRewardTradesResponseModelToJson(
  _VentorRewardTradesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorRewardTradesData _$VentorRewardTradesDataFromJson(
  Map<String, dynamic> json,
) => _VentorRewardTradesData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                VentorRewardTradeItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <VentorRewardTradeItemModel>[],
);

Map<String, dynamic> _$VentorRewardTradesDataToJson(
  _VentorRewardTradesData instance,
) => <String, dynamic>{'items': instance.items};

_VentorRewardTradeItemModel _$VentorRewardTradeItemModelFromJson(
  Map<String, dynamic> json,
) => _VentorRewardTradeItemModel(
  id: json['id'] as String? ?? '',
  offer_id: json['offer_id'] as String? ?? '',
  points_spent: (json['points_spent'] as num?)?.toInt() ?? 0,
  traded_at: json['traded_at'] as String? ?? '',
  is_welcome_gift: json['is_welcome_gift'] as bool? ?? false,
);

Map<String, dynamic> _$VentorRewardTradeItemModelToJson(
  _VentorRewardTradeItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'offer_id': instance.offer_id,
  'points_spent': instance.points_spent,
  'traded_at': instance.traded_at,
  'is_welcome_gift': instance.is_welcome_gift,
};
