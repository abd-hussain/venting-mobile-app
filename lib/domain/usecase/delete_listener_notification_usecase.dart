import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notifications_repository.dart';

class DeleteListenerNotificationUsecase {
  final ListenerNotificationsRepository listenerNotificationsRepository;
  final VentingPreferences ventingPreferences;

  const DeleteListenerNotificationUsecase(
    this.listenerNotificationsRepository,
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

    return listenerNotificationsRepository.deleteNotification(
      notificationId: notificationId,
    );
  }
}
