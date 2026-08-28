import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_availability.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_availability_repository.dart';

class GetListenerAvailabilityUsecase {
  final ListenerAvailabilityRepository listenerAvailabilityRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerAvailabilityUsecase(
    this.listenerAvailabilityRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerAvailability> call() {
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

    return listenerAvailabilityRepository.getAvailability().map(
      (response) => listenerAvailabilityFromApi(response.data),
    );
  }
}
