import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';

class ListenerPayoutHistoryItem {
  const ListenerPayoutHistoryItem({
    required this.id,
    required this.amount,
    required this.date,
    required this.status,
    required this.methodLabel,
    this.reference,
  });

  final String id;
  final double amount;
  final DateTime date;
  final ListenerPayoutStatus status;
  final String methodLabel;
  final String? reference;
}

enum ListenerPayoutStatus { completed, pending, failed }

/// Shows payout history details in a bottom sheet.
Future<void> showPayoutHistoryBottomSheet({
  required BuildContext context,
  required List<ListenerPayoutHistoryItem> items,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: ListenerProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => PayoutHistoryBottomSheet(items: items),
  );
}

class PayoutHistoryBottomSheet extends StatelessWidget {
  const PayoutHistoryBottomSheet({super.key, required this.items});

  final List<ListenerPayoutHistoryItem> items;

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _statusLabel(
    VentingMobLocalizations l10n,
    ListenerPayoutStatus status,
  ) {
    return switch (status) {
      ListenerPayoutStatus.completed => l10n.listener_payout_status_completed,
      ListenerPayoutStatus.pending => l10n.listener_payout_status_pending,
      ListenerPayoutStatus.failed => l10n.listener_payout_status_failed,
    };
  }

  Color _statusColor(ListenerPayoutStatus status) {
    return switch (status) {
      ListenerPayoutStatus.completed => const Color(0xFF22C55E),
      ListenerPayoutStatus.pending => ListenerProfileTheme.gold,
      ListenerPayoutStatus.failed => const Color(0xFFEF4444),
    };
  }

  String _dateLabel(DateTime date) {
    final local = date.toLocal();
    final y = local.year.toString().padLeft(4, '0');
    final m = local.month.toString().padLeft(2, '0');
    final d = local.day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

    return SafeArea(
      top: false,
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.75,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 8, 8),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      l10n.listener_payout_history,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.close_rounded,
                      color: Colors.white.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: items.isEmpty
                  ? Center(
                      child: Text(
                        l10n.listener_payout_history_empty,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(16, 8, 16, 16 + bottomInset),
                      itemCount: items.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF14101C),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: ListenerProfileTheme.cardBorder,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      _money(item.amount),
                                      style: GoogleFonts.inter(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _statusColor(
                                        item.status,
                                      ).withValues(alpha: 0.15),
                                      borderRadius: BorderRadius.circular(999),
                                    ),
                                    child: Text(
                                      _statusLabel(l10n, item.status),
                                      style: GoogleFonts.inter(
                                        color: _statusColor(item.status),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              _DetailRow(
                                label: l10n.listener_payout_detail_date,
                                value: _dateLabel(item.date),
                              ),
                              _DetailRow(
                                label: l10n.listener_payout_detail_method,
                                value: item.methodLabel,
                              ),
                              if (item.reference != null)
                                _DetailRow(
                                  label: l10n.listener_payout_detail_reference,
                                  value: item.reference!,
                                  showDivider: false,
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow({
    required this.label,
    required this.value,
    this.showDivider = true,
  });

  final String label;
  final String value;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 13,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
      ],
    );
  }
}
