import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_purchase_points_response_model.freezed.dart';
part 'ventor_purchase_points_response_model.g.dart';

@freezed
abstract class VentorPurchasePointsResponseModel
    with _$VentorPurchasePointsResponseModel {
  const factory VentorPurchasePointsResponseModel({
    required String status,
    required VentorPurchasePointsData data,
  }) = _VentorPurchasePointsResponseModel;

  factory VentorPurchasePointsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorPurchasePointsResponseModelFromJson(json);
}

@freezed
abstract class VentorPurchasePointsData with _$VentorPurchasePointsData {
  const factory VentorPurchasePointsData({
    @Default(0) int points,
    VentorPointPurchaseItemModel? purchase,
  }) = _VentorPurchasePointsData;

  factory VentorPurchasePointsData.fromJson(Map<String, dynamic> json) =>
      _$VentorPurchasePointsDataFromJson(json);
}

@freezed
abstract class VentorPointPurchaseItemModel
    with _$VentorPointPurchaseItemModel {
  const factory VentorPointPurchaseItemModel({
    @Default('') String id,
    @Default('') String package_id,
    @Default(0) int points_added,
    @Default(0) double price_usd,
    @Default('') String purchased_at,
  }) = _VentorPointPurchaseItemModel;

  factory VentorPointPurchaseItemModel.fromJson(Map<String, dynamic> json) =>
      _$VentorPointPurchaseItemModelFromJson(json);
}
