import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_invites_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_point_packages_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_purchase_points_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_redeem_reward_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_reward_trades_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_rewards_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class VentorRewardsRepository extends BaseRepository {
  const VentorRewardsRepository(super.apiClient);

  TaskEither<Exception, VentorRewardsResponseModel> getRewards() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/ventors/me/rewards'),
        fromJson: VentorRewardsResponseModel.fromJson,
      );

  TaskEither<Exception, VentorRewardTradesResponseModel> getTrades() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/ventors/me/rewards/trades'),
        fromJson: VentorRewardTradesResponseModel.fromJson,
      );

  TaskEither<Exception, VentorInvitesResponseModel> getInvites() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/ventors/me/invites'),
        fromJson: VentorInvitesResponseModel.fromJson,
      );

  TaskEither<Exception, VentorRedeemRewardResponseModel> redeemOffer({
    required String offerId,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/ventors/me/rewards/redeem',
      data: <String, dynamic>{'offer_id': offerId},
    ),
    fromJson: VentorRedeemRewardResponseModel.fromJson,
  );

  TaskEither<Exception, VentorPointPackagesResponseModel> getPointPackages() =>
      executeRequest(
        request: apiClient.get<Object?>(
          'v1/ventors/me/rewards/point-packages',
        ),
        fromJson: VentorPointPackagesResponseModel.fromJson,
      );

  TaskEither<Exception, VentorPurchasePointsResponseModel> purchasePoints({
    required String packageId,
  }) => executeRequest(
    request: apiClient.post<Object?>(
      'v1/ventors/me/rewards/purchase-points',
      data: <String, dynamic>{'package_id': packageId},
    ),
    fromJson: VentorPurchasePointsResponseModel.fromJson,
  );
}
