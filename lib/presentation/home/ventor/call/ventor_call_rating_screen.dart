import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/bloc/ventor_call_rating/ventor_call_rating_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_report_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorCallRatingScreen extends StatelessWidget {
  const VentorCallRatingScreen({super.key, required this.args});

  final VentorCallArgs args;

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<VentorCallRatingBloc>(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: _VentorCallRatingView(args: args),
      ),
    );
  }
}

class _VentorCallRatingView extends StatefulWidget {
  const _VentorCallRatingView({required this.args});

  final VentorCallArgs args;

  @override
  State<_VentorCallRatingView> createState() => _VentorCallRatingViewState();
}

class _VentorCallRatingViewState extends State<_VentorCallRatingView> {
  static const _tipOptions = <int?>[null, 2, 5, 10];

  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  String _money(num amount) {
    final value = amount is int ? amount : amount.round();
    return '\$$value';
  }

  Future<void> _onReportListener() async {
    final bloc = context.read<VentorCallRatingBloc>();
    if (bloc.state.isSubmitting || bloc.state.hasReport) return;

    final result = await showVentorCallReportBottomSheet(
      context: context,
      sessionId: widget.args.sessionId,
      listenerName: widget.args.listenerName,
    );
    if (!mounted || result == null) return;

    bloc.add(
      VentorCallRatingEvent.reportCaptured(
        reason: result.reason,
        details: result.details,
      ),
    );
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
  }

  void _onSuccess(VentorCallRatingState state) {
    final l10n = VentingMobLocalizations.of(context);
    final tip = state.tipCharged ?? state.tipAmount?.toDouble();
    ScaffoldMessenger.of(context).showSnackBar(
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
    final args = widget.args;

    return Scaffold(
      backgroundColor: SplashColors.backgroundBottom,
      body: SafeArea(
        child: BlocConsumer<VentorCallRatingBloc, VentorCallRatingState>(
          listenWhen: (previous, current) =>
              previous.submitSucceeded != current.submitSucceeded ||
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                  behavior: SnackBarBehavior.floating,
                ),
              );
              return;
            }
            if (state.submitSucceeded) {
              _onSuccess(state);
            }
          },
          builder: (context, state) {
            final l10n = VentingMobLocalizations.of(context);
            final bloc = context.read<VentorCallRatingBloc>();

            return Column(
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
                            final filled = index < state.stars;
                            return IconButton(
                              onPressed: state.isSubmitting
                                  ? null
                                  : () => bloc.add(
                                      VentorCallRatingEvent.starsChanged(
                                        index + 1,
                                      ),
                                    ),
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
                        l10n.ventor_call_rating_stars_hint(state.stars),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          color: VentorProfileTheme.muted,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _reviewController,
                        enabled: !state.isSubmitting,
                        maxLines: 3,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        onChanged: (value) => bloc.add(
                          VentorCallRatingEvent.reviewChanged(value),
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
                              selected: state.tipAmount == tip,
                              onTap: state.isSubmitting
                                  ? null
                                  : () => bloc.add(
                                      VentorCallRatingEvent.tipChanged(tip),
                                    ),
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 8),
                  child: TextButton.icon(
                    onPressed: state.isSubmitting || state.hasReport
                        ? null
                        : _onReportListener,
                    icon: Icon(
                      state.hasReport
                          ? Icons.flag_rounded
                          : Icons.flag_outlined,
                      size: 16,
                      color: state.hasReport
                          ? const Color(0xFFE57373)
                          : VentorProfileTheme.muted,
                    ),
                    label: Text(
                      state.hasReport
                          ? l10n.ventor_call_report_submitted
                          : l10n.ventor_call_report_listener,
                      style: GoogleFonts.inter(
                        color: state.hasReport
                            ? const Color(0xFFE57373)
                            : VentorProfileTheme.muted,
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
                      onPressed: state.isSubmitting
                          ? null
                          : () => bloc.add(
                              VentorCallRatingEvent.submitRequested(
                                sessionId: args.sessionId,
                              ),
                            ),
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        disabledBackgroundColor: SplashColors.purpleMid
                            .withValues(alpha: 0.4),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: state.isSubmitting
                          ? const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              state.tipAmount == null
                                  ? l10n.ventor_call_rating_submit
                                  : l10n.ventor_call_rating_submit_with_tip(
                                      _money(state.tipAmount!),
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
            );
          },
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
  final VoidCallback? onTap;

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
