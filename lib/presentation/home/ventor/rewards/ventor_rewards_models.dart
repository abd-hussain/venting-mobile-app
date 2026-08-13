import 'package:venting_mobile_app/presentation/home/listener/earnings/listener_earnings_tiers.dart';

enum VentorRewardOfferKind { percentOff, freeMinutes, priorityMatch }

enum VentorInviteStatus { pending, joined, firstSession, bookedCall }

/// Who an offer applies to. Null [minTier] means any listener.
class VentorRewardAudience {
  const VentorRewardAudience({this.minTier, this.maxTier});

  final ListenerEarningsTierId? minTier;
  final ListenerEarningsTierId? maxTier;

  bool get isAnyListener => minTier == null && maxTier == null;
}

class VentorRewardOffer {
  const VentorRewardOffer({
    required this.id,
    required this.kind,
    required this.pointsCost,
    required this.audience,
    this.percentOff,
    this.freeMinutes,
    this.isWelcomeGift = false,
  });

  final String id;
  final VentorRewardOfferKind kind;
  final int pointsCost;
  final VentorRewardAudience audience;
  final int? percentOff;
  final int? freeMinutes;
  final bool isWelcomeGift;
}

class VentorInviteHistoryItem {
  const VentorInviteHistoryItem({
    required this.id,
    required this.name,
    required this.status,
    required this.pointsEarned,
  });

  final String id;
  final String name;
  final VentorInviteStatus status;
  final int pointsEarned;
}

class VentorRewardTrade {
  const VentorRewardTrade({
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

/// Mock catalog: session discounts vary by listener hourly-rate tier.
abstract final class VentorRewardsCatalog {
  static const pointsPerSession = 20;
  static const pointsPerFriendRegister = 25;
  static const pointsPerInviteFirstSession = 50;
  static const pointsPerFriendBooking = 25;

  static const mockPoints = 1250;
  static const mockCompletedSessions = 12;
  static const mockInviteCode = 'VENT1234';
  static const mockInviteLink = 'https://venting.app/invite/VENT1234';
  static const mockActiveOfferId = 'off_20_any';

  static const offers = <VentorRewardOffer>[
    VentorRewardOffer(
      id: 'welcome_50',
      kind: VentorRewardOfferKind.percentOff,
      pointsCost: 0,
      percentOff: 50,
      audience: VentorRewardAudience(),
      isWelcomeGift: true,
    ),
    VentorRewardOffer(
      id: 'off_10_any',
      kind: VentorRewardOfferKind.percentOff,
      pointsCost: 500,
      percentOff: 10,
      audience: VentorRewardAudience(),
    ),
    VentorRewardOffer(
      id: 'off_20_any',
      kind: VentorRewardOfferKind.percentOff,
      pointsCost: 1000,
      percentOff: 20,
      audience: VentorRewardAudience(),
    ),
    VentorRewardOffer(
      id: 'off_30_trusted',
      kind: VentorRewardOfferKind.percentOff,
      pointsCost: 1500,
      percentOff: 30,
      audience: VentorRewardAudience(minTier: ListenerEarningsTierId.trusted),
    ),
    VentorRewardOffer(
      id: 'off_50_elite',
      kind: VentorRewardOfferKind.percentOff,
      pointsCost: 2000,
      percentOff: 50,
      audience: VentorRewardAudience(minTier: ListenerEarningsTierId.elite),
    ),
    VentorRewardOffer(
      id: 'free_15_rising',
      kind: VentorRewardOfferKind.freeMinutes,
      pointsCost: 1800,
      freeMinutes: 15,
      audience: VentorRewardAudience(
        minTier: ListenerEarningsTierId.starter,
        maxTier: ListenerEarningsTierId.rising,
      ),
    ),
    VentorRewardOffer(
      id: 'priority_any',
      kind: VentorRewardOfferKind.priorityMatch,
      pointsCost: 2200,
      audience: VentorRewardAudience(),
    ),
  ];

  static const mockInvites = <VentorInviteHistoryItem>[
    VentorInviteHistoryItem(
      id: 'i1',
      name: 'Maya R.',
      status: VentorInviteStatus.firstSession,
      pointsEarned: 75,
    ),
    VentorInviteHistoryItem(
      id: 'i2',
      name: 'Omar H.',
      status: VentorInviteStatus.joined,
      pointsEarned: 25,
    ),
    VentorInviteHistoryItem(
      id: 'i3',
      name: 'Sara K.',
      status: VentorInviteStatus.joined,
      pointsEarned: 0,
    ),
    VentorInviteHistoryItem(
      id: 'i4',
      name: 'Lina W.',
      status: VentorInviteStatus.pending,
      pointsEarned: 0,
    ),
  ];

  static int get mockTotalInvited => mockInvites.length;

  static int get mockInvitePointsEarned =>
      mockInvites.fold(0, (sum, item) => sum + item.pointsEarned);

  static List<VentorRewardTrade> mockTrades() {
    final now = DateTime.now();
    return [
      VentorRewardTrade(
        id: 't1',
        offerId: 'off_20_any',
        pointsSpent: 1000,
        tradedAt: now.subtract(const Duration(days: 2)),
      ),
      VentorRewardTrade(
        id: 't2',
        offerId: 'off_10_any',
        pointsSpent: 500,
        tradedAt: now.subtract(const Duration(days: 18)),
      ),
      VentorRewardTrade(
        id: 't3',
        offerId: 'welcome_50',
        pointsSpent: 0,
        tradedAt: now.subtract(const Duration(days: 40)),
        isWelcomeGift: true,
      ),
    ];
  }

  static VentorRewardOffer? offerById(String id) {
    for (final offer in offers) {
      if (offer.id == id) return offer;
    }
    return null;
  }
}
