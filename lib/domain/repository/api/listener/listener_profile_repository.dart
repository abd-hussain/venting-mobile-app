import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_profile_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerProfileRepository extends BaseRepository {
  const ListenerProfileRepository(super.apiClient);

  TaskEither<Exception, ListenerProfileResponseModel> updatePhone({
    required String phone,
    required String phoneCountry,
  }) => executeRequest(
    request: apiClient.patch<Object?>(
      'v1/listeners/me',
      data: <String, dynamic>{'phone': phone, 'phone_country': phoneCountry},
    ),
    fromJson: ListenerProfileResponseModel.fromJson,
  );
}
