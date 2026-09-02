import 'package:fpdart/fpdart.dart';
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
}
