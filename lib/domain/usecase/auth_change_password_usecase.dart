import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
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
    final accessToken = ventingPreferences.getValue(
      SavedConstants.accessToken,
      '',
    );

    return authChangePasswordRepository.call(
      accessToken: accessToken,
      currentPassword: currentPassword,
      newPassword: newPassword,
    );
  }
}
