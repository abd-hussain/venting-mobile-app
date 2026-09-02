import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_home_models.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

Future<VentorMoodCheckIn?> showVentorMoodCheckInSheet({
  required BuildContext context,
  required VentorMoodOption mood,
}) {
  return showModalBottomSheet<VentorMoodCheckIn>(
    context: context,
    isScrollControlled: true,
    backgroundColor: const Color(0xFF16121F),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
    ),
    builder: (context) => _VentorMoodCheckInSheet(mood: mood),
  );
}

class _VentorMoodCheckInSheet extends StatefulWidget {
  const _VentorMoodCheckInSheet({required this.mood});

  final VentorMoodOption mood;

  @override
  State<_VentorMoodCheckInSheet> createState() =>
      _VentorMoodCheckInSheetState();
}

class _VentorMoodCheckInSheetState extends State<_VentorMoodCheckInSheet> {
  final _controller = TextEditingController();

  bool get _canSubmit => _controller.text.trim().isNotEmpty;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _moodLabel(VentingMobLocalizations l10n) {
    return switch (widget.mood.kind) {
      VentorMoodKind.great => l10n.ventor_home_mood_great,
      VentorMoodKind.okay => l10n.ventor_home_mood_okay,
      VentorMoodKind.anxious => l10n.ventor_home_mood_anxious,
      VentorMoodKind.sad => l10n.ventor_home_mood_sad,
      VentorMoodKind.angry => l10n.ventor_home_mood_angry,
    };
  }

  void _submit() {
    if (!_canSubmit) return;
    Navigator.of(context).pop(
      VentorMoodCheckIn(
        mood: widget.mood.kind,
        note: _controller.text.trim(),
        at: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final keyboardInset = MediaQuery.viewInsetsOf(context).bottom;
    final moodColor = Color(widget.mood.color);

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          20,
          10,
          20,
          16 + bottomInset + keyboardInset,
        ),
        child: SingleChildScrollView(
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
              const SizedBox(height: 18),
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: moodColor.withValues(alpha: 0.18),
                    border: Border.all(color: moodColor, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: moodColor.withValues(alpha: 0.35),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    widget.mood.emoji,
                    style: const TextStyle(fontSize: 34),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.ventor_home_mood_write_title(_moodLabel(l10n)),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                l10n.ventor_home_mood_write_subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: VentorProfileTheme.muted,
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                maxLines: 5,
                maxLength: 400,
                autofocus: true,
                style: GoogleFonts.inter(color: Colors.white, fontSize: 14),
                onChanged: (_) => setState(() {}),
                decoration: InputDecoration(
                  hintText: l10n.ventor_home_mood_write_hint,
                  hintStyle: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 13,
                  ),
                  filled: true,
                  fillColor: VentorProfileTheme.cardFill,
                  counterStyle: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 11,
                  ),
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
                    borderSide: BorderSide(color: moodColor),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 52,
                child: FilledButton(
                  onPressed: _canSubmit ? _submit : null,
                  style: FilledButton.styleFrom(
                    backgroundColor: SplashColors.purpleMid,
                    disabledBackgroundColor: SplashColors.purpleMid.withValues(
                      alpha: 0.4,
                    ),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    l10n.ventor_home_mood_submit,
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
      ),
    );
  }
}
