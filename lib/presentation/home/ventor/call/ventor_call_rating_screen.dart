import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_report_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorCallRatingScreen extends StatefulWidget {
  const VentorCallRatingScreen({super.key, required this.args});

  final VentorCallArgs args;

  @override
  State<VentorCallRatingScreen> createState() => _VentorCallRatingScreenState();
}

class _VentorCallRatingScreenState extends State<VentorCallRatingScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  static const _tipOptions = <int?>[null, 2, 5, 10];

  var _stars = 5;
  int? _selectedTip;
  final _reviewController = TextEditingController();
  var _submitting = false;
  VentorCallReportResult? _reported;

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  String _money(int amount) => '\$$amount';

  Future<void> _onReportListener() async {
    if (_submitting) return;
    final result = await showVentorCallReportBottomSheet(
      context: context,
      listenerName: widget.args.listenerName,
    );
    if (!mounted || result == null) return;
    setState(() => _reported = result);
    await _showReportReceivedDialog();
  }

  Future<void> _showReportReceivedDialog() async {
    final l10n = VentingMobLocalizations.of(context);
    await showDialog<void>(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          backgroundColor: VentorProfileTheme.cardFill,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: VentorProfileTheme.cardBorder),
          ),
          icon: const Icon(
            Icons.verified_user_outlined,
            color: SplashColors.purpleMid,
            size: 36,
          ),
          title: Text(
            l10n.ventor_call_report_received_title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          content: Text(
            l10n.ventor_call_report_received_body,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 14,
              height: 1.45,
            ),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(),
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                l10n.ventor_call_report_received_ok,
                style: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
          ],
        );
      },
    );
    if (!mounted) return;
    Navigator.of(context).pop(true);
  }

  Future<void> _submit() async {
    if (_submitting) return;
    setState(() => _submitting = true);

    // TODO: Submit rating + optional tip (+ report if any) to API.
    await Future<void>.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;

    final l10n = VentingMobLocalizations.of(context);
    final tip = _selectedTip;
    final messenger = ScaffoldMessenger.of(context);
    messenger.showSnackBar(
      SnackBar(
        content: Text(
          tip == null
              ? l10n.ventor_call_rating_thanks
              : l10n.ventor_call_rating_thanks_with_tip(_money(tip)),
        ),
        behavior: SnackBarBehavior.floating,
      ),
    );
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final args = widget.args;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 36,
                        backgroundImage: args.listenerAvatarUrl != null
                            ? NetworkImage(args.listenerAvatarUrl!)
                            : null,
                        child: args.listenerAvatarUrl == null
                            ? Text(
                                args.listenerName.isNotEmpty
                                    ? args.listenerName[0].toUpperCase()
                                    : '?',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            : null,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.ventor_call_rating_title(args.listenerName),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.ventor_call_rating_subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 28),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          final filled = index < _stars;
                          return IconButton(
                            onPressed: () => setState(() => _stars = index + 1),
                            icon: Icon(
                              filled
                                  ? Icons.star_rounded
                                  : Icons.star_outline_rounded,
                              color: VentorProfileTheme.gold,
                              size: 40,
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.ventor_call_rating_stars_hint(_stars),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: _reviewController,
                      maxLines: 3,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      decoration: InputDecoration(
                        hintText: l10n.ventor_call_rating_review_hint,
                        hintStyle: GoogleFonts.inter(
                          color: VentorProfileTheme.muted,
                          fontSize: 13,
                        ),
                        filled: true,
                        fillColor: VentorProfileTheme.cardFill,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: VentorProfileTheme.cardBorder,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: VentorProfileTheme.cardBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: SplashColors.purpleMid,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      l10n.ventor_call_tip_title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      l10n.ventor_call_tip_subtitle(args.listenerName),
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        for (final tip in _tipOptions)
                          _TipChip(
                            label: tip == null
                                ? l10n.ventor_call_tip_none
                                : _money(tip),
                            selected: _selectedTip == tip,
                            onTap: () => setState(() => _selectedTip = tip),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                child: TextButton.icon(
                  onPressed: _submitting ? null : _onReportListener,
                  icon: Icon(
                    _reported == null
                        ? Icons.flag_outlined
                        : Icons.flag_rounded,
                    size: 16,
                    color: _reported == null
                        ? VentorProfileTheme.muted
                        : const Color(0xFFE57373),
                  ),
                  label: Text(
                    _reported == null
                        ? l10n.ventor_call_report_listener
                        : l10n.ventor_call_report_submitted,
                    style: GoogleFonts.inter(
                      color: _reported == null
                          ? VentorProfileTheme.muted
                          : const Color(0xFFE57373),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: _submitting ? null : _submit,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      disabledBackgroundColor: SplashColors.purpleMid
                          .withValues(alpha: 0.4),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: _submitting
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            _selectedTip == null
                                ? l10n.ventor_call_rating_submit
                                : l10n.ventor_call_rating_submit_with_tip(
                                    _money(_selectedTip!),
                                  ),
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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

class _TipChip extends StatelessWidget {
  const _TipChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.22)
          : VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
