import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_sessions_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerSessionsRepository extends BaseRepository {
  const ListenerSessionsRepository(super.apiClient);

  TaskEither<Exception, ListenerSessionsListResponseModel> getSessions({
    required String filter,
  }) => executeRequest(
    request: apiClient.get<Object?>(
      'v1/listeners/me/sessions',
      queryParams: {'filter': filter},
    ),
    fromJson: ListenerSessionsListResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerSessionStatsResponseModel> getSessionStats() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/session-stats'),
        fromJson: ListenerSessionStatsResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerSessionRequestsResponseModel>
  getSessionRequests() => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/me/session-requests'),
    fromJson: ListenerSessionRequestsResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerAcceptSessionRequestResponseModel>
  acceptSessionRequest({required String requestId}) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/listeners/me/session-requests/$requestId/accept',
      data: const <String, dynamic>{},
    ),
    fromJson: ListenerAcceptSessionRequestResponseModel.fromJson,
  );

  TaskEither<Exception, void> declineSessionRequest({
    required String requestId,
    String? reason,
  }) => executeVoidRequest(
    request: apiClient.post<Object?>(
      'v1/listeners/me/session-requests/$requestId/decline',
      data: {
        if (reason != null && reason.trim().isNotEmpty) 'reason': reason.trim(),
      },
    ),
  );
}
