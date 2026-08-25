import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_logout_repository.dart';

class AuthLogoutUsecase {
  final AuthLogoutRepository authLogoutRepository;
  final VentingPreferences ventingPreferences;

  const AuthLogoutUsecase(this.authLogoutRepository, this.ventingPreferences);

  TaskEither<Exception, AuthOkResponseModel> call() {
    final accessToken = ventingPreferences.getValue(
      SavedConstants.accessToken,
      '',
    );
    final refreshToken = ventingPreferences.getValue(
      SavedConstants.refreshToken,
      '',
    );

    return authLogoutRepository.call(
      accessToken: accessToken,
      refreshToken: refreshToken.isEmpty ? null : refreshToken,
    );
  }
}
