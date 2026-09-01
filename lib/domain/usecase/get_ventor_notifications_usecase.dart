import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_notifications_repository.dart';

class GetVentorNotificationsUsecase {
  final VentorNotificationsRepository ventorNotificationsRepository;
  final VentingPreferences ventingPreferences;

  const GetVentorNotificationsUsecase(
    this.ventorNotificationsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, List<AppNotification>> call({bool unreadOnly = false}) {
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

    return ventorNotificationsRepository
        .getNotifications(unreadOnly: unreadOnly)
        .map((response) => appNotificationsFromApi(response.data));
  }
}
