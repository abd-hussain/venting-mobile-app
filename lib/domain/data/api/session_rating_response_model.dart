import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_rating_response_model.freezed.dart';
part 'session_rating_response_model.g.dart';

@freezed
abstract class SessionRatingResponseModel with _$SessionRatingResponseModel {
  const factory SessionRatingResponseModel({
    required String status,
    required SessionRatingData data,
  }) = _SessionRatingResponseModel;

  factory SessionRatingResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionRatingResponseModelFromJson(json);
}

@freezed
abstract class SessionRatingData with _$SessionRatingData {
  const factory SessionRatingData({@Default(true) bool ok, num? tip_charged}) =
      _SessionRatingData;

  factory SessionRatingData.fromJson(Map<String, dynamic> json) =>
      _$SessionRatingDataFromJson(json);
}
