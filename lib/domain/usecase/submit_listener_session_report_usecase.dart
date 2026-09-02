import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_sessions_repository.dart';

class SubmitListenerSessionReportUsecase {
  final ListenerSessionsRepository listenerSessionsRepository;
  final VentingPreferences ventingPreferences;

  const SubmitListenerSessionReportUsecase(
    this.listenerSessionsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, void> call({
    required String sessionId,
    required String reason,
    String? details,
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

    final trimmedReason = reason.trim();
    if (trimmedReason.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Missing report reason',
        ),
      );
    }

    return listenerSessionsRepository.submitSessionReport(
      sessionId: trimmedId,
      reason: trimmedReason,
      reportedRole: 'ventor',
      details: details,
    );
  }
}
