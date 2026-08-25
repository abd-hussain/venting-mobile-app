import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_check_email_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class AuthCheckEmailRepository extends BaseRepository {
  const AuthCheckEmailRepository(super.apiClient);

  TaskEither<Exception, AuthCheckEmailResponseModel> call({
    required String email,
    String? role,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/auth/check-email',
      data: {'email': email, if (role != null) 'role': role},
    ),
    fromJson: AuthCheckEmailResponseModel.fromJson,
  );
}
