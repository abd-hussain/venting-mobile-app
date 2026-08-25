import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/auth_check_email_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_check_email_repository.dart';

class AuthCheckEmailUsecase {
  final AuthCheckEmailRepository authCheckEmailRepository;

  const AuthCheckEmailUsecase(this.authCheckEmailRepository);

  TaskEither<Exception, AuthCheckEmailResponseModel> call({
    required String email,
    String? role,
  }) {
    final normalizedEmail = email.trim().toLowerCase();
    if (normalizedEmail.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 110,
          message: 'Email is required',
        ),
      );
    }

    return authCheckEmailRepository.call(
      email: normalizedEmail,
      role: role,
    );
  }
}
