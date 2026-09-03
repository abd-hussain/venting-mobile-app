import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/session_call_credentials.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_sessions_repository.dart';

class JoinSessionUsecase {
  final ListenerSessionsRepository listenerSessionsRepository;
  final VentingPreferences ventingPreferences;

  const JoinSessionUsecase(
    this.listenerSessionsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, SessionCallCredentials> call({
    required String sessionId,
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

    return listenerSessionsRepository
        .joinSession(sessionId: trimmedId)
        .map((response) => sessionCallCredentialsFromApi(response.data));
  }
}
