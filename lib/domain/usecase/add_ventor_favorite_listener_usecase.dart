import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_profile_repository.dart';

class AddVentorFavoriteListenerUsecase {
  final VentorProfileRepository ventorProfileRepository;
  final VentingPreferences ventingPreferences;

  const AddVentorFavoriteListenerUsecase(
    this.ventorProfileRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, void> call({required String listenerId}) {
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

    final trimmedId = listenerId.trim();
    if (trimmedId.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Missing listener id',
        ),
      );
    }

    return ventorProfileRepository.addFavorite(listenerId: trimmedId);
  }
}
