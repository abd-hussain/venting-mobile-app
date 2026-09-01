import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_point_packages.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/bloc/ventor_buy_points/ventor_buy_points_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/rewards/ventor_points_scope.dart';
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
      onPointsChanged: scope.onPointsChanged,
      hostContext: context,
    ),
  );
}

class _VentorBuyPointsBottomSheet extends StatefulWidget {
  const _VentorBuyPointsBottomSheet({
    required this.points,
    required this.onPointsChanged,
    required this.hostContext,
  });

  final int points;
  final ValueChanged<int> onPointsChanged;
  final BuildContext hostContext;

  @override
  State<_VentorBuyPointsBottomSheet> createState() =>
      _VentorBuyPointsBottomSheetState();
}

class _VentorBuyPointsBottomSheetState
    extends State<_VentorBuyPointsBottomSheet> {
  late final VentorBuyPointsBloc _bloc;
  String? _selectedPackageId;

  @override
  void initState() {
    super.initState();
    _bloc = diContainer<VentorBuyPointsBloc>()
      ..add(const VentorBuyPointsEvent.started());
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  void _onPurchaseSuccess(
    VentingMobLocalizations l10n,
    VentorPurchasePointsResult result,
  ) {
    widget.onPointsChanged(result.points);

    Navigator.of(context).pop();
    if (!widget.hostContext.mounted) return;

    final pointsAdded = result.purchase?.pointsAdded ?? 0;
    ScaffoldMessenger.of(widget.hostContext).showSnackBar(
      SnackBar(
        content: Text(
          l10n.ventor_points_purchase_success(formatVentorPoints(pointsAdded)),
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
    return BlocProvider.value(
      value: _bloc,
      child: BlocListener<VentorBuyPointsBloc, VentorBuyPointsState>(
        listenWhen: (previous, current) =>
            previous.purchaseSuccess != current.purchaseSuccess ||
            previous.purchaseErrorMessage != current.purchaseErrorMessage,
        listener: (context, state) {
          final l10n = VentingMobLocalizations.of(context);
          if (state.purchaseSuccess && state.purchaseResult != null) {
            _onPurchaseSuccess(l10n, state.purchaseResult!);
            return;
          }
          if (state.purchaseErrorMessage.isNotEmpty) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.purchaseErrorMessage)));
          }
        },
        child: _VentorBuyPointsSheetBody(
          points: widget.points,
          selectedPackageId: _selectedPackageId,
          onPackageSelected: (packageId) {
            setState(() => _selectedPackageId = packageId);
          },
          onPurchase: () {
            final packageId = _selectedPackageId;
            if (packageId == null) return;
            context.read<VentorBuyPointsBloc>().add(
              VentorBuyPointsEvent.purchaseRequested(packageId: packageId),
            );
          },
        ),
      ),
    );
  }
}

class _VentorBuyPointsSheetBody extends StatelessWidget {
  const _VentorBuyPointsSheetBody({
    required this.points,
    required this.selectedPackageId,
    required this.onPackageSelected,
    required this.onPurchase,
  });

  static const _sheetFill = Color(0xFF1C1826);

  final int points;
  final String? selectedPackageId;
  final ValueChanged<String> onPackageSelected;
  final VoidCallback onPurchase;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: bottomInset + 12),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.sizeOf(context).height * 0.88,
        ),
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 16),
        decoration: BoxDecoration(
          color: _sheetFill,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: BlocBuilder<VentorBuyPointsBloc, VentorBuyPointsState>(
          builder: (context, state) {
            return Column(
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
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
                        l10n.ventor_rewards_pts(formatVentorPoints(points)),
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
                Flexible(child: _buildPackagesSection(context, l10n, state)),
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
                    onPressed:
                        selectedPackageId == null ||
                            state.isPurchasing ||
                            !state.isReady
                        ? null
                        : onPurchase,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      disabledBackgroundColor: Colors.white.withValues(
                        alpha: 0.08,
                      ),
                      foregroundColor: Colors.white,
                      disabledForegroundColor: VentorProfileTheme.muted,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: state.isPurchasing
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildPackagesSection(
    BuildContext context,
    VentingMobLocalizations l10n,
    VentorBuyPointsState state,
  ) {
    if (state.isLoadingOrInitial) {
      return const _VentorBuyPointsShimmer();
    }

    if (state.isLoadFailure) {
      return _VentorBuyPointsError(
        message: state.errorMessage,
        onRetry: () => context.read<VentorBuyPointsBloc>().add(
          const VentorBuyPointsEvent.retryLoad(),
        ),
      );
    }

    if (state.packages.isEmpty) {
      return _VentorBuyPointsError(
        message: l10n.common_unknown_error,
        onRetry: () => context.read<VentorBuyPointsBloc>().add(
          const VentorBuyPointsEvent.retryLoad(),
        ),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      itemCount: state.packages.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final package = state.packages[index];
        return _PointPackageTile(
          package: package,
          selected: selectedPackageId == package.id,
          priceLabel: l10n.ventor_points_package_price(
            package.priceUsd.toStringAsFixed(2),
          ),
          pointsLabel: l10n.ventor_rewards_pts(
            formatVentorPoints(package.points),
          ),
          bonusLabel: package.bonusPercent == null
              ? null
              : l10n.ventor_points_package_bonus(package.bonusPercent!),
          onTap: () => onPackageSelected(package.id),
        );
      },
    );
  }
}

class _VentorBuyPointsError extends StatelessWidget {
  const _VentorBuyPointsError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          TextButton(onPressed: onRetry, child: Text(l10n.common_retry)),
        ],
      ),
    );
  }
}

class _VentorBuyPointsShimmer extends StatelessWidget {
  const _VentorBuyPointsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFF2A2438),
      highlightColor: const Color(0xFF3A3348),
      child: Column(
        children: [
          for (var i = 0; i < 3; i++) ...[
            if (i > 0) const SizedBox(height: 10),
            Container(
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFF15101F),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ],
        ],
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

  final VentorPointPackageData package;
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
