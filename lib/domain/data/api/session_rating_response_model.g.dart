// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_rating_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionRatingResponseModel _$SessionRatingResponseModelFromJson(
  Map<String, dynamic> json,
) => _SessionRatingResponseModel(
  status: json['status'] as String,
  data: SessionRatingData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SessionRatingResponseModelToJson(
  _SessionRatingResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_SessionRatingData _$SessionRatingDataFromJson(Map<String, dynamic> json) =>
    _SessionRatingData(
      ok: json['ok'] as bool? ?? true,
      tip_charged: json['tip_charged'] as num?,
    );

Map<String, dynamic> _$SessionRatingDataToJson(_SessionRatingData instance) =>
    <String, dynamic>{'ok': instance.ok, 'tip_charged': instance.tip_charged};
