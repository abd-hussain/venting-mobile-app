import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_find_listeners.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_find_listeners_repository.dart';

class GetVentorListenerProfileUsecase {
  final VentorFindListenersRepository ventorFindListenersRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const GetVentorListenerProfileUsecase(
    this.ventorFindListenersRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, VentorFindListenerData> call({
    required String listenerId,
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

    final trimmedId = listenerId.trim();
    if (trimmedId.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Missing listener id',
        ),
      );
    }

    return ventorFindListenersRepository
        .getListener(listenerId: trimmedId)
        .map(
          (response) => ventorFindListenerFromApi(
            response.data,
            apiBaseUrl: appConfig.baseUrl,
          ),
        );
  }
}
