import 'package:freezed_annotation/freezed_annotation.dart';

part 'listener_reviews_response_model.freezed.dart';
part 'listener_reviews_response_model.g.dart';

@freezed
abstract class ListenerReviewsResponseModel
    with _$ListenerReviewsResponseModel {
  const factory ListenerReviewsResponseModel({
    required String status,
    required ListenerReviewsData data,
  }) = _ListenerReviewsResponseModel;

  factory ListenerReviewsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerReviewsResponseModelFromJson(json);
}

@freezed
abstract class ListenerReviewsData with _$ListenerReviewsData {
  const factory ListenerReviewsData({
    @Default(0.0) double rating,
    @Default(0) int review_count,
    @Default(<ListenerReviewItem>[]) List<ListenerReviewItem> items,
  }) = _ListenerReviewsData;

  factory ListenerReviewsData.fromJson(Map<String, dynamic> json) =>
      _$ListenerReviewsDataFromJson(json);
}

@freezed
abstract class ListenerReviewItem with _$ListenerReviewItem {
  const factory ListenerReviewItem({
    @Default('') String id,
    @Default('') String reviewer_name,
    @Default(0) int rating,
    @Default('') String comment,
    @Default('') String created_at,
  }) = _ListenerReviewItem;

  factory ListenerReviewItem.fromJson(Map<String, dynamic> json) =>
      _$ListenerReviewItemFromJson(json);
}
