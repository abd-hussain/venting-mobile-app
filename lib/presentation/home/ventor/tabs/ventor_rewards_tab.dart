import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_rewards.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/bloc/ventor_rewards/ventor_rewards_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_buy_points_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_earn_points_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_points_scope.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_trade_history_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum _RewardsSection { available, history }

class VentorRewardsTab extends StatefulWidget {
  const VentorRewardsTab({super.key});

  @override
  State<VentorRewardsTab> createState() => VentorRewardsTabState();
}

class VentorRewardsTabState extends State<VentorRewardsTab> {
  late final VentorRewardsBloc _bloc;
  var _section = _RewardsSection.available;

  @override
  void initState() {
    super.initState();
    _bloc = diContainer<VentorRewardsBloc>();
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void onTabOpened() {
    _bloc.add(const VentorRewardsEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: _VentorRewardsTabView(
        section: _section,
        onSectionChanged: (section) => setState(() => _section = section),
      ),
    );
  }
}

class _VentorRewardsTabView extends StatelessWidget {
  const _VentorRewardsTabView({
    required this.section,
    required this.onSectionChanged,
  });

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  final _RewardsSection section;
  final ValueChanged<_RewardsSection> onSectionChanged;

  void _onHistorySelected(BuildContext context) {
    onSectionChanged(_RewardsSection.history);
    context.read<VentorRewardsBloc>().add(
      const VentorRewardsEvent.historyTabOpened(),
    );
  }

  String _costLabel(
    VentingMobLocalizations l10n, {
    required VentorRewardOffer offer,
    required String? activeOfferId,
    required bool welcomeGiftClaimed,
  }) {
    if (offer.isWelcomeGift) {
      return welcomeGiftClaimed
          ? l10n.ventor_rewards_used
          : l10n.ventor_rewards_unlocked;
    }
    if (offer.id == activeOfferId) return l10n.ventor_rewards_active;
    return l10n.ventor_rewards_pts(formatVentorPoints(offer.pointsCost));
  }

