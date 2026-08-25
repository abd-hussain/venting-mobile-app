import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';

/// Shared top chrome for all listener registration steps.
class ListenerRegistrationHeader extends StatelessWidget {
  const ListenerRegistrationHeader({
    super.key,
    required this.step,
    required this.onBack,
    required this.onSkip,
  });

  final ListenerRegistrationStep step;
  final VoidCallback onBack;
  final VoidCallback onSkip;

  static const _accent = Color(0xFF8A3CFE);
  static const _backFill = Color(0xFF1C1826);
  static const _progressTrack = Color(0xFF3A2F52);

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final total = ListenerRegistrationStepX.total;
    final current = step.number;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 12, 4),
      child: Row(
        children: [
          Material(
            color: _backFill,
            shape: const CircleBorder(),
            child: InkWell(
              customBorder: const CircleBorder(),
              onTap: onBack,
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: _accent.withValues(alpha: 0.45)),
                ),
                child: const Icon(
                  Icons.arrow_back_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(total, (i) {
                    final active = i < current;
                    return Padding(
                      padding: EdgeInsetsDirectional.only(
                        start: i == 0 ? 0 : 4,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 220),
                        width: active ? 18 : 14,
                        height: 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(999),
                          color: active ? _accent : _progressTrack,
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 6),
                Text(
                  '$current/$total',
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.7),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onSkip,
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFC9B8E8),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              minimumSize: const Size(48, 40),
            ),
            child: Text(
              l10n.listener_reg_skip_for_now,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
