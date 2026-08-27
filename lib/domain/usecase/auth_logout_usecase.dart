import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_logout_repository.dart';

class AuthLogoutUsecase {
  final AuthLogoutRepository authLogoutRepository;
  final VentingPreferences ventingPreferences;

  const AuthLogoutUsecase(this.authLogoutRepository, this.ventingPreferences);

  TaskEither<Exception, AuthOkResponseModel> call() {
    final accessToken = ventingPreferences
        .getValue(SavedConstants.accessToken, '')
        .trim();
    final refreshToken = ventingPreferences
        .getValue(SavedConstants.refreshToken, '')
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

    return authLogoutRepository.call(
      accessToken: accessToken,
      refreshToken: refreshToken.isEmpty ? null : refreshToken,
    );
  }
}
