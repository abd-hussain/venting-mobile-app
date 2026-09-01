// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_purchase_points_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorPurchasePointsResponseModel _$VentorPurchasePointsResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorPurchasePointsResponseModel(
  status: json['status'] as String,
  data: VentorPurchasePointsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorPurchasePointsResponseModelToJson(
  _VentorPurchasePointsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorPurchasePointsData _$VentorPurchasePointsDataFromJson(
  Map<String, dynamic> json,
) => _VentorPurchasePointsData(
  points: (json['points'] as num?)?.toInt() ?? 0,
  purchase: json['purchase'] == null
      ? null
      : VentorPointPurchaseItemModel.fromJson(
          json['purchase'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$VentorPurchasePointsDataToJson(
  _VentorPurchasePointsData instance,
) => <String, dynamic>{
  'points': instance.points,
  'purchase': instance.purchase,
};

_VentorPointPurchaseItemModel _$VentorPointPurchaseItemModelFromJson(
  Map<String, dynamic> json,
) => _VentorPointPurchaseItemModel(
  id: json['id'] as String? ?? '',
  package_id: json['package_id'] as String? ?? '',
  points_added: (json['points_added'] as num?)?.toInt() ?? 0,
  price_usd: (json['price_usd'] as num?)?.toDouble() ?? 0,
  purchased_at: json['purchased_at'] as String? ?? '',
);

Map<String, dynamic> _$VentorPointPurchaseItemModelToJson(
  _VentorPointPurchaseItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'package_id': instance.package_id,
  'points_added': instance.points_added,
  'price_usd': instance.price_usd,
  'purchased_at': instance.purchased_at,
};
