import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_rewards_repository.dart';

class RedeemVentorRewardUsecase {
  final VentorRewardsRepository ventorRewardsRepository;
  final VentingPreferences ventingPreferences;

  const RedeemVentorRewardUsecase(
    this.ventorRewardsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorRedeemRewardResult> call({
    required String offerId,
    required VentorRewardsOverviewData currentOverview,
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

    final trimmedOfferId = offerId.trim();
    if (trimmedOfferId.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Missing offer id',
        ),
      );
    }

    return ventorRewardsRepository.redeemOffer(offerId: trimmedOfferId).map((
      response,
    ) {
      final redeem = response.data;
      final trade = redeem.trade;
      return VentorRedeemRewardResult(
        overview: ventorRewardsOverviewAfterRedeem(
          current: currentOverview,
          redeem: redeem,
        ),
        trade: trade == null ? null : ventorRewardTradeFromApi(trade),
      );
    });
  }
}

class VentorRedeemRewardResult {
  const VentorRedeemRewardResult({required this.overview, this.trade});

  final VentorRewardsOverviewData overview;
  final VentorRewardTradeData? trade;
}
