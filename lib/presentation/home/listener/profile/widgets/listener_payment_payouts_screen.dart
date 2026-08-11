import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/payout_history_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/widgets/payout_methods_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Opens the Payment & Payouts screen.
Future<void> openListenerPaymentPayoutsScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => const ListenerPaymentPayoutsScreen()),
  );
}

class ListenerPaymentPayoutsScreen extends StatefulWidget {
  const ListenerPaymentPayoutsScreen({super.key});

  @override
  State<ListenerPaymentPayoutsScreen> createState() =>
      _ListenerPaymentPayoutsScreenState();
}

class _ListenerPaymentPayoutsScreenState
    extends State<ListenerPaymentPayoutsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _minPayoutAmount = 100.0;

  // TODO: Load payout balances from listener earnings API / repository.
  static const _availableBalance = 245.60;
  static const _totalEarnings = 1245.80;
  static const _monthEarnings = 345.20;

  // TODO: Load bank accounts / payout history from API.
  ListenerBankAccountInfo? _bankAccount = const ListenerBankAccountInfo(
    accountHolderName: 'Nour Listener',
    bankName: 'Arab Bank',
    ibanOrAccountNumber: 'JO94CBJO0010000000000131000302',
    swiftCode: 'ARABJOAX100',
  );

  static final _history = <ListenerPayoutHistoryItem>[
    ListenerPayoutHistoryItem(
      id: '1',
      amount: 150,
      date: DateTime.now().subtract(const Duration(days: 12)),
      status: ListenerPayoutStatus.completed,
      methodLabel: 'Arab Bank ••••0302',
      reference: 'PO-10482',
    ),
    ListenerPayoutHistoryItem(
      id: '2',
      amount: 120,
      date: DateTime.now().subtract(const Duration(days: 38)),
      status: ListenerPayoutStatus.completed,
      methodLabel: 'Arab Bank ••••0302',
      reference: 'PO-09811',
    ),
    ListenerPayoutHistoryItem(
      id: '3',
      amount: 100,
      date: DateTime.now().subtract(const Duration(days: 64)),
      status: ListenerPayoutStatus.failed,
      methodLabel: 'Arab Bank ••••0302',
      reference: 'PO-09102',
    ),
  ];

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  bool get _canRequestPayout =>
      _availableBalance >= _minPayoutAmount && _bankAccount != null;

  String? get _methodsValue {
    final bank = _bankAccount;
    if (bank == null) return null;
    final iban = bank.ibanOrAccountNumber;
    final suffix = iban.length <= 4 ? iban : iban.substring(iban.length - 4);
    return '${bank.bankName} ••••$suffix';
  }

  Future<void> _onPayoutMethods() async {
    final updated = await showPayoutMethodsBottomSheet(
      context: context,
      initial: _bankAccount,
    );
    if (!mounted || updated == null) return;
    setState(() => _bankAccount = updated);
  }

  Future<void> _onPayoutHistory() {
    return showPayoutHistoryBottomSheet(context: context, items: _history);
  }

  void _onRequestPayout() {
    final l10n = VentingMobLocalizations.of(context);
    if (_bankAccount == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.listener_payout_need_method)));
      return;
    }
    if (_availableBalance < _minPayoutAmount) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.listener_payout_min_hint)));
      return;
    }
    // TODO: Submit payout request via API.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.listener_payout_request_submitted)),
    );
  }

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
            l10n.listener_profile_payment_payouts,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                  children: [
                    _BalanceCard(
                      balanceLabel: l10n.listener_payout_your_balance,
                      balance: _money(_availableBalance),
                      availableLabel: l10n.listener_payout_available,
                      totalLabel: l10n.listener_payout_total_earnings,
                      totalValue: _money(_totalEarnings),
                      monthLabel: l10n.listener_payout_this_month,
                      monthValue: _money(_monthEarnings),
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
                      value: _methodsValue ?? l10n.listener_payout_add_method,
                      onTap: _onPayoutMethods,
                    ),
                    const SizedBox(height: 10),
                    _MenuTile(
                      icon: Icons.history_rounded,
                      label: l10n.listener_payout_history,
                      onTap: _onPayoutHistory,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _canRequestPayout ? _onRequestPayout : null,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      disabledBackgroundColor: SplashColors.purpleMid
                          .withValues(alpha: 0.35),
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white.withValues(
                        alpha: 0.7,
                      ),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(l10n.listener_payout_request),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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
  final VoidCallback onTap;

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
