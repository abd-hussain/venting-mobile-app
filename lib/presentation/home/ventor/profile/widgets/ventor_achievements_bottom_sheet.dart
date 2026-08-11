import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/widgets/ventor_profile_widgets.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Shows all achievements with longer descriptions.
Future<void> showVentorAchievementsBottomSheet({
  required BuildContext context,
  required List<VentorAchievement> achievements,
  String? highlightedId,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: VentorProfileTheme.cardFill,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => VentorAchievementsBottomSheet(
      achievements: achievements,
      highlightedId: highlightedId,
    ),
  );
}

class VentorAchievementsBottomSheet extends StatelessWidget {
  const VentorAchievementsBottomSheet({
    super.key,
    required this.achievements,
    this.highlightedId,
  });

  final List<VentorAchievement> achievements;
  final String? highlightedId;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final unlockedCount = achievements.where((a) => a.unlocked).length;

    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16, 12, 16, 16 + bottomInset),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            const SizedBox(height: 16),
            Text(
              l10n.ventor_profile_achievements,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              l10n.ventor_profile_achievements_subtitle(
                unlockedCount,
                achievements.length,
              ),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 13,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.62,
              ),
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: achievements.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = achievements[index];
                  return _AchievementDetailCard(
                    achievement: item,
                    unlockedLabel: l10n.ventor_profile_achievement_unlocked,
                    lockedLabel: l10n.ventor_profile_achievement_locked,
                    highlighted: item.id == highlightedId,
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

class _AchievementDetailCard extends StatelessWidget {
  const _AchievementDetailCard({
    required this.achievement,
    required this.unlockedLabel,
    required this.lockedLabel,
    required this.highlighted,
  });

  final VentorAchievement achievement;
  final String unlockedLabel;
  final String lockedLabel;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final color = achievement.unlocked
        ? achievement.color
        : VentorProfileTheme.muted.withValues(alpha: 0.55);
    final statusLabel = achievement.unlocked ? unlockedLabel : lockedLabel;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
      decoration: BoxDecoration(
        color: SplashColors.backgroundBottom.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: highlighted
              ? SplashColors.purpleMid.withValues(alpha: 0.7)
              : VentorProfileTheme.cardBorder,
          width: highlighted ? 1.5 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 56,
            height: 62,
            child: CustomPaint(
              painter: _SheetHexagonPainter(
                fill: color.withValues(
                  alpha: achievement.unlocked ? 0.22 : 0.1,
                ),
                stroke: color,
              ),
              child: Center(
                child: Icon(
                  achievement.unlocked
                      ? achievement.icon
                      : Icons.lock_outline_rounded,
                  color: color,
                  size: 22,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        achievement.title,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: achievement.unlocked
                            ? VentorProfileTheme.success.withValues(alpha: 0.16)
                            : Colors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        statusLabel,
                        style: GoogleFonts.inter(
                          color: achievement.unlocked
                              ? VentorProfileTheme.success
                              : VentorProfileTheme.muted,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  achievement.subtitle,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  achievement.description,
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SheetHexagonPainter extends CustomPainter {
  _SheetHexagonPainter({required this.fill, required this.stroke});

  final Color fill;
  final Color stroke;

  @override
  void paint(Canvas canvas, Size size) {
    final path = _hexPath(size);
    canvas.drawPath(path, Paint()..color = fill);
    canvas.drawPath(
      path,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.6
        ..color = stroke,
    );
  }

  Path _hexPath(Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final r = math.min(size.width, size.height) / 2 - 1;
    final path = Path();
    for (var i = 0; i < 6; i++) {
      final angle = -math.pi / 2 + i * math.pi / 3;
      final x = cx + r * math.cos(angle);
      final y = cy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _SheetHexagonPainter oldDelegate) {
    return oldDelegate.fill != fill || oldDelegate.stroke != stroke;
  }
}
