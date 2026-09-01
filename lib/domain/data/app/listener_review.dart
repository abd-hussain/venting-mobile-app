class ListenerReview {
  const ListenerReview({
    required this.id,
    required this.reviewerName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  final String id;
  final String reviewerName;
  final int rating;
  final String comment;
  final DateTime createdAt;
}
