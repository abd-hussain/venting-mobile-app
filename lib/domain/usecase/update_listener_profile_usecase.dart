import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class UpdateListenerProfileUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const UpdateListenerProfileUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, ListenerProfile> call({
    required Map<String, dynamic> fields,
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

    if (fields.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'No profile fields to update',
        ),
      );
    }

    return listenerProfileRepository
        .patchProfile(fields: fields)
        .map(
          (response) => listenerProfileFromApi(
            response.data,
            apiBaseUrl: appConfig.baseUrl,
          ),
        );
  }
}
