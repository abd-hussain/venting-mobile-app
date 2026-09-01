import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthLoginRepository extends BaseRepository {
  const AuthLoginRepository(super.apiClient);

  TaskEither<Exception, AuthSessionResponseModel> call({
    required String email,
    required String password,
    required String role,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/auth/login',
      data: {'email': email, 'password': password, 'role': role},
    ),
    fromJson: AuthSessionResponseModel.fromJson,
  );
}
