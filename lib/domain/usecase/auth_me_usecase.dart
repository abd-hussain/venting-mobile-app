import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/auth_me_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/auth/auth_me_repository.dart';
import 'package:venting_mobile_app/domain/repository/app/auth_me_cache_repository.dart';

class AuthMeUsecase {
  final AuthMeRepository authMeRepository;
  final AuthMeCacheRepository authMeCacheRepository;
  final VentingPreferences ventingPreferences;

  const AuthMeUsecase(
    this.authMeRepository,
    this.authMeCacheRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, AuthMeResponseModel> call() {
    final accessToken = ventingPreferences.getValue(
      SavedConstants.accessToken,
      '',
    );

    if (accessToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Access token is missing',
        ),
      );
    }

    return authMeRepository
        .call(accessToken: accessToken)
        .flatMap(
          (response) => TaskEither.tryCatch(
            () async {
              await _persistSession(response.data);
              return response;
            },
            (error, _) =>
                error is Exception ? error : Exception(error.toString()),
          ),
        );
  }

  Future<void> _persistSession(AuthMeData data) async {
    await authMeCacheRepository.save(data);
    await ventingPreferences.setValue(SavedConstants.alreadyUser, data.email);
    await ventingPreferences.setValue(
      SavedConstants.compleateRegistration,
      data.registration_complete.toString(),
    );
    await ventingPreferences.setValue(
      SavedConstants.userType,
      data.role == 'listener' ? 'lissener' : 'ventor',
    );
  }
}
