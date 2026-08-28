import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_availability_day_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_availability_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerAvailabilityRepository extends BaseRepository {
  const ListenerAvailabilityRepository(super.apiClient);

  TaskEither<Exception, ListenerAvailabilityResponseModel> getAvailability() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/availability'),
        fromJson: ListenerAvailabilityResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerAvailabilityResponseModel> updateAvailability({
    required Map<String, dynamic> body,
  }) => executeRequest(
    request: apiClient.put<Object?>('v1/listeners/me/availability', data: body),
    fromJson: ListenerAvailabilityResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerAvailabilityDayResponseModel> updateDay({
    required String day,
    required Map<String, dynamic> body,
  }) => executeRequest(
    request: apiClient.put<Object?>(
      'v1/listeners/me/availability/days/$day',
      data: body,
    ),
    fromJson: ListenerAvailabilityDayResponseModel.fromJson,
  );
}
