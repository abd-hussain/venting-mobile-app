import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/listener_reviews_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_review.dart';
import 'package:venting_mobile_app/domain/data/app/listener_reviews_result.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class GetListenerReviewsUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerReviewsUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerReviewsResult> call({
    int page = 1,
    int pageSize = 50,
  }) {
    final accessToken = ventingPreferences
        .getValue(SavedConstants.accessToken, '')
        .trim();

    if (accessToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Missing access token',
        ),
      );
    }

    return listenerProfileRepository
        .getReviews(page: page, pageSize: pageSize)
        .map((response) => _mapReviewsResult(response.data));
  }
}

ListenerReviewsResult _mapReviewsResult(ListenerReviewsData data) {
  final reviews = data.items
      .map(
        (item) => ListenerReview(
          id: item.id,
          reviewerName: item.reviewer_name,
          rating: item.rating,
          comment: item.comment,
          createdAt:
              DateTime.tryParse(item.created_at) ??
              DateTime.fromMillisecondsSinceEpoch(0),
        ),
      )
      .toList(growable: false);

  return ListenerReviewsResult(
    rating: data.rating,
    reviewCount: data.review_count,
    reviews: reviews,
  );
}
