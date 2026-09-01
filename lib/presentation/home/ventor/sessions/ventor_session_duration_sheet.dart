import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<int?> showVentorSessionDurationSheet({
  required BuildContext context,
  required VentorFindListener listener,
}) {
  return showModalBottomSheet<int>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => _DurationSheet(listener: listener),
  );
}

class _DurationSheet extends StatefulWidget {
  const _DurationSheet({required this.listener});

  final VentorFindListener listener;

  @override
  State<_DurationSheet> createState() => _DurationSheetState();
}

class _DurationSheetState extends State<_DurationSheet> {
  static const _sheetFill = Color(0xFF1C1826);
  late int _selectedMinutes;
  late final List<VentorSessionDurationOption> _options;

  @override
  void initState() {
    super.initState();
    _options = VentorSessionsCatalog.durationOptionsFor(widget.listener);
    final popular = _options.where((o) => o.isPopular);
    _selectedMinutes = popular.isNotEmpty
        ? popular.first.minutes
        : _options.first.minutes;
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;

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
              l10n.ventor_sessions_choose_duration,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.ventor_sessions_rate_per_min(
                _money(widget.listener.ratePerMinute),
              ),
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            for (final option in _options) ...[
              _DurationRow(
                label: l10n.ventor_sessions_duration_minutes(option.minutes),
                priceLabel: _money(
                  widget.listener.priceForMinutes(option.minutes),
                ),
                popularLabel: option.isPopular
                    ? l10n.ventor_sessions_duration_popular
                    : null,
                selected: _selectedMinutes == option.minutes,
                onTap: () => setState(() => _selectedMinutes = option.minutes),
              ),
              const SizedBox(height: 10),
            ],
            const SizedBox(height: 8),
            SizedBox(
              height: 52,
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(_selectedMinutes),
                style: FilledButton.styleFrom(
                  backgroundColor: SplashColors.purpleMid,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  textStyle: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: Text(l10n.ventor_sessions_continue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DurationRow extends StatelessWidget {
  const _DurationRow({
    required this.label,
    required this.priceLabel,
    required this.selected,
    required this.onTap,
    this.popularLabel,
  });

  final String label;
  final String priceLabel;
  final String? popularLabel;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.16)
          : const Color(0xFF15101F),
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
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
                    Text(
                      label,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (popularLabel != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        popularLabel!,
                        style: GoogleFonts.inter(
                          color: SplashColors.purpleMid,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Text(
                priceLabel,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
