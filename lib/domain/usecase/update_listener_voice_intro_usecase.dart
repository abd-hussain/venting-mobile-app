import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/listener_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class UpdateListenerVoiceIntroUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const UpdateListenerVoiceIntroUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, ListenerProfile> call({
    required String voiceFilePath,
    required int durationSeconds,
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

    final path = voiceFilePath.trim();
    if (path.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Voice introduction is required',
        ),
      );
    }

    return listenerProfileRepository
        .updateVoiceIntro(
          voiceFilePath: path,
          durationSeconds: durationSeconds,
        )
        .flatMap(
          (voiceResponse) => listenerProfileRepository.getProfile().map(
            (profileResponse) {
              final upload = voiceResponse.data;
              final merged = profileResponse.data.copyWith(
                voice_intro_url: upload.voice_intro_url.isNotEmpty
                    ? upload.voice_intro_url
                    : profileResponse.data.voice_intro_url,
                voice_intro_seconds: upload.voice_intro_seconds > 0
                    ? upload.voice_intro_seconds
                    : (durationSeconds > 0
                          ? durationSeconds
                          : profileResponse.data.voice_intro_seconds),
              );
              return listenerProfileFromApi(
                merged,
                apiBaseUrl: appConfig.baseUrl,
              );
            },
          ),
        );
  }
}
