import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthLogoutRepository extends BaseRepository {
  const AuthLogoutRepository(super.apiClient);

  TaskEither<Exception, AuthOkResponseModel> call({
    required String accessToken,
    String? refreshToken,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/auth/logout',
      headers: {'Authorization': 'Bearer $accessToken'},
      data: refreshToken == null ? null : {'refresh_token': refreshToken},
    ),
    fromJson: AuthOkResponseModel.fromJson,
  );
}
