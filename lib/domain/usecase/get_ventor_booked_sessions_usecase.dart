import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_home_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_sessions_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_sessions.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_sessions_repository.dart';

class GetVentorBookedSessionsUsecase {
  final VentorSessionsRepository ventorSessionsRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const GetVentorBookedSessionsUsecase(
    this.ventorSessionsRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  static const _statuses = <String>[
    'upcoming',
    'live',
    'completed',
    'cancelled',
  ];

  TaskEither<Exception, VentorBookedSessionsOverview> call() {
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

    return TaskEither.tryCatch(() async {
      final results = await Future.wait([
        for (final status in _statuses)
          ventorSessionsRepository.getSessions(status: status).run(),
      ]);

      final items = <VentorHomeBookedSessionModel>[];
      for (final result in results) {
        final response = _unwrap<VentorSessionsListResponseModel>(result);
        items.addAll(response.data.items);
      }

      return ventorBookedSessionsOverviewFromApi(
        items: items,
        apiBaseUrl: appConfig.baseUrl,
      );
    }, _mapError);
  }
}

T _unwrap<T>(Either<Exception, T> either) {
  return either.match((error) => throw error, (value) => value);
}

MainAPIException _mapError(Object error, StackTrace stackTrace) {
  if (error is MainAPIException) return error;
  return MainAPIException(
    status: 'failed',
    type: 'unknown',
    code: -1,
    message: error.toString(),
    stackTrace: stackTrace,
  );
}
