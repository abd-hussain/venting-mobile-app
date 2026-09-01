import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_notifications_repository.dart';

class DeleteVentorNotificationUsecase {
  final VentorNotificationsRepository ventorNotificationsRepository;
  final VentingPreferences ventingPreferences;

  const DeleteVentorNotificationUsecase(
    this.ventorNotificationsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, void> call({required String notificationId}) {
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

    return ventorNotificationsRepository.deleteNotification(
      notificationId: notificationId,
    );
  }
}
