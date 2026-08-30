import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_notification_preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_notification_preferences_repository.dart';

class GetVentorNotificationPreferencesUsecase {
  final VentorNotificationPreferencesRepository
  ventorNotificationPreferencesRepository;
  final VentingPreferences ventingPreferences;

  const GetVentorNotificationPreferencesUsecase(
    this.ventorNotificationPreferencesRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorNotificationPreferences> call() {
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

    return ventorNotificationPreferencesRepository.getPreferences().map(
      (response) => ventorNotificationPreferencesFromApi(response.data),
    );
  }
}
