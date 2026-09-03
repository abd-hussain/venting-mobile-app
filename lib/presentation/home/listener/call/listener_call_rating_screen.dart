import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/bloc/listener_call_rating/listener_call_rating_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_args.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerCallRatingScreen extends StatelessWidget {
  const ListenerCallRatingScreen({super.key, required this.args});

  final ListenerCallArgs args;

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => diContainer<ListenerCallRatingBloc>(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: Scaffold(
          backgroundColor: SplashColors.backgroundBottom,
          body: SafeArea(
            child:
                BlocConsumer<ListenerCallRatingBloc, ListenerCallRatingState>(
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
                      Navigator.of(context).pop();
                    }
                  },
                  builder: (context, state) {
                    final l10n = VentingMobLocalizations.of(context);
                    final bloc = context.read<ListenerCallRatingBloc>();

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.listener_call_rating_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.w800,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.listener_call_rating_subtitle,
                            style: GoogleFonts.inter(
                              color: ListenerProfileTheme.muted,
                              fontSize: 15,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 32),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(5, (index) {
                                final filled = index < state.stars;
                                return IconButton(
                                  onPressed: state.isSubmitting
                                      ? null
                                      : () => bloc.add(
                                          ListenerCallRatingEvent.starsChanged(
                                            index + 1,
                                          ),
                                        ),
                                  icon: Icon(
                                    filled
                                        ? Icons.star_rounded
                                        : Icons.star_outline_rounded,
                                    color: ListenerProfileTheme.gold,
                                    size: 40,
                                  ),
                                );
                              }),
                            ),
                          ),
                          const SizedBox(height: 28),
                          _YesNoQuestion(
                            question: l10n.listener_call_rating_felt_heard,
                            yesLabel: l10n.listener_call_yes,
                            noLabel: l10n.listener_call_no,
                            value: state.feltHeard,
                            enabled: !state.isSubmitting,
                            onChanged: (v) => bloc.add(
                              ListenerCallRatingEvent.feltHeardChanged(v),
                            ),
                          ),
                          const SizedBox(height: 24),
                          _YesNoQuestion(
                            question: l10n.listener_call_rating_talk_again,
                            yesLabel: l10n.listener_call_yes,
                            noLabel: l10n.listener_call_no,
                            value: state.talkAgain,
                            enabled: !state.isSubmitting,
                            onChanged: (v) => bloc.add(
                              ListenerCallRatingEvent.talkAgainChanged(v),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: FilledButton(
                              onPressed: state.canSubmit
                                  ? () => bloc.add(
                                      ListenerCallRatingEvent.submitRequested(
                                        sessionId: args.sessionId,
                                      ),
                                    )
                                  : null,
                              style: FilledButton.styleFrom(
                                backgroundColor: SplashColors.purpleMid,
                                disabledBackgroundColor: SplashColors.purpleMid
                                    .withValues(alpha: 0.35),
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
                                      l10n.listener_call_rating_submit,
                                      style: GoogleFonts.inter(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
          ),
        ),
      ),
    );
  }
}

class _YesNoQuestion extends StatelessWidget {
  const _YesNoQuestion({
    required this.question,
    required this.yesLabel,
    required this.noLabel,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final String question;
  final String yesLabel;
  final String noLabel;
  final bool? value;
  final ValueChanged<bool> onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _ToggleChip(
                label: yesLabel,
                selected: value == true,
                onTap: enabled ? () => onChanged(true) : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _ToggleChip(
                label: noLabel,
                selected: value == false,
                onTap: enabled ? () => onChanged(false) : null,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ToggleChip extends StatelessWidget {
  const _ToggleChip({
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
          ? SplashColors.purpleMid.withValues(alpha: 0.25)
          : ListenerProfileTheme.cardFill,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: selected
              ? SplashColors.purpleMid
              : ListenerProfileTheme.cardBorder,
          width: selected ? 1.5 : 1,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: selected ? Colors.white : ListenerProfileTheme.muted,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
