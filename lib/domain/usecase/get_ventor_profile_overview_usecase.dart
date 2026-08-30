import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_favorites_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_journey_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_profile.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_profile_repository.dart';

class GetVentorProfileOverviewUsecase {
  final VentorProfileRepository ventorProfileRepository;
  final VentingPreferences ventingPreferences;
  final AppConfig appConfig;

  const GetVentorProfileOverviewUsecase(
    this.ventorProfileRepository,
    this.ventingPreferences,
    this.appConfig,
  );

  TaskEither<Exception, VentorProfileOverview> call() {
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

    return TaskEither.tryCatch(() async {
      final results = await Future.wait([
        ventorProfileRepository.getProfile().run(),
        ventorProfileRepository.getMoodJourney().run(),
        ventorProfileRepository.getFavorites().run(),
      ]);

      final profile = _unwrap<VentorProfileResponseModel>(
        results[0] as Either<Exception, VentorProfileResponseModel>,
      );
      final moodJourney = _unwrap<VentorMoodJourneyResponseModel>(
        results[1] as Either<Exception, VentorMoodJourneyResponseModel>,
      );
      final favorites = _unwrap<VentorFavoritesResponseModel>(
        results[2] as Either<Exception, VentorFavoritesResponseModel>,
      );

      return ventorProfileOverviewFromApi(
        profile: profile.data,
        moodJourney: moodJourney.data,
        favorites: favorites.data,
        apiBaseUrl: appConfig.baseUrl,
      );
    }, _mapError);
  }
}

T _unwrap<T>(Either<Exception, T> either) {
  return either.match((error) => throw error, (value) => value);
}

MainAPIException _mapError(Object error, StackTrace stackTrace) {
  if (error is MainAPIException) return error;
  return MainAPIException(
    status: 'failed',
    type: 'unknown',
    code: -1,
    message: error.toString(),
    stackTrace: stackTrace,
  );
}
