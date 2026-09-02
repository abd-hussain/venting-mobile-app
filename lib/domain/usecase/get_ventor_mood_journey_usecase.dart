import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_journey_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_profile_repository.dart';

class GetVentorMoodJourneyUsecase {
  final VentorProfileRepository ventorProfileRepository;
  final VentingPreferences ventingPreferences;

  const GetVentorMoodJourneyUsecase(
    this.ventorProfileRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorMoodJourneyData> call({int days = 7}) {
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
        .getMoodJourney(days: days)
        .map((response) => response.data);
  }
}
