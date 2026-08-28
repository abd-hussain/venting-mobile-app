import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_training.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_training_repository.dart';

class GetListenerTrainingUsecase {
  final ListenerTrainingRepository listenerTrainingRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerTrainingUsecase(
    this.listenerTrainingRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerTrainingProgress> call() {
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

    return listenerTrainingRepository.getTraining().map(
      (response) => listenerTrainingProgressFromApi(response.data),
    );
  }
}
