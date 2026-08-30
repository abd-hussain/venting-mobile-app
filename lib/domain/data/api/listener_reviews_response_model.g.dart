// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_reviews_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerReviewsResponseModel _$ListenerReviewsResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerReviewsResponseModel(
  status: json['status'] as String,
  data: ListenerReviewsData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerReviewsResponseModelToJson(
  _ListenerReviewsResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerReviewsData _$ListenerReviewsDataFromJson(Map<String, dynamic> json) =>
    _ListenerReviewsData(
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      review_count: (json['review_count'] as num?)?.toInt() ?? 0,
      items:
          (json['items'] as List<dynamic>?)
              ?.map(
                (e) => ListenerReviewItem.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <ListenerReviewItem>[],
    );

Map<String, dynamic> _$ListenerReviewsDataToJson(
  _ListenerReviewsData instance,
) => <String, dynamic>{
  'rating': instance.rating,
  'review_count': instance.review_count,
  'items': instance.items,
};

_ListenerReviewItem _$ListenerReviewItemFromJson(Map<String, dynamic> json) =>
    _ListenerReviewItem(
      id: json['id'] as String? ?? '',
      reviewer_name: json['reviewer_name'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      comment: json['comment'] as String? ?? '',
      created_at: json['created_at'] as String? ?? '',
    );

Map<String, dynamic> _$ListenerReviewItemToJson(_ListenerReviewItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reviewer_name': instance.reviewer_name,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.created_at,
    };
