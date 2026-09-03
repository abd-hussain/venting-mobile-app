import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/session_rating_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_sessions_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class VentorSessionsRepository extends BaseRepository {
  const VentorSessionsRepository(super.apiClient);

  TaskEither<Exception, VentorSessionsListResponseModel> getSessions({
    String? status,
    int page = 1,
  }) {
    final queryParams = <String, Object?>{
      'page': page,
      if (status != null && status.trim().isNotEmpty) 'status': status.trim(),
    };

    return executeRequest(
      request: apiClient.get<Object?>(
        'v1/ventors/me/sessions',
        queryParams: queryParams,
      ),
      fromJson: VentorSessionsListResponseModel.fromJson,
    );
  }

  TaskEither<Exception, VentorBookedSessionDetailResponseModel> getSession({
    required String sessionId,
  }) => executeRequest(
    request: apiClient.get<Object?>('v1/ventors/me/sessions/$sessionId'),
    fromJson: VentorBookedSessionDetailResponseModel.fromJson,
  );

  TaskEither<Exception, VentorCancelSessionResponseModel> cancelSession({
    required String sessionId,
    String? reason,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/ventors/me/sessions/$sessionId/cancel',
      data: {
        if (reason != null && reason.trim().isNotEmpty) 'reason': reason.trim(),
      },
    ),
    fromJson: VentorCancelSessionResponseModel.fromJson,
  );

  TaskEither<Exception, SessionRatingResponseModel> submitSessionRating({
    required String sessionId,
    required int stars,
    String? review,
    int? tipAmount,
    String? reportReason,
    String? reportDetails,
  }) {
    final trimmedReview = review?.trim();
    final data = <String, dynamic>{
      'stars': stars,
      if (trimmedReview != null && trimmedReview.isNotEmpty)
        'review': trimmedReview,
      if (tipAmount != null) 'tip_amount': tipAmount,
      if (reportReason != null && reportReason.trim().isNotEmpty)
        'report': {
          'reason': reportReason.trim(),
          if (reportDetails != null && reportDetails.trim().isNotEmpty)
            'details': reportDetails.trim(),
        },
    };

    return executeRequest(
      request: apiClient.post<Object?>(
        'v1/sessions/$sessionId/rating',
        data: data,
      ),
      fromJson: SessionRatingResponseModel.fromJson,
    );
  }

  TaskEither<Exception, void> submitSessionReport({
    required String sessionId,
    required String reason,
    required String reportedRole,
    String? details,
  }) => executeVoidRequest(
    request: apiClient.post<Object?>(
      'v1/sessions/$sessionId/reports',
      data: {
        'reason': reason,
        'reported_role': reportedRole,
        if (details != null && details.trim().isNotEmpty)
          'details': details.trim(),
      },
    ),
  );
}
