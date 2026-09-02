import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_mood_checkin_repository.dart';

class SubmitVentorMoodCheckinUsecase {
  final VentorMoodCheckinRepository ventorMoodCheckinRepository;
  final VentingPreferences ventingPreferences;

  const SubmitVentorMoodCheckinUsecase(
    this.ventorMoodCheckinRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorMoodCheckinResult> call({
    required VentorMoodKindData mood,
    String? note,
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

    return ventorMoodCheckinRepository
        .submitCheckin(mood: ventorMoodKindToApi(mood), note: note)
        .map((response) => ventorMoodCheckinResultFromApi(response.data));
  }
}
