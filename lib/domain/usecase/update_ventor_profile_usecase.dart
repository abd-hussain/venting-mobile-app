import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_profile_repository.dart';

class UpdateVentorProfileUsecase {
  final VentorProfileRepository ventorProfileRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const UpdateVentorProfileUsecase(
    this.ventorProfileRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, VentorProfileSummary> call({
    String? nickname,
    String? avatarFilePath,
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

    return ventorProfileRepository
        .updateProfile(nickname: nickname, avatarFilePath: avatarFilePath)
        .map(
          (response) => ventorProfileSummaryFromApi(
            response.data,
            apiBaseUrl: appConfig.baseUrl,
          ),
        );
  }
}
