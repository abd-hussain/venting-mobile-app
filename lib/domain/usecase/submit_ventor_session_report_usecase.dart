import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_sessions_repository.dart';

class SubmitVentorSessionReportUsecase {
  final VentorSessionsRepository ventorSessionsRepository;
  final VentingPreferences ventingPreferences;

  const SubmitVentorSessionReportUsecase(
    this.ventorSessionsRepository,
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

    return ventorSessionsRepository.submitSessionReport(
      sessionId: trimmedId,
      reason: trimmedReason,
      reportedRole: 'listener',
      details: details,
    );
  }
}
