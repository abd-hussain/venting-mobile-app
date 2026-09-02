import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_home_repository.dart';

class GetVentorHomeUsecase {
  final VentorHomeRepository ventorHomeRepository;
  final VentingPreferences ventingPreferences;

  const GetVentorHomeUsecase(
    this.ventorHomeRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorHomeOverview> call() {
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

    return ventorHomeRepository.getHome().map(
      (response) => ventorHomeOverviewFromApi(response.data),
    );
  }
}
