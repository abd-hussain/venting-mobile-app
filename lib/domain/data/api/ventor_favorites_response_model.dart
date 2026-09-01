import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_favorites_response_model.freezed.dart';
part 'ventor_favorites_response_model.g.dart';

@freezed
abstract class VentorFavoritesResponseModel
    with _$VentorFavoritesResponseModel {
  const factory VentorFavoritesResponseModel({
    required String status,
    required VentorFavoritesData data,
  }) = _VentorFavoritesResponseModel;

  factory VentorFavoritesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorFavoritesResponseModelFromJson(json);
}

@freezed
abstract class VentorFavoritesData with _$VentorFavoritesData {
  const factory VentorFavoritesData({
    @Default(<VentorFavoriteListenerModel>[])
    List<VentorFavoriteListenerModel> items,
  }) = _VentorFavoritesData;

  factory VentorFavoritesData.fromJson(Map<String, dynamic> json) =>
      _$VentorFavoritesDataFromJson(json);
}

@freezed
abstract class VentorFavoriteListenerModel with _$VentorFavoriteListenerModel {
  const factory VentorFavoriteListenerModel({
    @Default('') String id,
    @Default('') String name,
    @Default(0) num rating,
    String? avatar_url,
  }) = _VentorFavoriteListenerModel;

  factory VentorFavoriteListenerModel.fromJson(Map<String, dynamic> json) =>
      _$VentorFavoriteListenerModelFromJson(json);
}
