import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_life_experience_model.freezed.dart';
part 'catalog_life_experience_model.g.dart';

@freezed
abstract class CatalogLifeExperiencesResponseModel
    with _$CatalogLifeExperiencesResponseModel {
  const factory CatalogLifeExperiencesResponseModel({
    required String status,
    required CatalogLifeExperiencesData data,
  }) = _CatalogLifeExperiencesResponseModel;

  factory CatalogLifeExperiencesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$CatalogLifeExperiencesResponseModelFromJson(json);
}

@freezed
abstract class CatalogLifeExperiencesData with _$CatalogLifeExperiencesData {
  const factory CatalogLifeExperiencesData({
    @Default(<CatalogLifeExperienceModel>[])
    List<CatalogLifeExperienceModel> items,
  }) = _CatalogLifeExperiencesData;

  factory CatalogLifeExperiencesData.fromJson(Map<String, dynamic> json) =>
      _$CatalogLifeExperiencesDataFromJson(json);
}

@freezed
abstract class CatalogLifeExperienceModel with _$CatalogLifeExperienceModel {
  const factory CatalogLifeExperienceModel({
    required String id,
    required String name_en,
    required String name_ar,
    @Default(0) int sort_order,
  }) = _CatalogLifeExperienceModel;

  factory CatalogLifeExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogLifeExperienceModelFromJson(json);
}
