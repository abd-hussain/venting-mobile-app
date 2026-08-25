// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_life_experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogLifeExperiencesResponseModel
_$CatalogLifeExperiencesResponseModelFromJson(Map<String, dynamic> json) =>
    _CatalogLifeExperiencesResponseModel(
      status: json['status'] as String,
      data: CatalogLifeExperiencesData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CatalogLifeExperiencesResponseModelToJson(
  _CatalogLifeExperiencesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_CatalogLifeExperiencesData _$CatalogLifeExperiencesDataFromJson(
  Map<String, dynamic> json,
) => _CatalogLifeExperiencesData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                CatalogLifeExperienceModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <CatalogLifeExperienceModel>[],
);

Map<String, dynamic> _$CatalogLifeExperiencesDataToJson(
  _CatalogLifeExperiencesData instance,
) => <String, dynamic>{'items': instance.items};

_CatalogLifeExperienceModel _$CatalogLifeExperienceModelFromJson(
  Map<String, dynamic> json,
) => _CatalogLifeExperienceModel(
  id: json['id'] as String,
  name_en: json['name_en'] as String,
  name_ar: json['name_ar'] as String,
  sort_order: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CatalogLifeExperienceModelToJson(
  _CatalogLifeExperienceModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name_en': instance.name_en,
  'name_ar': instance.name_ar,
  'sort_order': instance.sort_order,
};
