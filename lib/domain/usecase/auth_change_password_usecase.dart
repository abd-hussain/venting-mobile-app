import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_change_password_repository.dart';

class AuthChangePasswordUsecase {
  final AuthChangePasswordRepository authChangePasswordRepository;
  final VentingPreferences ventingPreferences;

  const AuthChangePasswordUsecase(
    this.authChangePasswordRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, AuthOkResponseModel> call({
    required String currentPassword,
    required String newPassword,
  }) {
    final accessToken = ventingPreferences
        .getValue(SavedConstants.accessToken, '')
        .trim();

    if (accessToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Missing access token',
        ),
      );
    }

    if (currentPassword.isEmpty || newPassword.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Current and new password are required',
        ),
      );
    }

    // Never use refresh_token here — only the session access JWT identifies
    // the authenticated user for this call.
    return authChangePasswordRepository.call(
      accessToken: accessToken,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
