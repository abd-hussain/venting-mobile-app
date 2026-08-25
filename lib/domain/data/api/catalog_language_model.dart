import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_language_model.freezed.dart';
part 'catalog_language_model.g.dart';

@freezed
abstract class CatalogLanguagesResponseModel
    with _$CatalogLanguagesResponseModel {
  const factory CatalogLanguagesResponseModel({
    required String status,
    required CatalogLanguagesData data,
  }) = _CatalogLanguagesResponseModel;

  factory CatalogLanguagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogLanguagesResponseModelFromJson(json);
}

@freezed
abstract class CatalogLanguagesData with _$CatalogLanguagesData {
  const factory CatalogLanguagesData({
    @Default(<CatalogLanguageModel>[]) List<CatalogLanguageModel> items,
  }) = _CatalogLanguagesData;

  factory CatalogLanguagesData.fromJson(Map<String, dynamic> json) =>
      _$CatalogLanguagesDataFromJson(json);
}

@freezed
abstract class CatalogLanguageModel with _$CatalogLanguageModel {
  const factory CatalogLanguageModel({
    required String id,
    required String name_en,
    required String name_native,
    required String name_ar,
    required String flag_url,
    @Default('') String flag_emoji,
    @Default(0) int sort_order,
  }) = _CatalogLanguageModel;

  factory CatalogLanguageModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogLanguageModelFromJson(json);
}
