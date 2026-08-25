import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_me_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthMeRepository extends BaseRepository {
  const AuthMeRepository(super.apiClient);

  TaskEither<Exception, AuthMeResponseModel> call({
    required String accessToken,
  }) => executeRequest(
    request: apiClient.get<Object?>(
      'v1/auth/me',
      headers: {'Authorization': 'Bearer $accessToken'},
    ),
    fromJson: AuthMeResponseModel.fromJson,
  );
}
