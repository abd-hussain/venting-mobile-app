import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_availability.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_availability_repository.dart';

class UpdateListenerAvailabilityDayUsecase {
  final ListenerAvailabilityRepository listenerAvailabilityRepository;
  final VentingPreferences ventingPreferences;

  const UpdateListenerAvailabilityDayUsecase(
    this.listenerAvailabilityRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerAvailabilityDay> call({
    required String dayId,
    required List<ListenerAvailabilitySlot> slots,
  }) {
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

    final normalizedDayId = dayId.trim().toLowerCase();
    if (!kListenerWeekDayIds.contains(normalizedDayId)) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Invalid day',
        ),
      );
    }

    return listenerAvailabilityRepository
        .updateDay(
          day: normalizedDayId,
          body: listenerAvailabilityDaySlotsToApiBody(slots),
        )
        .map((response) => listenerAvailabilityDayFromApi(response.data));
  }
}
