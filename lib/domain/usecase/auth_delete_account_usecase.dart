import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_ok_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_delete_account_repository.dart';

class AuthDeleteAccountUsecase {
  final AuthDeleteAccountRepository authDeleteAccountRepository;
  final VentingPreferences ventingPreferences;

  const AuthDeleteAccountUsecase(
    this.authDeleteAccountRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, AuthOkResponseModel> call({String? password}) {
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

    return authDeleteAccountRepository.call(
      accessToken: accessToken,
      password: password,
    );
  }
}
