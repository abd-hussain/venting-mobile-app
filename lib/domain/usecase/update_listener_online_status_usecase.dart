import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class UpdateListenerOnlineStatusUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;

  const UpdateListenerOnlineStatusUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, bool> call({required bool isOnline}) {
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

    return listenerProfileRepository
        .updateOnlineStatus(isOnline: isOnline)
        .map((response) => response.data.is_online);
  }
}
