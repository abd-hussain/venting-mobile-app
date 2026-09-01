import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_notifications_repository.dart';

class MarkAllListenerNotificationsReadUsecase {
  final ListenerNotificationsRepository listenerNotificationsRepository;
  final VentingPreferences ventingPreferences;

  const MarkAllListenerNotificationsReadUsecase(
    this.listenerNotificationsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, void> call() {
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

    return listenerNotificationsRepository.markAllAsRead();
  }
}
