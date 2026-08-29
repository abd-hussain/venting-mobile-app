import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/bloc/payment_payouts/listener_payment_payouts_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/payout_history_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/payout_methods_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the Payment & Payouts screen.
Future<void> openListenerPaymentPayoutsScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) =>
            diContainer<ListenerPaymentPayoutsBloc>()
              ..add(const ListenerPaymentPayoutsEvent.started()),
        child: const ListenerPaymentPayoutsScreen(),
      ),
    ),
  );
}

class ListenerPaymentPayoutsScreen extends StatelessWidget {
  const ListenerPaymentPayoutsScreen({super.key});

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  ListenerBankAccountInfo? _bankAccountInfo(ListenerBankAccount? account) {
    if (account == null) return null;
    return ListenerBankAccountInfo(
      accountHolderName: account.accountHolderName,
      bankName: account.bankName,
      ibanOrAccountNumber: account.ibanOrAccountNumber,
      swiftCode: account.swiftCode,
    );
  }

  String? _methodsValue(ListenerBankAccount? bank) {
    if (bank == null) return null;
    final iban = bank.ibanOrAccountNumber;
    final suffix = iban.length <= 4 ? iban : iban.substring(iban.length - 4);
    return '${bank.bankName} ••••$suffix';
  }

  Future<void> _onPayoutHistory(BuildContext context) {
    return showPayoutHistoryBottomSheet(context: context);
  }

  Future<void> _onPayoutMethods(
    BuildContext context,
    ListenerBankAccount? bankAccount,
  ) async {
    final bloc = context.read<ListenerPaymentPayoutsBloc>();

    await showPayoutMethodsBottomSheet(
      context: context,
      initial: _bankAccountInfo(bankAccount),
      onSave: (info) async {
        bloc.add(
          ListenerPaymentPayoutsEvent.updateMethodRequested(
            accountHolderName: info.accountHolderName,
            bankName: info.bankName,
            ibanOrAccountNumber: info.ibanOrAccountNumber,
            swiftCode: info.swiftCode,
          ),
        );
        await bloc.stream.firstWhere((state) => !state.isSavingMethod);
        final state = bloc.state;
        if (state.mutationErrorMessage.isNotEmpty) {
          throw Exception(state.mutationErrorMessage);
        }
      },
    );
  }

  void _onRequestPayout(
    BuildContext context,
    ListenerPaymentPayoutsState state,
  ) {
    final l10n = VentingMobLocalizations.of(context);
    final overview = state.overview;
    if (overview == null) return;

    if (overview.bankAccount == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.listener_payout_need_method)));
      return;
    }
    if (overview.balances.available <
        ListenerPaymentPayoutsBloc.minPayoutAmount) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.listener_payout_min_hint)));
      return;
    }

    context.read<ListenerPaymentPayoutsBloc>().add(
      const ListenerPaymentPayoutsEvent.requestPayoutRequested(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocConsumer<
      ListenerPaymentPayoutsBloc,
      ListenerPaymentPayoutsState
    >(
      listenWhen: (previous, current) =>
          previous.payoutRequestSucceeded != current.payoutRequestSucceeded ||
          previous.methodUpdateSucceeded != current.methodUpdateSucceeded ||
          (previous.mutationErrorMessage != current.mutationErrorMessage &&
              current.mutationErrorMessage.isNotEmpty &&
              !current.isSavingMethod &&
              !current.isRequestingPayout),
      listener: (context, state) {
        if (state.payoutRequestSucceeded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.listener_payout_request_submitted)),
          );
        } else if (state.methodUpdateSucceeded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.listener_payout_method_saved)),
          );
        } else if (state.mutationErrorMessage.isNotEmpty) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.mutationErrorMessage)));
        }
      },
      builder: (context, state) {
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
                l10n.listener_profile_payment_payouts,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: SafeArea(child: _buildBody(context, l10n, state)),
          ),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    VentingMobLocalizations l10n,
    ListenerPaymentPayoutsState state,
  ) {
    if (state.isLoadingOrInitial) {
      return const Center(child: CircularProgressIndicator());
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
                onPressed: () => context.read<ListenerPaymentPayoutsBloc>().add(
                  const ListenerPaymentPayoutsEvent.retryLoad(),
                ),
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

    final bankAccount = overview.bankAccount;
    final canRequestPayout =
        overview.balances.available >=
            ListenerPaymentPayoutsBloc.minPayoutAmount &&
        bankAccount != null &&
        !state.isRequestingPayout;

    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<ListenerPaymentPayoutsBloc>().add(
                const ListenerPaymentPayoutsEvent.refreshRequested(),
              );
              await context
                  .read<ListenerPaymentPayoutsBloc>()
                  .stream
                  .firstWhere((s) => !s.isLoading);
            },
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
              children: [
                _BalanceCard(
                  balanceLabel: l10n.listener_payout_your_balance,
                  balance: _money(overview.balances.available),
                  availableLabel: l10n.listener_payout_available,
                  totalLabel: l10n.listener_payout_total_earnings,
                  totalValue: _money(overview.balances.lifetime),
                  monthLabel: l10n.listener_payout_pending_balance,
                  monthValue: _money(overview.balances.pending),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.listener_payout_min_hint,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                _MenuTile(
                  icon: Icons.account_balance_wallet_outlined,
                  label: l10n.listener_profile_settings_payout_methods,
                  value:
                      _methodsValue(bankAccount) ??
                      l10n.listener_payout_add_method,
                  onTap: state.isSavingMethod
                      ? null
                      : () => _onPayoutMethods(context, bankAccount),
                ),
                const SizedBox(height: 10),
                _MenuTile(
                  icon: Icons.history_rounded,
                  label: l10n.listener_payout_history,
                  onTap: () => _onPayoutHistory(context),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
          child: SizedBox(
            width: double.infinity,
            height: 54,
            child: FilledButton(
              onPressed: canRequestPayout
                  ? () => _onRequestPayout(context, state)
                  : null,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                disabledBackgroundColor: SplashColors.purpleMid.withValues(
                  alpha: 0.35,
                ),
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white.withValues(alpha: 0.7),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: state.isRequestingPayout
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(l10n.listener_payout_request),
            ),
          ),
        ),
      ],
    );
  }
}

class _BalanceCard extends StatelessWidget {
  const _BalanceCard({
    required this.balanceLabel,
    required this.balance,
    required this.availableLabel,
    required this.totalLabel,
    required this.totalValue,
    required this.monthLabel,
    required this.monthValue,
  });

  final String balanceLabel;
  final String balance;
  final String availableLabel;
  final String totalLabel;
  final String totalValue;
  final String monthLabel;
  final String monthValue;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1848), Color(0xFF1C1826)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 18, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        balanceLabel,
                        style: GoogleFonts.inter(
                          color: SplashColors.purpleMid,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        balance,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        availableLabel,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E).withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: Color(0xFF22C55E),
                    size: 28,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _StatBlock(label: totalLabel, value: totalValue),
                ),
                Container(
                  width: 1,
                  height: 36,
                  color: Colors.white.withValues(alpha: 0.1),
                ),
                Expanded(
                  child: _StatBlock(label: monthLabel, value: monthValue),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.value,
  });

  final IconData icon;
  final String label;
  final String? value;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ListenerProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: ListenerProfileTheme.cardBorder),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.white.withValues(alpha: 0.9), size: 22),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (value != null) ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 120),
                  child: Text(
                    value!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white.withValues(alpha: 0.35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
