import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// A single review left on a listener profile.
class ListenerProfileReview {
  const ListenerProfileReview({
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

/// Shows a dark sheet listing all reviews for this listener profile.
Future<void> showListenerProfileReviewsBottomSheet({
  required BuildContext context,
  required double rating,
  required int reviewCount,
  required List<ListenerProfileReview> reviews,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => ListenerProfileReviewsBottomSheet(
      rating: rating,
      reviewCount: reviewCount,
      reviews: reviews,
    ),
  );
}

class ListenerProfileReviewsBottomSheet extends StatelessWidget {
  const ListenerProfileReviewsBottomSheet({
    super.key,
    required this.rating,
    required this.reviewCount,
    required this.reviews,
  });

  final double rating;
  final int reviewCount;
  final List<ListenerProfileReview> reviews;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.82,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 8, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.listener_profile_all_reviews_title,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.listener_profile_all_reviews_subtitle(
                            rating.toStringAsFixed(1),
                            reviewCount,
                          ),
                          style: GoogleFonts.inter(
                            color: ListenerProfileTheme.muted,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: Row(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          final filled = index < rating.round().clamp(0, 5);
                          return Icon(
                            Icons.star_rounded,
                            size: 18,
                            color: filled
                                ? ListenerProfileTheme.gold
                                : ListenerProfileTheme.muted.withValues(
                                    alpha: 0.35,
                                  ),
                          );
                        }),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.listener_profile_reviews_count(reviewCount),
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
            Expanded(
              child: reviews.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Text(
                          l10n.listener_profile_all_reviews_empty,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: ListenerProfileTheme.muted,
                            fontSize: 14,
                            height: 1.4,
                          ),
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        20,
                        12,
                        20,
                        16 + bottomInset,
                      ),
                      itemCount: reviews.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        return _ReviewCard(review: reviews[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final ListenerProfileReview review;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final initial = review.reviewerName.isNotEmpty
        ? review.reviewerName.characters.first.toUpperCase()
        : '?';

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF14101C),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      SplashColors.purpleMid.withValues(alpha: 0.85),
                      SplashColors.purpleMid.withValues(alpha: 0.45),
                    ],
                  ),
                ),
                child: Text(
                  initial,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.reviewerName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _relativeDateLabel(l10n, review.createdAt),
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  final filled = index < review.rating.clamp(0, 5);
                  return Icon(
                    Icons.star_rounded,
                    size: 14,
                    color: filled
                        ? ListenerProfileTheme.gold
                        : ListenerProfileTheme.muted.withValues(alpha: 0.3),
                  );
                }),
              ),
            ],
          ),
          if (review.comment.trim().isNotEmpty) ...[
            const SizedBox(height: 10),
            Text(
              review.comment,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.88),
                fontSize: 13,
                height: 1.45,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _relativeDateLabel(VentingMobLocalizations l10n, DateTime date) {
    final now = DateTime.now();
    final local = date.toLocal();
    final days = DateTime(
      now.year,
      now.month,
      now.day,
    ).difference(DateTime(local.year, local.month, local.day)).inDays;

    if (days <= 0) return l10n.listener_profile_review_today;
    if (days == 1) return l10n.listener_profile_review_yesterday;
    if (days < 7) return l10n.listener_profile_review_days_ago(days);
    if (days < 30) {
      final weeks = (days / 7).floor();
      return l10n.listener_profile_review_weeks_ago(weeks);
    }
    if (days < 365) {
      final months = (days / 30).floor().clamp(1, 11);
      return l10n.listener_profile_review_months_ago(months);
    }
    final years = (days / 365).floor().clamp(1, 99);
    return l10n.listener_profile_review_years_ago(years);
  }
}
