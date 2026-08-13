import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/earnings/listener_earnings_tiers.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

String formatVentorPoints(int value) {
  final raw = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < raw.length; i++) {
    final remaining = raw.length - i;
    if (i != 0 && remaining % 3 == 0) buffer.write(',');
    buffer.write(raw[i]);
  }
  return buffer.toString();
}

String ventorRewardTierLabel(
  VentingMobLocalizations l10n,
  ListenerEarningsTierId id,
) {
  return switch (id) {
    ListenerEarningsTierId.starter => l10n.listener_earnings_tier_starter,
    ListenerEarningsTierId.rising => l10n.listener_earnings_tier_rising,
    ListenerEarningsTierId.trusted => l10n.listener_earnings_tier_trusted,
    ListenerEarningsTierId.expert => l10n.listener_earnings_tier_expert,
    ListenerEarningsTierId.elite => l10n.listener_earnings_tier_elite,
  };
}

String ventorRewardAudienceLabel(
  VentingMobLocalizations l10n,
  VentorRewardAudience audience,
) {
  if (audience.isAnyListener) return l10n.ventor_rewards_audience_any;
  if (audience.minTier == ListenerEarningsTierId.elite) {
    return l10n.ventor_rewards_audience_elite;
  }
  if (audience.minTier == ListenerEarningsTierId.trusted &&
      audience.maxTier == null) {
    return l10n.ventor_rewards_audience_trusted_up;
  }
  if (audience.minTier == ListenerEarningsTierId.starter &&
      audience.maxTier == ListenerEarningsTierId.rising) {
    return l10n.ventor_rewards_audience_starter_rising;
  }
  if (audience.minTier != null) {
    return l10n.ventor_rewards_audience_min_tier(
      ventorRewardTierLabel(l10n, audience.minTier!),
    );
  }
  return l10n.ventor_rewards_audience_any;
}

String ventorRewardTitle(
  VentingMobLocalizations l10n,
  VentorRewardOffer offer,
) {
  return switch (offer.kind) {
    VentorRewardOfferKind.percentOff => l10n.ventor_rewards_offer_percent(
      offer.percentOff ?? 0,
    ),
    VentorRewardOfferKind.freeMinutes => l10n.ventor_rewards_offer_free_minutes(
      offer.freeMinutes ?? 0,
    ),
    VentorRewardOfferKind.priorityMatch => l10n.ventor_rewards_offer_priority,
  };
}

String ventorRewardSubtitle(
  VentingMobLocalizations l10n,
  VentorRewardOffer offer,
) {
  if (offer.isWelcomeGift) return l10n.ventor_rewards_offer_welcome_subtitle;
  return ventorRewardAudienceLabel(l10n, offer.audience);
}

String ventorActiveRewardMessage(
  VentingMobLocalizations l10n,
  VentorRewardOffer offer,
) {
  return switch (offer.kind) {
    VentorRewardOfferKind.percentOff when offer.audience.isAnyListener =>
      l10n.ventor_rewards_active_saving(offer.percentOff ?? 0),
    VentorRewardOfferKind.percentOff => l10n.ventor_rewards_active_saving_tier(
      offer.percentOff ?? 0,
      ventorRewardAudienceLabel(l10n, offer.audience),
    ),
    VentorRewardOfferKind.freeMinutes =>
      l10n.ventor_rewards_active_free_session(offer.freeMinutes ?? 0),
    VentorRewardOfferKind.priorityMatch => l10n.ventor_rewards_active_priority,
  };
}

IconData ventorRewardIcon(VentorRewardOffer offer) {
  if (offer.audience.minTier == ListenerEarningsTierId.elite) {
    return Icons.workspace_premium_rounded;
  }
  return switch (offer.kind) {
    VentorRewardOfferKind.percentOff => Icons.local_offer_rounded,
    VentorRewardOfferKind.freeMinutes => Icons.timer_outlined,
    VentorRewardOfferKind.priorityMatch => Icons.bolt_rounded,
  };
}

class VentorRewardsHeader extends StatelessWidget {
  const VentorRewardsHeader({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pointsLabel,
  });

