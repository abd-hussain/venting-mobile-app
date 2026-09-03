import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_sessions_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/session_join_response_model.dart';
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

  TaskEither<Exception, SessionJoinResponseModel> joinSession({
    required String sessionId,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/sessions/$sessionId/join',
      data: const <String, dynamic>{},
    ),
    fromJson: SessionJoinResponseModel.fromJson,
  );

  TaskEither<Exception, void> submitSessionFeedback({
    required String sessionId,
    required int stars,
    required bool feltHeard,
    required bool talkAgain,
  }) => executeVoidRequest(
    request: apiClient.post<Object?>(
      'v1/sessions/$sessionId/feedback',
      data: {'stars': stars, 'felt_heard': feltHeard, 'talk_again': talkAgain},
    ),
  );

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
