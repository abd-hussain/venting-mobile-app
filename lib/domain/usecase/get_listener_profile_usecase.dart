import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class GetListenerProfileUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const GetListenerProfileUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, ListenerProfile> call() {
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

    return listenerProfileRepository.getProfile().map(
      (response) =>
          listenerProfileFromApi(response.data, apiBaseUrl: appConfig.baseUrl),
    );
  }
}
