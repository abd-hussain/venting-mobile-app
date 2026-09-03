import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/session_rating_result.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_sessions_repository.dart';

class SubmitVentorSessionRatingUsecase {
  final VentorSessionsRepository ventorSessionsRepository;
  final VentingPreferences ventingPreferences;

  const SubmitVentorSessionRatingUsecase(
    this.ventorSessionsRepository,
    this.ventingPreferences,
  );

  static const _allowedTips = {2, 5, 10};

  TaskEither<Exception, SessionRatingResult> call({
    required String sessionId,
    required int stars,
    String? review,
    int? tipAmount,
    String? reportReason,
    String? reportDetails,
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

    final trimmedId = sessionId.trim();
    if (trimmedId.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Missing session id',
        ),
      );
    }

    final clampedStars = stars.clamp(1, 5);
    final tip = tipAmount;
    if (tip != null && !_allowedTips.contains(tip)) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'tip_amount must be 2, 5, or 10',
        ),
      );
    }

    final trimmedReason = reportReason?.trim();
    final includeReport = trimmedReason != null && trimmedReason.isNotEmpty;

    return ventorSessionsRepository
        .submitSessionRating(
          sessionId: trimmedId,
          stars: clampedStars,
          review: review,
          tipAmount: tip,
          reportReason: includeReport ? trimmedReason : null,
          reportDetails: includeReport ? reportDetails : null,
        )
        .map(
          (response) => SessionRatingResult(
            ok: response.data.ok,
            tipCharged: response.data.tip_charged?.toDouble(),
          ),
        );
  }
}
