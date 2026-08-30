// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_favorites_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorFavoritesResponseModel _$VentorFavoritesResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorFavoritesResponseModel(
  status: json['status'] as String,
  data: VentorFavoritesData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorFavoritesResponseModelToJson(
  _VentorFavoritesResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorFavoritesData _$VentorFavoritesDataFromJson(Map<String, dynamic> json) =>
    _VentorFavoritesData(
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => VentorFavoriteListenerModel.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <VentorFavoriteListenerModel>[],
    );

Map<String, dynamic> _$VentorFavoritesDataToJson(
  _VentorFavoritesData instance,
) => <String, dynamic>{'items': instance.items};

_VentorFavoriteListenerModel _$VentorFavoriteListenerModelFromJson(
  Map<String, dynamic> json,
) => _VentorFavoriteListenerModel(
  id: json['id'] as String? ?? '',
  name: json['name'] as String? ?? '',
  rating: json['rating'] as num? ?? 0,
  avatar_url: json['avatar_url'] as String?,
);

Map<String, dynamic> _$VentorFavoriteListenerModelToJson(
  _VentorFavoriteListenerModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'rating': instance.rating,
  'avatar_url': instance.avatar_url,
};
