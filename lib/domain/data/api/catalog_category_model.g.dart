// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogCategoriesResponseModel _$CatalogCategoriesResponseModelFromJson(
  Map<String, dynamic> json,
) => _CatalogCategoriesResponseModel(
  status: json['status'] as String,
  data: CatalogCategoriesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CatalogCategoriesResponseModelToJson(
  _CatalogCategoriesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_CatalogCategoriesData _$CatalogCategoriesDataFromJson(
  Map<String, dynamic> json,
) => _CatalogCategoriesData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CatalogCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CatalogCategoryModel>[],
);

Map<String, dynamic> _$CatalogCategoriesDataToJson(
  _CatalogCategoriesData instance,
) => <String, dynamic>{'items': instance.items};

_CatalogCategoryModel _$CatalogCategoryModelFromJson(
  Map<String, dynamic> json,
) => _CatalogCategoryModel(
  id: json['id'] as String,
  name_en: json['name_en'] as String,
  name_ar: json['name_ar'] as String,
  icon_emoji: json['icon_emoji'] as String? ?? '',
  icon_url: json['icon_url'] as String? ?? '',
  sort_order: (json['sort_order'] as num?)?.toInt() ?? 0,
  allows_custom_text: json['allows_custom_text'] as bool? ?? false,
  topic_group: json['topic_group'] as String?,
);

Map<String, dynamic> _$CatalogCategoryModelToJson(
  _CatalogCategoryModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name_en': instance.name_en,
  'name_ar': instance.name_ar,
  'icon_emoji': instance.icon_emoji,
  'icon_url': instance.icon_url,
  'sort_order': instance.sort_order,
  'allows_custom_text': instance.allows_custom_text,
  'topic_group': instance.topic_group,
};
