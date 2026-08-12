import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/earnings/listener_earnings_widgets.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/listener_payment_payouts_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/payout_history_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerEarningsTab extends StatefulWidget {
  const ListenerEarningsTab({super.key});

  @override
  State<ListenerEarningsTab> createState() => _ListenerEarningsTabState();
}

class _ListenerEarningsTabState extends State<ListenerEarningsTab> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  // TODO: Load earnings summary from listener earnings API / repository.
  static const _totalEarnings = 342.60;
  static const _trendPercent = 18;
  static const _sessions = 24;
  static const _hours = 18.5;
  static const _ratePerSession = 18.50;

  // TODO: Load chart series from listener earnings API.
  static const _chartPoints = <ListenerEarningsChartPoint>[
    ListenerEarningsChartPoint(label: 'May 5', amount: 72),
    ListenerEarningsChartPoint(label: 'May 12', amount: 118),
    ListenerEarningsChartPoint(label: 'May 19', amount: 95),
    ListenerEarningsChartPoint(label: 'May 26', amount: 142),
  ];

  // TODO: Load most recent payout from payout history API.
  static final _recentPayout = ListenerPayoutHistoryItem(
    id: '1',
    amount: 210.40,
    date: DateTime(2024, 5, 15),
    status: ListenerPayoutStatus.completed,
    methodLabel: 'PayPal',
    reference: 'PO-10482',
  );

  // TODO: Load default payout method from API.
  static const _payoutMethodTitle = 'PayPal';
  static const _payoutMethodSubtitle = 'lina.listener@gmail.com';

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _dateLabel(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Future<void> _onRecentPayout() {
    return showPayoutHistoryBottomSheet(
      context: context,
      items: [_recentPayout],
    );
  }

  Future<void> _onPayoutMethods() {
    return openListenerPaymentPayoutsScreen(context: context);
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
          child: ListView(
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
              ListenerEarningsSummaryCard(
                totalLabel: l10n.listener_earnings_total,
                totalValue: _money(_totalEarnings),
                trendLabel: l10n.listener_earnings_trend_up(_trendPercent),
                sessionsLabel: l10n.listener_earnings_sessions,
                sessionsValue: '$_sessions',
                hoursLabel: l10n.listener_earnings_hours,
                hoursValue: l10n.listener_earnings_hours_value(
                  _hours.toStringAsFixed(1),
                ),
                rateLabel: l10n.listener_earnings_rate,
                rateValue: _money(_ratePerSession),
              ),
              const SizedBox(height: 14),
              ListenerEarningsOverviewCard(
                title: l10n.listener_earnings_overview,
                points: _chartPoints,
              ),
              const SizedBox(height: 14),
              ListenerRecentPayoutCard(
                title: l10n.listener_earnings_recent_payout,
                dateLabel: _dateLabel(_recentPayout.date),
                amountLabel: _money(_recentPayout.amount),
                statusLabel: l10n.listener_earnings_status_paid,
                onTap: _onRecentPayout,
              ),
              const SizedBox(height: 14),
              ListenerPayoutMethodsCard(
                title: l10n.listener_earnings_payout_methods,
                methodTitle: _payoutMethodTitle,
                methodSubtitle: _payoutMethodSubtitle,
                defaultLabel: l10n.listener_earnings_default,
                onTap: _onPayoutMethods,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
