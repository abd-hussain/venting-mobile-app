import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_login_repository.dart';

class AuthLoginUsecase {
  final AuthLoginRepository authLoginRepository;

  const AuthLoginUsecase(this.authLoginRepository);

  TaskEither<Exception, AuthSessionResponseModel> call({
    required String email,
    required String password,
    required String role,
  }) => authLoginRepository.call(email: email, password: password, role: role);
}
