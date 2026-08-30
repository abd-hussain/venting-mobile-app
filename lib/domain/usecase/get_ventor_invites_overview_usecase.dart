import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_invites_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_rewards_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_invites.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_rewards_repository.dart';

class GetVentorInvitesOverviewUsecase {
  final VentorRewardsRepository ventorRewardsRepository;
  final VentingPreferences ventingPreferences;

  const GetVentorInvitesOverviewUsecase(
    this.ventorRewardsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorInvitesOverviewData> call() {
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
        ventorRewardsRepository.getInvites().run(),
        ventorRewardsRepository.getRewards().run(),
      ]);

      final invites = _unwrap<VentorInvitesResponseModel>(
        results[0] as Either<Exception, VentorInvitesResponseModel>,
      );
      final rewards = _unwrap<VentorRewardsResponseModel>(
        results[1] as Either<Exception, VentorRewardsResponseModel>,
      );

      return ventorInvitesOverviewFromApi(
        invites: invites.data,
        earnRules: rewards.data.earn_rules,
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
