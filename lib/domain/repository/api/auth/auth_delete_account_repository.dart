import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthDeleteAccountRepository extends BaseRepository {
  const AuthDeleteAccountRepository(super.apiClient);

  TaskEither<Exception, AuthOkResponseModel> call({
    required String accessToken,
    String? password,
  }) => executeRequest(
    request: apiClient.delete<Object?>(
      'v1/auth/account',
      headers: {'Authorization': 'Bearer $accessToken'},
      data: password == null ? null : {'password': password},
    ),
    fromJson: AuthOkResponseModel.fromJson,
  );
}
