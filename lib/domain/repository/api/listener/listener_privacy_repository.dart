import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_privacy_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerPrivacyRepository extends BaseRepository {
  const ListenerPrivacyRepository(super.apiClient);

  TaskEither<Exception, ListenerPrivacyResponseModel> getPrivacy() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/privacy'),
        fromJson: ListenerPrivacyResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerPrivacyResponseModel> updatePrivacy({
    required Map<String, dynamic> body,
  }) => executeRequest(
    request: apiClient.put<Object?>('v1/listeners/me/privacy', data: body),
    fromJson: ListenerPrivacyResponseModel.fromJson,
  );
}
