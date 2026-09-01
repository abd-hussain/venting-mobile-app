// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_point_packages_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorPointPackagesResponseModel _$VentorPointPackagesResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorPointPackagesResponseModel(
  status: json['status'] as String,
  data: VentorPointPackagesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorPointPackagesResponseModelToJson(
  _VentorPointPackagesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorPointPackagesData _$VentorPointPackagesDataFromJson(
  Map<String, dynamic> json,
) => _VentorPointPackagesData(
  packages:
      (json['packages'] as List<dynamic>?)
          ?.map(
            (e) =>
                VentorPointPackageItemModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <VentorPointPackageItemModel>[],
);

Map<String, dynamic> _$VentorPointPackagesDataToJson(
  _VentorPointPackagesData instance,
) => <String, dynamic>{'packages': instance.packages};

_VentorPointPackageItemModel _$VentorPointPackageItemModelFromJson(
  Map<String, dynamic> json,
) => _VentorPointPackageItemModel(
  id: json['id'] as String? ?? '',
  points: (json['points'] as num?)?.toInt() ?? 0,
  price_usd: (json['price_usd'] as num?)?.toDouble() ?? 0,
  bonus_percent: (json['bonus_percent'] as num?)?.toInt(),
  sort_order: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VentorPointPackageItemModelToJson(
  _VentorPointPackageItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'points': instance.points,
  'price_usd': instance.price_usd,
  'bonus_percent': instance.bonus_percent,
  'sort_order': instance.sort_order,
};
