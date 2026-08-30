import 'package:venting_mobile_app/domain/data/app/listener_review.dart';

class ListenerReviewsResult {
  const ListenerReviewsResult({
    required this.rating,
    required this.reviewCount,
    required this.reviews,
  });

  final double rating;
  final int reviewCount;
  final List<ListenerReview> reviews;
}
