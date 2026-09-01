import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_session_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_register_repository.dart';

class AuthRegisterUsecase {
  final AuthRegisterRepository authRegisterRepository;

  const AuthRegisterUsecase(this.authRegisterRepository);

  TaskEither<Exception, AuthSessionResponseModel> call({
    required String email,
    required String password,
    required String role,
  }) =>
      authRegisterRepository.call(email: email, password: password, role: role);
}
