import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/phone_country_picker.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<VentorBookedSession?> openVentorBookedSessionDetailsScreen({
  required BuildContext context,
  required VentorBookedSession session,
}) {
  return Navigator.of(context).push<VentorBookedSession>(
    MaterialPageRoute(
      builder: (_) => VentorBookedSessionDetailsScreen(session: session),
    ),
  );
}

class VentorBookedSessionDetailsScreen extends StatefulWidget {
  const VentorBookedSessionDetailsScreen({super.key, required this.session});

  final VentorBookedSession session;

  @override
  State<VentorBookedSessionDetailsScreen> createState() =>
      _VentorBookedSessionDetailsScreenState();
}

class _VentorBookedSessionDetailsScreenState
    extends State<VentorBookedSessionDetailsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _voiceChangeFee = 3.0;

  var _cancelling = false;

  late VentorBookedSession _session;

  @override
  void initState() {
    super.initState();
    _session = widget.session;
  }

  String _money(double value) => '\$${value.toStringAsFixed(2)}';

  String _countryFlag(String isoCode) {
    try {
      return countryFlagEmoji(IsoCode.values.byName(isoCode.toUpperCase()));
    } catch (_) {
      return '🏳️';
    }
  }

  String _timeSummary(VentingMobLocalizations l10n) {
    if (_session.isInstant) {
      return l10n.ventor_sessions_time_summary_instant;
    }
    final at = _session.scheduledAt;
    if (at == null) return l10n.ventor_sessions_time_summary_instant;
    final locale = Localizations.localeOf(context).toString();
    final label =
        '${DateFormat.MMMEd(locale).format(at)} · ${DateFormat.jm(locale).format(at)}';
    return l10n.ventor_sessions_time_summary_scheduled(label);
  }

  VentorFindListener? get _listener =>
      VentorSessionsCatalog.listenerById(_session.listenerId);

  double get _sessionPrice {
    final listener = _listener;
    if (listener != null) {
      return listener.priceForMinutes(_session.durationMinutes);
    }
    final voice = _session.voiceChangeEnabled ? _voiceChangeFee : 0;
    return (_session.amountPaid - voice).clamp(0, _session.amountPaid);
  }

  double get _voiceFee => _session.voiceChangeEnabled ? _voiceChangeFee : 0;

  double get _discountAmount {
    final base = _sessionPrice + _voiceFee;
    final diff = base - _session.amountPaid;
    return diff > 0.009 ? diff : 0;
  }

  bool get _canCancel =>
      !_cancelling && _session.status == VentorBookedSessionStatus.upcoming;

  Future<void> _onCancelPressed() async {
    if (!_canCancel) return;
    final l10n = VentingMobLocalizations.of(context);
    final refund = _session.cancelRefundAmount;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: VentorProfileTheme.cardFill,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: VentorProfileTheme.cardBorder),
          ),
          title: Text(
            l10n.ventor_sessions_cancel_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.ventor_sessions_cancel_body,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 14,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              _DialogAmountRow(
                label: l10n.ventor_sessions_cancel_refund_label,
                value: _money(refund),
                valueColor: VentorProfileTheme.success,
              ),
              const SizedBox(height: 12),
              Text(
                l10n.ventor_sessions_cancel_balance_note(_money(refund)),
                style: GoogleFonts.inter(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 13,
                  height: 1.35,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(
                l10n.ventor_sessions_cancel_keep,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFFE57373),
                foregroundColor: Colors.white,
              ),
              child: Text(
                l10n.ventor_sessions_cancel_confirm,
                style: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) return;

    setState(() => _cancelling = true);
    // TODO: Call cancel session API; credit full refund to ventor balance.
    await Future<void>.delayed(const Duration(milliseconds: 700));
    if (!mounted) return;

    final cancelled = _session.copyWith(
      status: VentorBookedSessionStatus.cancelled,
      refundedToBalance: refund,
    );
    setState(() {
      _session = cancelled;
      _cancelling = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.ventor_sessions_cancel_success(_money(refund))),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.of(context).pop(cancelled);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final listener = _listener;
    final isVideo = _session.callMode == VentorBookedCallMode.video;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        appBar: AppBar(
          backgroundColor: SplashColors.backgroundBottom,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.ventor_sessions_details_screen_title,
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
                    Text(
                      l10n.ventor_sessions_details_heading,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.ventor_sessions_details_subtitle,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 18),
                    _SectionCard(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              _session.listenerAvatarUrl,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      child: Text(
                                        _session.listenerName,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    if (listener?.isVerified ?? false) ...[
                                      const SizedBox(width: 4),
                                      const Icon(
                                        Icons.verified_rounded,
                                        size: 16,
                                        color: SplashColors.purpleMid,
                                      ),
                                    ],
                                  ],
                                ),
                                if (listener != null) ...[
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        size: 14,
                                        color: VentorProfileTheme.gold,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        listener.rating.toStringAsFixed(1),
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Flexible(
                                        child: Text(
                                          listener.topics.join(' · '),
                                          style: GoogleFonts.inter(
                                            color: VentorProfileTheme.muted,
                                            fontSize: 12,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${_countryFlag(listener.countryIsoCode)} '
                                    '${listener.country}'
                                    '${listener.city.isEmpty ? '' : ', ${listener.city}'}',
                                    style: GoogleFonts.inter(
                                      color: VentorProfileTheme.muted,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    listener.languages.join(' · '),
                                    style: GoogleFonts.inter(
                                      color: VentorProfileTheme.muted,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    _SectionCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.ventor_sessions_confirm_summary_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_duration,
                            value: l10n.ventor_sessions_duration_minutes(
                              _session.durationMinutes,
                            ),
                          ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_time,
                            value: _timeSummary(l10n),
                          ),
                          if (listener != null)
                            _SummaryRow(
                              label: l10n.ventor_sessions_confirm_rate,
                              value: l10n.ventor_sessions_rate_per_min(
                                _money(listener.ratePerMinute),
                              ),
                            ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_session_price,
                            value: _money(_sessionPrice),
                          ),
                          if (_session.voiceChangeEnabled)
                            _SummaryRow(
                              label:
                                  l10n.ventor_sessions_voice_change_fee_label,
                              value: _money(_voiceFee),
                            ),
                          if (_discountAmount > 0)
                            _SummaryRow(
                              label: l10n.ventor_sessions_confirm_discount,
                              value: '-${_money(_discountAmount)}',
                            ),
                          _SummaryRow(
                            label: l10n.ventor_sessions_confirm_total,
                            value: _money(_session.amountPaid),
                            emphasize: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      l10n.ventor_sessions_confirm_call_type,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: _InfoTile(
                            selected: !isVideo,
                            icon: Icons.call_rounded,
                            label: l10n.ventor_sessions_call_voice,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _InfoTile(
                            selected: isVideo,
                            icon: Icons.videocam_rounded,
                            label: l10n.ventor_sessions_call_video,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_speech_language_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: SplashColors.purpleMid.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(999),
                          border: Border.all(color: SplashColors.purpleMid),
                        ),
                        child: Text(
                          _session.speechLanguage,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),
                    Text(
                      l10n.ventor_sessions_voice_change_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _SectionCard(
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: SplashColors.purpleMid.withValues(
                                alpha: 0.16,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.record_voice_over_rounded,
                              color: SplashColors.purpleMid,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.ventor_sessions_voice_change_option,
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  _session.voiceChangeEnabled
                                      ? l10n.ventor_sessions_booked_voice_change_on
                                      : l10n.ventor_sessions_voice_change_off,
                                  style: GoogleFonts.inter(
                                    color: VentorProfileTheme.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            _session.voiceChangeEnabled
                                ? Icons.check_circle_rounded
                                : Icons.cancel_outlined,
                            color: _session.voiceChangeEnabled
                                ? VentorProfileTheme.success
                                : VentorProfileTheme.muted,
                          ),
                        ],
                      ),
                    ),
                    if (_canCancel) ...[
                      const SizedBox(height: 18),
                      _SectionCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l10n.ventor_sessions_cancel_policy_title,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              l10n.ventor_sessions_cancel_policy_body(
                                _money(_session.cancelRefundAmount),
                              ),
                              style: GoogleFonts.inter(
                                color: VentorProfileTheme.muted,
                                fontSize: 12,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (_canCancel)
                Container(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                  decoration: BoxDecoration(
                    color: SplashColors.backgroundBottom,
                    border: Border(
                      top: BorderSide(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              l10n.ventor_sessions_confirm_you_pay,
                              style: GoogleFonts.inter(
                                color: VentorProfileTheme.muted,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            _money(_session.amountPaid),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        height: 54,
                        child: OutlinedButton(
                          onPressed: _cancelling ? null : _onCancelPressed,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xFFE57373),
                            side: const BorderSide(color: Color(0xFFE57373)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: _cancelling
                              ? const SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Color(0xFFE57373),
                                  ),
                                )
                              : Text(
                                  l10n.ventor_sessions_cancel_cta,
                                  style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: child,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: GoogleFonts.inter(
                color: emphasize ? SplashColors.purpleMid : Colors.white,
                fontSize: emphasize ? 15 : 13,
                fontWeight: emphasize ? FontWeight.w700 : FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.selected,
    required this.icon,
    required this.label,
  });

  final bool selected;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: selected
            ? SplashColors.purpleMid.withValues(alpha: 0.18)
            : VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected
              ? SplashColors.purpleMid
              : VentorProfileTheme.cardBorder,
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: selected ? SplashColors.purpleMid : VentorProfileTheme.muted,
            size: 26,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DialogAmountRow extends StatelessWidget {
  const _DialogAmountRow({
    required this.label,
    required this.value,
    required this.valueColor,
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 13,
            ),
          ),
        ),
        Text(
          value,
          style: GoogleFonts.inter(
            color: valueColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
