import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_forgot_password_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_forgot_password_repository.dart';

class AuthForgotPasswordUsecase {
  const AuthForgotPasswordUsecase(this._authForgotPasswordRepository);

  final AuthForgotPasswordRepository _authForgotPasswordRepository;

  TaskEither<Exception, AuthForgotPasswordResponseModel> call({
    required String email,
    required String role,
    required String locale,
  }) => _authForgotPasswordRepository.call(
    email: email,
    role: role,
    locale: locale,
  );
}
