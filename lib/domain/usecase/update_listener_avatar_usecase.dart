import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class UpdateListenerAvatarUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const UpdateListenerAvatarUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, ListenerProfile> call({
    required String avatarFilePath,
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

    final path = avatarFilePath.trim();
    if (path.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Avatar image is required',
        ),
      );
    }

    return listenerProfileRepository
        .updateAvatar(avatarFilePath: path)
        .flatMap(
          (uploadResponse) => listenerProfileRepository.getProfile().map(
            (profileResponse) => mergeProfileAfterWrite(
              listenerProfileFromApi(
                profileResponse.data,
                apiBaseUrl: appConfig.baseUrl,
              ),
              listenerProfileFromApi(
                uploadResponse.data,
                apiBaseUrl: appConfig.baseUrl,
              ),
            ),
          ),
        );
  }
}
