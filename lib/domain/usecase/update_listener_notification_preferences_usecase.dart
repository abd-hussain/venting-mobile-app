import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification_preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notification_preferences_repository.dart';

class UpdateListenerNotificationPreferencesUsecase {
  final ListenerNotificationPreferencesRepository
  listenerNotificationPreferencesRepository;
  final VentingPreferences ventingPreferences;

  const UpdateListenerNotificationPreferencesUsecase(
    this.listenerNotificationPreferencesRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerNotificationPreferences> call({
    required ListenerNotificationPreferences preferences,
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

    return listenerNotificationPreferencesRepository
        .updatePreferences(
          body: listenerNotificationPreferencesToApiBody(preferences),
        )
        .map(
          (response) => listenerNotificationPreferencesFromApi(response.data),
        );
  }
}
