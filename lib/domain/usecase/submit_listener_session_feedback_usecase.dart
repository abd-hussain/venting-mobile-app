import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_sessions_repository.dart';

class SubmitListenerSessionFeedbackUsecase {
  final ListenerSessionsRepository listenerSessionsRepository;
  final VentingPreferences ventingPreferences;

  const SubmitListenerSessionFeedbackUsecase(
    this.listenerSessionsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, void> call({
    required String sessionId,
    required int stars,
    required bool feltHeard,
    required bool talkAgain,
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
    return listenerSessionsRepository.submitSessionFeedback(
      sessionId: trimmedId,
      stars: clampedStars,
      feltHeard: feltHeard,
      talkAgain: talkAgain,
    );
  }
}
