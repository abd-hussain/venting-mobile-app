import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_training_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerTrainingRepository extends BaseRepository {
  const ListenerTrainingRepository(super.apiClient);

  TaskEither<Exception, ListenerTrainingResponseModel> getTraining() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/training'),
        fromJson: ListenerTrainingResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerTrainingResponseModel> completeModule({
    required String moduleId,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/listeners/me/training/$moduleId/complete',
      data: const <String, dynamic>{},
    ),
    fromJson: ListenerTrainingResponseModel.fromJson,
  );
}
