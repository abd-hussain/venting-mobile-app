import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_rewards_repository.dart';

class GetVentorRewardsUsecase {
  final VentorRewardsRepository ventorRewardsRepository;
  final VentingPreferences ventingPreferences;

  const GetVentorRewardsUsecase(
    this.ventorRewardsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorRewardsOverviewData> call() {
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

    return ventorRewardsRepository
        .getRewards()
        .map((response) => ventorRewardsOverviewFromApi(response.data));
  }
}
