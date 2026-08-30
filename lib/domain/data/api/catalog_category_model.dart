import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_category_model.freezed.dart';
part 'catalog_category_model.g.dart';

@freezed
abstract class CatalogCategoriesResponseModel
    with _$CatalogCategoriesResponseModel {
  const factory CatalogCategoriesResponseModel({
    required String status,
    required CatalogCategoriesData data,
  }) = _CatalogCategoriesResponseModel;

  factory CatalogCategoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogCategoriesResponseModelFromJson(json);
}

@freezed
abstract class CatalogCategoriesData with _$CatalogCategoriesData {
  const factory CatalogCategoriesData({
    @Default(<CatalogCategoryModel>[]) List<CatalogCategoryModel> items,
  }) = _CatalogCategoriesData;

  factory CatalogCategoriesData.fromJson(Map<String, dynamic> json) =>
      _$CatalogCategoriesDataFromJson(json);
}

@freezed
abstract class CatalogCategoryModel with _$CatalogCategoryModel {
  const factory CatalogCategoryModel({
    required String id,
    required String name_en,
    required String name_ar,
    @Default('') String icon_emoji,
    @Default('') String icon_url,
    @Default(0) int sort_order,
    @Default(false) bool allows_custom_text,
    String? topic_group,
  }) = _CatalogCategoryModel;

  factory CatalogCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogCategoryModelFromJson(json);
}
