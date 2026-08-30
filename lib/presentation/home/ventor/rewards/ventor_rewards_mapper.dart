import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/presentation/home/listener/earnings/listener_earnings_tiers.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';

VentorRewardOffer ventorRewardOfferFromData(VentorRewardOfferData data) {
  return VentorRewardOffer(
    id: data.id,
    kind: _kindFromData(data.kind),
    pointsCost: data.pointsCost,
    percentOff: data.percentOff,
    freeMinutes: data.freeMinutes,
    isWelcomeGift: data.isWelcomeGift,
    audience: VentorRewardAudience(
      minTier: _tierFromApi(data.audience.minTier),
      maxTier: _tierFromApi(data.audience.maxTier),
    ),
  );
}

VentorRewardTrade ventorRewardTradeFromData(VentorRewardTradeData data) {
  return VentorRewardTrade(
    id: data.id,
    offerId: data.offerId,
    pointsSpent: data.pointsSpent,
    tradedAt: data.tradedAt,
    isWelcomeGift: data.isWelcomeGift,
  );
}

Map<String, VentorRewardOffer> ventorRewardOffersById(
  List<VentorRewardOfferData> offers,
) {
  return {
    for (final offer in offers)
      if (offer.id.isNotEmpty) offer.id: ventorRewardOfferFromData(offer),
  };
}

VentorRewardOfferKind _kindFromData(VentorRewardKind kind) {
  return switch (kind) {
    VentorRewardKind.percentOff => VentorRewardOfferKind.percentOff,
    VentorRewardKind.freeMinutes => VentorRewardOfferKind.freeMinutes,
    VentorRewardKind.priorityMatch => VentorRewardOfferKind.priorityMatch,
  };
}

ListenerEarningsTierId? _tierFromApi(String? raw) {
  final value = raw?.trim().toLowerCase() ?? '';
  return switch (value) {
    'starter' => ListenerEarningsTierId.starter,
    'rising' => ListenerEarningsTierId.rising,
    'trusted' => ListenerEarningsTierId.trusted,
    'expert' => ListenerEarningsTierId.expert,
    'elite' => ListenerEarningsTierId.elite,
    _ => null,
  };
}
