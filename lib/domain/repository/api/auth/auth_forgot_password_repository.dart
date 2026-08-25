import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_forgot_password_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthForgotPasswordRepository extends BaseRepository {
  const AuthForgotPasswordRepository(super.apiClient);

  /// `POST /v1/auth/forgot-password`
  TaskEither<Exception, AuthForgotPasswordResponseModel> call({
    required String email,
    required String role,
    required String locale,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/auth/forgot-password',
      data: {'email': email, 'role': role, 'locale': locale},
    ),
    fromJson: AuthForgotPasswordResponseModel.fromJson,
  );
}
