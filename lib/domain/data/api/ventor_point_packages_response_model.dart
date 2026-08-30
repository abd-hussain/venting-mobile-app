import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_point_packages_response_model.freezed.dart';
part 'ventor_point_packages_response_model.g.dart';

@freezed
abstract class VentorPointPackagesResponseModel
    with _$VentorPointPackagesResponseModel {
  const factory VentorPointPackagesResponseModel({
    required String status,
    required VentorPointPackagesData data,
  }) = _VentorPointPackagesResponseModel;

  factory VentorPointPackagesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorPointPackagesResponseModelFromJson(json);
}

@freezed
abstract class VentorPointPackagesData with _$VentorPointPackagesData {
  const factory VentorPointPackagesData({
    @Default(<VentorPointPackageItemModel>[])
    List<VentorPointPackageItemModel> packages,
  }) = _VentorPointPackagesData;

  factory VentorPointPackagesData.fromJson(Map<String, dynamic> json) =>
      _$VentorPointPackagesDataFromJson(json);
}

@freezed
abstract class VentorPointPackageItemModel with _$VentorPointPackageItemModel {
  const factory VentorPointPackageItemModel({
    @Default('') String id,
    @Default(0) int points,
    @Default(0) double price_usd,
    int? bonus_percent,
    @Default(0) int sort_order,
  }) = _VentorPointPackageItemModel;

  factory VentorPointPackageItemModel.fromJson(Map<String, dynamic> json) =>
      _$VentorPointPackageItemModelFromJson(json);
}
