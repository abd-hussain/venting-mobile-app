import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_privacy_settings.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_privacy_repository.dart';

class UpdateListenerPrivacyUsecase {
  final ListenerPrivacyRepository listenerPrivacyRepository;
  final VentingPreferences ventingPreferences;

  const UpdateListenerPrivacyUsecase(
    this.listenerPrivacyRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerPrivacyVisibilitySettings> call({
    required ListenerPrivacyVisibilitySettings settings,
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

    if (!settings.visibleInAllCountries && settings.visibleCountries.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'At least one country is required',
        ),
      );
    }

    return listenerPrivacyRepository
        .updatePrivacy(body: listenerPrivacySettingsToApiBody(settings))
        .map((response) => listenerPrivacySettingsFromApi(response.data));
  }
}
