import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<void> openVentorTradeHistoryScreen({
  required BuildContext context,
  required List<VentorRewardTrade> trades,
}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => VentorTradeHistoryScreen(trades: trades)),
  );
}

class VentorTradeHistoryScreen extends StatelessWidget {
  const VentorTradeHistoryScreen({super.key, required this.trades});

  final List<VentorRewardTrade> trades;

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        appBar: AppBar(
          backgroundColor: SplashColors.backgroundBottom,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.ventor_rewards_trade_history,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: trades.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    l10n.ventor_rewards_trade_empty,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: VentorProfileTheme.muted,
                      fontSize: 14,
                    ),
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
                itemCount: trades.length,
                separatorBuilder: (_, _) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return ventorTradeHistoryTileFor(
                    l10n: l10n,
                    trade: trades[index],
                  );
                },
              ),
      ),
    );
  }
}

Widget ventorTradeHistoryTileFor({
  required VentingMobLocalizations l10n,
  required VentorRewardTrade trade,
  VentorRewardOffer? Function(String offerId)? offerForId,
}) {
  final offer =
      offerForId?.call(trade.offerId) ??
      VentorRewardsCatalog.offerById(trade.offerId);
  final title = offer == null
      ? l10n.ventor_rewards_trade_unknown
      : ventorRewardTitle(l10n, offer);
  final audience = offer == null
      ? l10n.ventor_rewards_audience_any
      : ventorRewardSubtitle(l10n, offer);
  final dateLabel = ventorTradeDateLabel(trade.tradedAt);
  final pointsLabel = trade.pointsSpent == 0
      ? l10n.ventor_rewards_unlocked
      : '-${l10n.ventor_rewards_pts(formatVentorPoints(trade.pointsSpent))}';

  return VentorTradeHistoryTile(
    title: title,
    subtitle: '$audience · $dateLabel',
    pointsLabel: pointsLabel,
    icon: offer == null ? Icons.history_rounded : ventorRewardIcon(offer),
  );
}

String ventorTradeDateLabel(DateTime date) {
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
