import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_point_packages.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_rewards_repository.dart';

class PurchaseVentorPointsUsecase {
  final VentorRewardsRepository ventorRewardsRepository;
  final VentingPreferences ventingPreferences;

  const PurchaseVentorPointsUsecase(
    this.ventorRewardsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, VentorPurchasePointsResult> call({
    required String packageId,
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

    final trimmedPackageId = packageId.trim();
    if (trimmedPackageId.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Missing package id',
        ),
      );
    }

    return ventorRewardsRepository
        .purchasePoints(packageId: trimmedPackageId)
        .map((response) => ventorPurchasePointsFromApi(response.data));
  }
}
