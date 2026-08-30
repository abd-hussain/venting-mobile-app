// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_language_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogLanguagesResponseModel _$CatalogLanguagesResponseModelFromJson(
  Map<String, dynamic> json,
) => _CatalogLanguagesResponseModel(
  status: json['status'] as String,
  data: CatalogLanguagesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CatalogLanguagesResponseModelToJson(
  _CatalogLanguagesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_CatalogLanguagesData _$CatalogLanguagesDataFromJson(
  Map<String, dynamic> json,
) => _CatalogLanguagesData(
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => CatalogLanguageModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CatalogLanguageModel>[],
);

Map<String, dynamic> _$CatalogLanguagesDataToJson(
  _CatalogLanguagesData instance,
) => <String, dynamic>{'items': instance.items};

_CatalogLanguageModel _$CatalogLanguageModelFromJson(
  Map<String, dynamic> json,
) => _CatalogLanguageModel(
  id: json['id'] as String,
  name_en: json['name_en'] as String,
  name_native: json['name_native'] as String,
  name_ar: json['name_ar'] as String,
  flag_url: json['flag_url'] as String,
  flag_emoji: json['flag_emoji'] as String? ?? '',
  sort_order: (json['sort_order'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CatalogLanguageModelToJson(
  _CatalogLanguageModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name_en': instance.name_en,
  'name_native': instance.name_native,
  'name_ar': instance.name_ar,
  'flag_url': instance.flag_url,
  'flag_emoji': instance.flag_emoji,
  'sort_order': instance.sort_order,
};