  final String title;
  final String subtitle;
  final String pointsLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.06),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: VentorProfileTheme.cardBorder),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.monetization_on_rounded,
                size: 16,
                color: VentorProfileTheme.gold,
              ),
              const SizedBox(width: 6),
              Text(
                pointsLabel,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VentorWelcomeGiftCard extends StatelessWidget {
  const VentorWelcomeGiftCard({
    super.key,
    required this.title,
    required this.message,
    required this.badgeLabel,
    required this.isUsed,
    this.onTap,
  });

  final String title;
  final String message;
  final String badgeLabel;
  final bool isUsed;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final card = Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 14, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isUsed
              ? const [Color(0xFF3A2A58), Color(0xFF241B36)]
              : const [Color(0xFF8B5CF6), Color(0xFF5B21B6)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isUsed
              ? VentorProfileTheme.gold.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: VentorProfileTheme.gold.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    badgeLabel,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.gold,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  message,
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.card_giftcard_rounded,
              color: VentorProfileTheme.gold,
              size: 28,
            ),
          ),
        ],
      ),
    );

    if (onTap == null) return card;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: card,
      ),
    );
  }
}

class VentorActiveRewardCard extends StatelessWidget {
  const VentorActiveRewardCard({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 14, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6D4AFF), Color(0xFF4B2FD4)],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
                height: 1.35,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.confirmation_number_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}

class VentorRewardOfferTile extends StatelessWidget {
  const VentorRewardOfferTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.costLabel,
    required this.icon,
    required this.isActive,
    required this.canAfford,
    required this.isUsedGift,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String costLabel;
  final IconData icon;
  final bool isActive;
  final bool canAfford;
  final bool isUsedGift;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final borderColor = isActive
        ? SplashColors.purpleMid
        : VentorProfileTheme.cardBorder;
    final muted = !canAfford && !isActive && !isUsedGift;

    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor, width: isActive ? 1.4 : 1),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: muted
                        ? [const Color(0xFF2A2436), const Color(0xFF1C1826)]
                        : [SplashColors.purpleLight, SplashColors.purpleMid],
                  ),
                ),
                child: Icon(icon, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white.withValues(alpha: muted ? 0.55 : 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                costLabel,
                style: GoogleFonts.inter(
                  color: isActive
                      ? SplashColors.purpleMid
                      : muted
                      ? VentorProfileTheme.muted
                      : Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VentorRewardsSectionTabs extends StatelessWidget {
  const VentorRewardsSectionTabs({
    super.key,
    required this.availableSelected,
    required this.availableLabel,
    required this.historyLabel,
    required this.onAvailable,
    required this.onHistory,
  });

  final bool availableSelected;
  final String availableLabel;
  final String historyLabel;
  final VoidCallback onAvailable;
  final VoidCallback onHistory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF15101F),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: _RewardsTabChip(
              label: availableLabel,
              selected: availableSelected,
              onTap: onAvailable,
            ),
          ),
          Expanded(
            child: _RewardsTabChip(
              label: historyLabel,
              selected: !availableSelected,
              onTap: onHistory,
            ),
          ),
        ],
      ),
    );
  }
}

class _RewardsTabChip extends StatelessWidget {
  const _RewardsTabChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? SplashColors.purpleMid : Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: selected ? Colors.white : VentorProfileTheme.muted,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VentorEarnMorePointsButton extends StatelessWidget {
  const VentorEarnMorePointsButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: SplashColors.purpleMid.withValues(alpha: 0.45),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: SplashColors.purpleMid.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.star_rounded,
                  color: SplashColors.purpleMid,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withValues(alpha: 0.4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VentorTradeHistoryTile extends StatelessWidget {
  const VentorTradeHistoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.pointsLabel,
    required this.icon,
  });

  final String title;
  final String subtitle;
  final String pointsLabel;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: SplashColors.purpleMid.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: SplashColors.purpleMid, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            pointsLabel,
            style: GoogleFonts.inter(
              color: SplashColors.purpleMid,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
