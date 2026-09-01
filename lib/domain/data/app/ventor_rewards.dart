import 'package:venting_mobile_app/domain/data/api/ventor_redeem_reward_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_reward_trades_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_rewards_response_model.dart';

enum VentorRewardKind { percentOff, freeMinutes, priorityMatch }

class VentorRewardAudienceData {
  const VentorRewardAudienceData({this.minTier, this.maxTier});

  final String? minTier;
  final String? maxTier;
}

class VentorRewardOfferData {
  const VentorRewardOfferData({
    required this.id,
    required this.kind,
    required this.pointsCost,
    required this.audience,
    this.percentOff,
    this.freeMinutes,
    this.isWelcomeGift = false,
  });

  final String id;
  final VentorRewardKind kind;
  final int pointsCost;
  final VentorRewardAudienceData audience;
  final int? percentOff;
  final int? freeMinutes;
  final bool isWelcomeGift;
}

class VentorRewardEarnRulesData {
  const VentorRewardEarnRulesData({
    required this.pointsPerSession,
    required this.pointsPerFriendRegister,
    required this.pointsPerInviteFirstSession,
    required this.pointsPerFriendBooking,
  });

  final int pointsPerSession;
  final int pointsPerFriendRegister;
  final int pointsPerInviteFirstSession;
  final int pointsPerFriendBooking;
}

class VentorRewardTradeData {
  const VentorRewardTradeData({
    required this.id,
    required this.offerId,
    required this.pointsSpent,
    required this.tradedAt,
    this.isWelcomeGift = false,
  });

  final String id;
  final String offerId;
  final int pointsSpent;
  final DateTime tradedAt;
  final bool isWelcomeGift;
}

class VentorRewardsOverviewData {
  const VentorRewardsOverviewData({
    required this.points,
    required this.completedSessions,
    required this.welcomeGiftClaimed,
    required this.offers,
    required this.earnRules,
    this.activeOfferId,
  });

  final int points;
  final int completedSessions;
  final bool welcomeGiftClaimed;
  final List<VentorRewardOfferData> offers;
  final VentorRewardEarnRulesData earnRules;
  final String? activeOfferId;
}

VentorRewardsOverviewData ventorRewardsOverviewFromApi(VentorRewardsData data) {
  final earnRules = data.earn_rules;
  return VentorRewardsOverviewData(
    points: data.points,
    completedSessions: data.completed_sessions,
    welcomeGiftClaimed: data.welcome_gift_claimed,
    activeOfferId: _nullableId(data.active_offer_id),
    offers: [
      for (final offer in data.offers) _offerFromApi(offer),
    ],
    earnRules: VentorRewardEarnRulesData(
      pointsPerSession: earnRules?.points_per_session ?? 0,
      pointsPerFriendRegister: earnRules?.points_per_friend_register ?? 0,
      pointsPerInviteFirstSession:
          earnRules?.points_per_invite_first_session ?? 0,
      pointsPerFriendBooking: earnRules?.points_per_friend_booking ?? 0,
    ),
  );
}

List<VentorRewardTradeData> ventorRewardTradesFromApi(
  VentorRewardTradesData data,
) {
  return [
    for (final item in data.items) _tradeFromApi(item),
  ];
}

VentorRewardTradeData ventorRewardTradeFromApi(VentorRewardTradeItemModel item) {
  return _tradeFromApi(item);
}

VentorRewardsOverviewData ventorRewardsOverviewAfterRedeem({
  required VentorRewardsOverviewData current,
  required VentorRedeemRewardData redeem,
}) {
  final trade = redeem.trade;
  final tradesOfferId = trade?.offer_id;
  return VentorRewardsOverviewData(
    points: redeem.points_remaining,
    completedSessions: current.completedSessions,
    welcomeGiftClaimed: current.welcomeGiftClaimed ||
        (trade?.is_welcome_gift ?? false),
    activeOfferId: _nullableId(redeem.active_offer_id) ?? tradesOfferId,
    offers: current.offers,
    earnRules: current.earnRules,
  );
}

VentorRewardOfferData _offerFromApi(VentorRewardOfferItemModel offer) {
  final audience = offer.audience;
  return VentorRewardOfferData(
    id: offer.id.trim(),
    kind: _kindFromApi(offer.kind),
    pointsCost: offer.points_cost,
    percentOff: offer.percent_off,
    freeMinutes: offer.free_minutes,
    isWelcomeGift: offer.is_welcome_gift,
    audience: VentorRewardAudienceData(
      minTier: _nullableId(audience?.min_tier),
      maxTier: _nullableId(audience?.max_tier),
    ),
  );
}

VentorRewardTradeData _tradeFromApi(VentorRewardTradeItemModel item) {
  return VentorRewardTradeData(
    id: item.id.trim(),
    offerId: item.offer_id.trim(),
    pointsSpent: item.points_spent,
    tradedAt: DateTime.tryParse(item.traded_at.trim()) ?? DateTime.now(),
    isWelcomeGift: item.is_welcome_gift,
  );
}

VentorRewardKind _kindFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'free_minutes' => VentorRewardKind.freeMinutes,
    'priority_match' => VentorRewardKind.priorityMatch,
    _ => VentorRewardKind.percentOff,
  };
}

String? _nullableId(String? value) {
  final trimmed = value?.trim() ?? '';
  return trimmed.isEmpty ? null : trimmed;
}
