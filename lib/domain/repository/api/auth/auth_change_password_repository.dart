import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthChangePasswordRepository extends BaseRepository {
  const AuthChangePasswordRepository(super.apiClient);

  TaskEither<Exception, AuthOkResponseModel> call({
    required String accessToken,
    required String currentPassword,
    required String newPassword,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/auth/change-password',
      headers: {'Authorization': 'Bearer $accessToken'},
      data: {'current_password': currentPassword, 'new_password': newPassword},
    ),
    fromJson: AuthOkResponseModel.fromJson,
  );
}
