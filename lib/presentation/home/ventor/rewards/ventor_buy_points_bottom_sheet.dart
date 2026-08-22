import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_points_scope.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_rewards_widgets.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<void> showVentorBuyPointsBottomSheet({required BuildContext context}) {
  final scope = VentorPointsScope.of(context);

  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (_) => _VentorBuyPointsBottomSheet(
      points: scope.points,
      onAddPoints: scope.addPoints,
      hostContext: context,
    ),
  );
}

class _VentorBuyPointsBottomSheet extends StatefulWidget {
  const _VentorBuyPointsBottomSheet({
    required this.points,
    required this.onAddPoints,
    required this.hostContext,
  });

  final int points;
  final ValueChanged<int> onAddPoints;
  final BuildContext hostContext;

  @override
  State<_VentorBuyPointsBottomSheet> createState() =>
      _VentorBuyPointsBottomSheetState();
}

class _VentorBuyPointsBottomSheetState
    extends State<_VentorBuyPointsBottomSheet> {
  static const _sheetFill = Color(0xFF1C1826);

  String? _selectedPackageId;
  var _purchasing = false;

  Future<void> _purchase(VentingMobLocalizations l10n) async {
    final package = VentorRewardsCatalog.packageById(_selectedPackageId ?? '');
    if (package == null || _purchasing) return;

    setState(() => _purchasing = true);

    // TODO: POST /v1/ventors/me/rewards/purchase-points via payment provider.
    await Future<void>.delayed(const Duration(milliseconds: 900));
    if (!mounted) return;

    widget.onAddPoints(package.points);
    setState(() => _purchasing = false);

    if (!mounted) return;
    Navigator.of(context).pop();
    if (!widget.hostContext.mounted) return;
    ScaffoldMessenger.of(widget.hostContext).showSnackBar(
      SnackBar(
        content: Text(
          l10n.ventor_points_purchase_success(
            formatVentorPoints(package.points),
          ),
        ),
        behavior: SnackBarBehavior.floating,
        action: SnackBarAction(
          label: l10n.ventor_points_purchase_redeem_cta,
          onPressed: () => VentorHomeShell.goToTab(
            widget.hostContext,
            VentorHomeShell.rewardsTab,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final packages = VentorRewardsCatalog.pointPackages;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
        decoration: BoxDecoration(
          color: _sheetFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(999),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              l10n.ventor_points_buy_title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.ventor_points_buy_subtitle,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xFF15101F),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: VentorProfileTheme.cardBorder),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.account_balance_wallet_outlined,
                    color: VentorProfileTheme.gold,
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    l10n.ventor_rewards_pts(formatVentorPoints(widget.points)),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            for (final package in packages) ...[
              _PointPackageTile(
                package: package,
                selected: _selectedPackageId == package.id,
                priceLabel: l10n.ventor_points_package_price(
                  package.priceUsd.toStringAsFixed(2),
                ),
                pointsLabel: l10n.ventor_rewards_pts(
                  formatVentorPoints(package.points),
                ),
                bonusLabel: package.bonusPercent == null
                    ? null
                    : l10n.ventor_points_package_bonus(package.bonusPercent!),
                onTap: () => setState(() => _selectedPackageId = package.id),
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 6),
            Text(
              l10n.ventor_points_buy_example,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 12,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: _selectedPackageId == null || _purchasing
                    ? null
                    : () => _purchase(l10n),
                style: FilledButton.styleFrom(
                  backgroundColor: SplashColors.purpleMid,
                  disabledBackgroundColor: Colors.white.withValues(alpha: 0.08),
                  foregroundColor: Colors.white,
                  disabledForegroundColor: VentorProfileTheme.muted,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: _purchasing
                    ? const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        l10n.ventor_points_buy_cta,
                        style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PointPackageTile extends StatelessWidget {
  const _PointPackageTile({
    required this.package,
    required this.selected,
    required this.priceLabel,
    required this.pointsLabel,
    required this.onTap,
    this.bonusLabel,
  });

  final VentorPointPackage package;
  final bool selected;
  final String priceLabel;
  final String pointsLabel;
  final String? bonusLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.14)
          : const Color(0xFF15101F),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
              width: selected ? 1.5 : 1,
            ),
          ),
          child: Row(
            children: [
              Icon(
                selected
                    ? Icons.radio_button_checked_rounded
                    : Icons.radio_button_off_rounded,
                color: selected
                    ? SplashColors.purpleMid
                    : VentorProfileTheme.muted,
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          pointsLabel,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (bonusLabel != null) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: VentorProfileTheme.gold.withValues(
                                alpha: 0.18,
                              ),
                              borderRadius: BorderRadius.circular(999),
                            ),
                            child: Text(
                              bonusLabel!,
                              style: GoogleFonts.inter(
                                color: VentorProfileTheme.gold,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      priceLabel,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
