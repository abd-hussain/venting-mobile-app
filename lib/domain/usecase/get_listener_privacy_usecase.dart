import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_privacy_settings.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_privacy_repository.dart';

class GetListenerPrivacyUsecase {
  final ListenerPrivacyRepository listenerPrivacyRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerPrivacyUsecase(
    this.listenerPrivacyRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerPrivacyVisibilitySettings> call() {
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

    return listenerPrivacyRepository.getPrivacy().map(
      (response) => listenerPrivacySettingsFromApi(response.data),
    );
  }
}
