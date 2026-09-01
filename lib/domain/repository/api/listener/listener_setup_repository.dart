import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_setup_progress_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerSetupRepository extends BaseRepository {
  const ListenerSetupRepository(super.apiClient);

  TaskEither<Exception, ListenerSetupProgressResponseModel>
  getSetupProgress() => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/me/setup-progress'),
    fromJson: ListenerSetupProgressResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerSetupProgressResponseModel>
  acknowledgeFirstSessionTutorial() => executeRequest(
    request: apiClient.post<Object?>(
      'v1/listeners/me/setup/first-session-tutorial',
      data: const <String, dynamic>{'acknowledged': true},
    ),
    fromJson: ListenerSetupProgressResponseModel.fromJson,
  );
}
