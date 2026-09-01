import 'package:venting_mobile_app/domain/data/api/ventor_point_packages_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_purchase_points_response_model.dart';

class VentorPointPackageData {
  const VentorPointPackageData({
    required this.id,
    required this.points,
    required this.priceUsd,
    this.bonusPercent,
    this.sortOrder = 0,
  });

  final String id;
  final int points;
  final double priceUsd;
  final int? bonusPercent;
  final int sortOrder;
}

class VentorPointPurchaseData {
  const VentorPointPurchaseData({
    required this.id,
    required this.packageId,
    required this.pointsAdded,
    required this.priceUsd,
    required this.purchasedAt,
  });

  final String id;
  final String packageId;
  final int pointsAdded;
  final double priceUsd;
  final DateTime purchasedAt;
}

class VentorPurchasePointsResult {
  const VentorPurchasePointsResult({required this.points, this.purchase});

  final int points;
  final VentorPointPurchaseData? purchase;
}

List<VentorPointPackageData> ventorPointPackagesFromApi(
  VentorPointPackagesData data,
) {
  final packages = [for (final item in data.packages) _packageFromApi(item)]
    ..sort((a, b) => a.sortOrder.compareTo(b.sortOrder));

  return packages;
}

VentorPurchasePointsResult ventorPurchasePointsFromApi(
  VentorPurchasePointsData data,
) {
  final purchase = data.purchase;
  return VentorPurchasePointsResult(
    points: data.points,
    purchase: purchase == null ? null : _purchaseFromApi(purchase),
  );
}

VentorPointPackageData _packageFromApi(VentorPointPackageItemModel item) {
  return VentorPointPackageData(
    id: item.id.trim(),
    points: item.points,
    priceUsd: item.price_usd,
    bonusPercent: item.bonus_percent,
    sortOrder: item.sort_order,
  );
}

VentorPointPurchaseData _purchaseFromApi(VentorPointPurchaseItemModel item) {
  return VentorPointPurchaseData(
    id: item.id.trim(),
    packageId: item.package_id.trim(),
    pointsAdded: item.points_added,
    priceUsd: item.price_usd,
    purchasedAt: DateTime.tryParse(item.purchased_at.trim()) ?? DateTime.now(),
  );
}
