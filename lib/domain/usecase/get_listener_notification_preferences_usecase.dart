import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification_preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notification_preferences_repository.dart';

class GetListenerNotificationPreferencesUsecase {
  final ListenerNotificationPreferencesRepository
  listenerNotificationPreferencesRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerNotificationPreferencesUsecase(
    this.listenerNotificationPreferencesRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerNotificationPreferences> call() {
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

    return listenerNotificationPreferencesRepository.getPreferences().map(
      (response) => listenerNotificationPreferencesFromApi(response.data),
    );
  }
}
