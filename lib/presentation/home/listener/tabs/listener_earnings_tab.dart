import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_earnings.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/earnings/bloc/listener_earnings/listener_earnings_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/earnings/listener_earnings_widgets.dart'
    as earnings_ui;
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_payment_payouts_screen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerEarningsTab extends StatelessWidget {
  const ListenerEarningsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          diContainer<ListenerEarningsBloc>()
            ..add(const ListenerEarningsEvent.started()),
      child: const _ListenerEarningsTabView(),
    );
  }
}

class _ListenerEarningsTabView extends StatelessWidget {
  const _ListenerEarningsTabView();

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _ratingLabel(double rating) => rating.toStringAsFixed(1);

  String _tierName(VentingMobLocalizations l10n, ListenerEarningsTierId id) {
    return switch (id) {
      ListenerEarningsTierId.starter => l10n.listener_earnings_tier_starter,
      ListenerEarningsTierId.rising => l10n.listener_earnings_tier_rising,
      ListenerEarningsTierId.trusted => l10n.listener_earnings_tier_trusted,
      ListenerEarningsTierId.expert => l10n.listener_earnings_tier_expert,
      ListenerEarningsTierId.elite => l10n.listener_earnings_tier_elite,
    };
  }

  String _tierRequirement(
    VentingMobLocalizations l10n,
    ListenerEarningsTier tier,
  ) {
    if (tier.id == ListenerEarningsTierId.starter) {
      return l10n.listener_earnings_tier_requirement_starter;
    }
    return l10n.listener_earnings_tier_requirement(
      tier.minSessions,
      _ratingLabel(tier.minRating),
    );
  }

  List<earnings_ui.ListenerEarningsChartPoint> _chartPoints(
    ListenerEarningsOverview overview,
  ) {
    return overview.chartPoints
        .map(
          (point) => earnings_ui.ListenerEarningsChartPoint(
            label: point.label,
            amount: point.amount,
          ),
        )
        .toList(growable: false);
  }

  Future<void> _onPayoutMethods(BuildContext context) {
    return openListenerPaymentPayoutsScreen(context: context);
  }

  Widget _buildContent(
    BuildContext context,
    VentingMobLocalizations l10n,
    ListenerEarningsOverview overview, {
    required bool isProfileUnderReview,
  }) {
    final hourlyRateLabel = l10n.listener_earnings_hourly_value(
      _money(overview.currentTierHourlyRate),
    );
    final payoutMethod = overview.defaultPayoutMethod;
    final hasPaymentMethod = payoutMethod != null;

    return RefreshIndicator(
      onRefresh: () async {
        context.read<ListenerEarningsBloc>().add(
          const ListenerEarningsEvent.refreshRequested(),
        );
        await context.read<ListenerEarningsBloc>().stream.firstWhere(
          (state) => !state.isLoading,
        );
      },
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: [
          Text(
            l10n.home_tab_earnings,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          earnings_ui.ListenerEarningsSummaryCard(
            totalLabel: l10n.listener_earnings_total,
            totalValue: _money(overview.totalEarnings),
            trendLabel: l10n.listener_earnings_trend_up(
              overview.trendPercent.abs(),
            ),
            sessionsLabel: l10n.listener_earnings_sessions,
            sessionsValue: '${overview.sessions}',
            hoursLabel: l10n.listener_earnings_hours,
            hoursValue: l10n.listener_earnings_hours_value(
              overview.hours.toStringAsFixed(1),
            ),
            rateLabel: l10n.listener_earnings_rate,
            rateValue: hourlyRateLabel,
          ),
          const SizedBox(height: 14),
          earnings_ui.ListenerHourlyRateTiersCard(
            title: l10n.listener_earnings_tiers_title,
            subtitle: l10n.listener_earnings_tiers_subtitle,
            statsLabel: l10n.listener_earnings_tiers_stats(
              overview.sessions,
              _ratingLabel(overview.rating),
            ),
            yourTierLabel: l10n.listener_earnings_your_tier,
            tiers: [
              for (final tier in overview.tiers)
                earnings_ui.ListenerHourlyRateTierRowData(
                  name: _tierName(l10n, tier.id),
                  requirementLabel: _tierRequirement(l10n, tier),
                  hourlyRateLabel: l10n.listener_earnings_hourly_value(
                    _money(tier.hourlyRate),
                  ),
                  isCurrent: tier.id == overview.currentTierId,
                ),
            ],
          ),
          if (!isProfileUnderReview) ...[
            const SizedBox(height: 14),
            earnings_ui.ListenerEarningsOverviewCard(
              title: l10n.listener_earnings_overview,
              points: _chartPoints(overview),
            ),
          ],
          const SizedBox(height: 14),
          earnings_ui.ListenerPayoutMethodsCard(
            title: l10n.listener_earnings_payout_methods,
            hasPaymentMethod: hasPaymentMethod,
            methodTitle: hasPaymentMethod
                ? payoutMethod.title
                : l10n.listener_earnings_payout_empty_title,
            methodSubtitle: hasPaymentMethod
                ? payoutMethod.subtitle
                : l10n.listener_earnings_payout_empty_subtitle,
            defaultLabel: l10n.listener_earnings_default,
            emptyActionLabel: l10n.listener_earnings_payout_empty_action,
            onTap: () => _onPayoutMethods(context),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: ListenerProfileTheme.backgroundGradient,
        ),
        child: SafeArea(
          bottom: false,
          child: BlocBuilder<ListenerEarningsBloc, ListenerEarningsState>(
            builder: (context, state) {
              if (state.isLoadingOrInitial) {
                return const _ListenerEarningsShimmer();
              }

              if (state.isLoadFailure) {
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
                              .read<ListenerEarningsBloc>()
                              .add(const ListenerEarningsEvent.retryLoad()),
                          child: Text(l10n.common_retry),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final overview = state.overview;
              if (!state.isReady || overview == null) {
                return const SizedBox.shrink();
              }

              return _buildContent(
                context,
                l10n,
                overview,
                isProfileUnderReview: state.isProfileUnderReview,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _ListenerEarningsShimmer extends StatelessWidget {
  const _ListenerEarningsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
        children: const [
          _EarningsShimmerLine(width: 140, height: 24),
          SizedBox(height: 16),
          _EarningsShimmerCard(height: 176),
          SizedBox(height: 14),
          _EarningsShimmerCard(height: 292),
          SizedBox(height: 14),
          _EarningsShimmerCard(height: 236),
          SizedBox(height: 14),
          _EarningsShimmerCard(height: 88),
        ],
      ),
    );
  }
}

class _EarningsShimmerCard extends StatelessWidget {
  const _EarningsShimmerCard({required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
    );
  }
}

class _EarningsShimmerLine extends StatelessWidget {
  const _EarningsShimmerLine({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