  void _onOfferTap(
    BuildContext context,
    VentorRewardOffer offer,
    VentorRewardsState state,
  ) {
    final l10n = VentingMobLocalizations.of(context);
    final overview = state.rewards;
    if (overview == null || state.isRedeeming) return;

    if (offer.isWelcomeGift) {
      if (overview.welcomeGiftClaimed) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.ventor_rewards_welcome_used)),
        );
        return;
      }
    } else if (offer.id == overview.activeOfferId) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.ventor_rewards_already_active)),
      );
      return;
    } else if (overview.points < offer.pointsCost) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.ventor_rewards_not_enough)));
      return;
    }

    context.read<VentorRewardsBloc>().add(
      VentorRewardsEvent.redeemRequested(offerId: offer.id),
    );
  }

  VentorRewardOffer? _activeOffer(
    VentorRewardsOverviewData overview,
    Map<String, VentorRewardOffer> offersById,
  ) {
    final activeId = overview.activeOfferId;
    if (activeId == null || activeId.isEmpty) return null;
    return offersById[activeId];
  }

  VentorRewardOffer? _welcomeOffer(List<VentorRewardOffer> offers) {
    for (final offer in offers) {
      if (offer.isWelcomeGift) return offer;
    }
    return null;
  }

  List<Widget> _availableChildren({
    required BuildContext context,
    required VentingMobLocalizations l10n,
    required VentorRewardsOverviewData overview,
    required Map<String, VentorRewardOffer> offersById,
    required VentorRewardsState state,
    required bool isRedeeming,
  }) {
    final offers = overview.offers.map(ventorRewardOfferFromData).toList();
    final welcome = _welcomeOffer(offers);
    final active = _activeOffer(overview, offersById);
    final catalogOffers = offers
        .where((offer) => !offer.isWelcomeGift)
        .toList();
    final points = overview.points;

    return [
      VentorEarnMorePointsButton(
        label: l10n.ventor_points_buy_cta,
        onTap: isRedeeming
            ? () {}
            : () => showVentorBuyPointsBottomSheet(context: context),
      ),
      const SizedBox(height: 10),
      VentorEarnMorePointsButton(
        label: l10n.ventor_rewards_earn_more,
        onTap: isRedeeming
            ? () {}
            : () => showVentorEarnPointsBottomSheet(
                context: context,
                earnRules: overview.earnRules,
              ),
      ),
      if (welcome != null) ...[
        const SizedBox(height: 14),
        VentorWelcomeGiftCard(
          title: l10n.ventor_rewards_welcome_title,
          message: l10n.ventor_rewards_first_call_gift,
          badgeLabel: overview.welcomeGiftClaimed
              ? l10n.ventor_rewards_used
              : l10n.ventor_rewards_unlocked,
          isUsed: overview.welcomeGiftClaimed,
          onTap: isRedeeming
              ? () {}
              : () => _onOfferTap(context, welcome, state),
        ),
      ],
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
          costLabel: _costLabel(
            l10n,
            offer: catalogOffers[i],
            activeOfferId: overview.activeOfferId,
            welcomeGiftClaimed: overview.welcomeGiftClaimed,
          ),
          icon: ventorRewardIcon(catalogOffers[i]),
          isActive: catalogOffers[i].id == overview.activeOfferId,
          canAfford: points >= catalogOffers[i].pointsCost,
          isUsedGift: false,
          onTap: isRedeeming
              ? () {}
              : () => _onOfferTap(context, catalogOffers[i], state),
        ),
      ],
    ];
  }

  List<Widget> _historyChildren({
    required VentingMobLocalizations l10n,
    required VentorRewardsState state,
    required Map<String, VentorRewardOffer> offersById,
    required VoidCallback onRetry,
  }) {
    if (state.isHistoryLoading) {
      return const [_VentorRewardsHistoryShimmer()];
    }

    if (state.isHistoryLoadFailure) {
      return [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              Text(
                state.historyErrorMessage.isNotEmpty
                    ? state.historyErrorMessage
                    : l10n.common_unknown_error,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 16),
              FilledButton(onPressed: onRetry, child: Text(l10n.common_retry)),
            ],
          ),
        ),
      ];
    }

    final trades = state.trades.map(ventorRewardTradeFromData).toList();
    if (trades.isEmpty) {
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
      for (var i = 0; i < trades.length; i++) ...[
        if (i > 0) const SizedBox(height: 10),
        ventorTradeHistoryTileFor(
          l10n: l10n,
          trade: trades[i],
          offerForId: (offerId) => offersById[offerId],
        ),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: VentorProfileTheme.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: BlocConsumer<VentorRewardsBloc, VentorRewardsState>(
            listenWhen: (previous, current) =>
                previous.rewards?.points != current.rewards?.points ||
                (!previous.redeemSuccess && current.redeemSuccess) ||
                (previous.errorMessage != current.errorMessage &&
                    current.errorMessage.isNotEmpty &&
                    !current.isRedeeming),
            listener: (context, state) {
              final points = state.rewards?.points;
              if (points != null) {
                VentorPointsScope.of(context).onPointsChanged(points);
              }

              if (state.errorMessage.isNotEmpty && !state.isRedeeming) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.errorMessage),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                return;
              }

              if (state.redeemSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(l10n.ventor_rewards_redeemed),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            builder: (context, state) {
              if (state.isRewardsLoadingOrInitial) {
                return const _VentorRewardsShimmer();
              }

              if (state.isRewardsLoadFailure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.errorMessage.isNotEmpty
                              ? state.errorMessage
                              : l10n.common_unknown_error,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => context
                              .read<VentorRewardsBloc>()
                              .add(const VentorRewardsEvent.retryLoad()),
                          child: Text(l10n.common_retry),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final overview = state.rewards;
              if (!state.isRewardsReady || overview == null) {
                return const SizedBox.shrink();
              }

              final offersById = ventorRewardOffersById(overview.offers);
              final points = overview.points;

              return Stack(
                children: [
                  ListView(
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
                        availableSelected: section == _RewardsSection.available,
                        availableLabel: l10n.ventor_rewards_tab_available,
                        historyLabel: l10n.ventor_rewards_tab_history,
                        onAvailable: () =>
                            onSectionChanged(_RewardsSection.available),
                        onHistory: () => _onHistorySelected(context),
                      ),
                      const SizedBox(height: 16),
                      if (section == _RewardsSection.available)
                        ..._availableChildren(
                          context: context,
                          l10n: l10n,
                          overview: overview,
                          offersById: offersById,
                          state: state,
                          isRedeeming: state.isRedeeming,
                        )
                      else
                        ..._historyChildren(
                          l10n: l10n,
                          state: state,
                          offersById: offersById,
                          onRetry: () => context.read<VentorRewardsBloc>().add(
                            const VentorRewardsEvent.retryHistoryLoad(),
                          ),
                        ),
                    ],
                  ),
                  if (state.isRedeeming)
                    const Positioned.fill(
                      child: ColoredBox(
                        color: Color(0x33000000),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: SplashColors.purpleMid,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _VentorRewardsShimmer extends StatelessWidget {
  const _VentorRewardsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: const [
          _RewardsShimmerLine(width: 180, height: 28),
          SizedBox(height: 8),
          _RewardsShimmerLine(width: 240, height: 14),
          SizedBox(height: 10),
          _RewardsShimmerLine(width: 120, height: 18),
          SizedBox(height: 16),
          _RewardsShimmerCard(height: 44),
          SizedBox(height: 16),
          _RewardsShimmerCard(height: 52),
          SizedBox(height: 10),
          _RewardsShimmerCard(height: 52),
          SizedBox(height: 14),
          _RewardsShimmerCard(height: 120),
          SizedBox(height: 20),
          _RewardsShimmerLine(width: 140, height: 16),
          SizedBox(height: 12),
          _RewardsShimmerCard(height: 88),
          SizedBox(height: 10),
          _RewardsShimmerCard(height: 88),
          SizedBox(height: 10),
          _RewardsShimmerCard(height: 88),
        ],
      ),
    );
  }
}

class _VentorRewardsHistoryShimmer extends StatelessWidget {
  const _VentorRewardsHistoryShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: const Column(
        children: const [
          _RewardsShimmerCard(height: 76),
          SizedBox(height: 10),
          _RewardsShimmerCard(height: 76),
          SizedBox(height: 10),
          _RewardsShimmerCard(height: 76),
        ],
      ),
    );
  }
}

class _RewardsShimmerCard extends StatelessWidget {
  const _RewardsShimmerCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}

class _RewardsShimmerLine extends StatelessWidget {
  const _RewardsShimmerLine({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
