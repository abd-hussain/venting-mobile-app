import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_sessions.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_sessions_repository.dart';

class CancelVentorSessionUsecase {
  final VentorSessionsRepository ventorSessionsRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const CancelVentorSessionUsecase(
    this.ventorSessionsRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, VentorBookedSessionData> call({
    required String sessionId,
    String? reason,
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

    return ventorSessionsRepository
        .cancelSession(sessionId: trimmedId, reason: reason)
        .map(
          (response) => ventorCancelledSessionFromApi(
            response.data,
            apiBaseUrl: appConfig.baseUrl,
          ),
        );
  }
}
