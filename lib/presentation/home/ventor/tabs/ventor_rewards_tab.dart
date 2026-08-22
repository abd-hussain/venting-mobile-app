import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_buy_points_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_earn_points_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_points_scope.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_trade_history_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum _RewardsSection { available, history }

//TODO: the offer here should be studies will , this is wrong

class VentorRewardsTab extends StatefulWidget {
  const VentorRewardsTab({super.key});

  @override
  State<VentorRewardsTab> createState() => _VentorRewardsTabState();
}

class _VentorRewardsTabState extends State<VentorRewardsTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Load redeemed offers and first-session gift from rewards API (#63).
  var _activeOfferId = VentorRewardsCatalog.mockActiveOfferId;
  var _welcomeGiftUsed = true;
  var _section = _RewardsSection.available;
  late List<VentorRewardTrade> _trades;

  @override
  void initState() {
    super.initState();
    _trades = VentorRewardsCatalog.mockTrades();
  }

  VentorRewardOffer? get _activeOffer {
    for (final offer in VentorRewardsCatalog.offers) {
      if (offer.id == _activeOfferId) return offer;
    }
    return null;
  }

  String _costLabel(VentingMobLocalizations l10n, VentorRewardOffer offer) {
    if (offer.isWelcomeGift) {
      return _welcomeGiftUsed
          ? l10n.ventor_rewards_used
          : l10n.ventor_rewards_unlocked;
    }
    if (offer.id == _activeOfferId) return l10n.ventor_rewards_active;
    return l10n.ventor_rewards_pts(formatVentorPoints(offer.pointsCost));
  }

  void _recordTrade(VentorRewardOffer offer) {
    _trades = [
      VentorRewardTrade(
        id: 't_${DateTime.now().millisecondsSinceEpoch}',
        offerId: offer.id,
        pointsSpent: offer.pointsCost,
        tradedAt: DateTime.now(),
        isWelcomeGift: offer.isWelcomeGift,
      ),
      ..._trades,
    ];
  }

  void _onOfferTap(VentorRewardOffer offer) {
    final l10n = VentingMobLocalizations.of(context);

    if (offer.isWelcomeGift) {
      if (_welcomeGiftUsed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.ventor_rewards_welcome_used)),
        );
        return;
      }
      setState(() {
        _welcomeGiftUsed = true;
        _activeOfferId = offer.id;
        _recordTrade(offer);
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.ventor_rewards_redeemed)));
      return;
    }

    if (offer.id == _activeOfferId) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.ventor_rewards_already_active)),
      );
      return;
    }

    final scope = VentorPointsScope.of(context);
    if (scope.points < offer.pointsCost) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.ventor_rewards_not_enough)));
      return;
    }

    // TODO: Redeem offer via rewards API (#64).
    if (!scope.spendPoints(offer.pointsCost)) return;
    setState(() {
      _activeOfferId = offer.id;
      _recordTrade(offer);
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.ventor_rewards_redeemed)));
  }

  List<Widget> _availableChildren(VentingMobLocalizations l10n) {
    final active = _activeOffer;
    final catalogOffers = VentorRewardsCatalog.offers
        .where((offer) => !offer.isWelcomeGift)
        .toList();

    final points = VentorPointsScope.of(context).points;

    return [
      VentorEarnMorePointsButton(
        label: l10n.ventor_points_buy_cta,
        onTap: () => showVentorBuyPointsBottomSheet(context: context),
      ),
      const SizedBox(height: 10),
      VentorEarnMorePointsButton(
        label: l10n.ventor_rewards_earn_more,
        onTap: () => showVentorEarnPointsBottomSheet(context: context),
      ),
      const SizedBox(height: 14),
      VentorWelcomeGiftCard(
        title: l10n.ventor_rewards_welcome_title,
        message: l10n.ventor_rewards_first_call_gift,
        badgeLabel: _welcomeGiftUsed
            ? l10n.ventor_rewards_used
            : l10n.ventor_rewards_unlocked,
        isUsed: _welcomeGiftUsed,
        onTap: () {
          final welcome = VentorRewardsCatalog.offers.firstWhere(
            (offer) => offer.isWelcomeGift,
          );
          _onOfferTap(welcome);
        },
      ),
      if (active != null && !active.isWelcomeGift) ...[
        const SizedBox(height: 14),
        VentorActiveRewardCard(
          message: ventorActiveRewardMessage(l10n, active),
        ),
      ],
      const SizedBox(height: 20),
      Text(
        l10n.ventor_rewards_available,
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
      const SizedBox(height: 12),
      for (var i = 0; i < catalogOffers.length; i++) ...[
        if (i > 0) const SizedBox(height: 10),
        VentorRewardOfferTile(
          title: ventorRewardTitle(l10n, catalogOffers[i]),
          subtitle: ventorRewardSubtitle(l10n, catalogOffers[i]),
          costLabel: _costLabel(l10n, catalogOffers[i]),
          icon: ventorRewardIcon(catalogOffers[i]),
          isActive: catalogOffers[i].id == _activeOfferId,
          canAfford: points >= catalogOffers[i].pointsCost,
          isUsedGift: false,
          onTap: () => _onOfferTap(catalogOffers[i]),
        ),
      ],
    ];
  }

  List<Widget> _historyChildren(VentingMobLocalizations l10n) {
    if (_trades.isEmpty) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Text(
            l10n.ventor_rewards_trade_empty,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 14,
            ),
          ),
        ),
      ];
    }

    return [
      for (var i = 0; i < _trades.length; i++) ...[
        if (i > 0) const SizedBox(height: 10),
        ventorTradeHistoryTileFor(l10n: l10n, trade: _trades[i]),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final points = VentorPointsScope.of(context).points;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: VentorProfileTheme.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
            children: [
              VentorRewardsHeader(
                title: l10n.ventor_rewards_title,
                subtitle: l10n.ventor_rewards_subtitle,
                pointsLabel: l10n.ventor_rewards_pts(
                  formatVentorPoints(points),
                ),
              ),
              const SizedBox(height: 16),
              VentorRewardsSectionTabs(
                availableSelected: _section == _RewardsSection.available,
                availableLabel: l10n.ventor_rewards_tab_available,
                historyLabel: l10n.ventor_rewards_tab_history,
                onAvailable: () =>
                    setState(() => _section = _RewardsSection.available),
                onHistory: () =>
                    setState(() => _section = _RewardsSection.history),
              ),
              const SizedBox(height: 16),
              if (_section == _RewardsSection.available)
                ..._availableChildren(l10n)
              else
                ..._historyChildren(l10n),
            ],
          ),
        ),
      ),
    );
  }
}
