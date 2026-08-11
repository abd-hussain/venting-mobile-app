import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorAchievement {
  const VentorAchievement({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.icon,
    this.unlocked = true,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final IconData icon;
  final bool unlocked;
}

class VentorFavoriteListener {
  const VentorFavoriteListener({
    required this.id,
    required this.name,
    required this.rating,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final double rating;
  final String? avatarUrl;
}

/// Mood values: 0 = sad, 0.5 = neutral, 1 = happy.
class VentorMoodPoint {
  const VentorMoodPoint({required this.dayIndex, required this.mood});

  final int dayIndex;
  final double mood;
}

class VentorProfileHeader extends StatelessWidget {
  const VentorProfileHeader({
    super.key,
    required this.name,
    required this.quote,
    required this.anonymousLabel,
    required this.onEditPhoto,
    required this.onEditProfile,
    required this.onOpenSettings,
    this.avatarUrl,
    this.avatarFilePath,
    this.isAnonymous = true,
  });

  final String name;
  final String quote;
  final String anonymousLabel;
  final String? avatarUrl;
  final String? avatarFilePath;
  final bool isAnonymous;
  final VoidCallback onEditPhoto;
  final VoidCallback onEditProfile;
  final VoidCallback onOpenSettings;

  Widget _buildAvatar() {
    final path = avatarFilePath;
    if (path != null && path.isNotEmpty) {
      return Image.file(
        File(path),
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const ColoredBox(
          color: Color(0xFF2A1848),
          child: Icon(Icons.person_rounded, color: Colors.white70, size: 48),
        ),
      );
    }
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return Image.network(
        avatarUrl!,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const ColoredBox(
          color: Color(0xFF2A1848),
          child: Icon(Icons.person_rounded, color: Colors.white70, size: 48),
        ),
      );
    }
    return const ColoredBox(
      color: Color(0xFF2A1848),
      child: Icon(Icons.person_rounded, color: Colors.white70, size: 48),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            IconButton(
              onPressed: onEditProfile,
              icon: const Icon(Icons.edit_outlined, size: 20),
              color: Colors.white.withValues(alpha: 0.9),
            ),
            IconButton(
              onPressed: onOpenSettings,
              icon: const Icon(Icons.settings_outlined, size: 22),
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ],
        ),
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: SplashColors.purpleMid.withValues(alpha: 0.55),
                  width: 2.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: SplashColors.purpleGlow.withValues(alpha: 0.25),
                    blurRadius: 20,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipOval(child: _buildAvatar()),
            ),
            Positioned(
              right: -2,
              bottom: -2,
              child: Material(
                color: SplashColors.purpleMid,
                shape: const CircleBorder(),
                child: InkWell(
                  customBorder: const CircleBorder(),
                  onTap: onEditPhoto,
                  child: const Padding(
                    padding: EdgeInsets.all(7),
                    child: Icon(
                      Icons.photo_camera_rounded,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          name,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        if (isAnonymous) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: SplashColors.purpleMid.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: SplashColors.purpleMid.withValues(alpha: 0.35),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.masks_outlined,
                  size: 15,
                  color: SplashColors.purpleMid.withValues(alpha: 0.95),
                ),
                const SizedBox(width: 6),
                Text(
                  anonymousLabel,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 14),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
          decoration: BoxDecoration(
            color: SplashColors.purpleMid.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: SplashColors.purpleMid.withValues(alpha: 0.22),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.favorite_rounded,
                color: SplashColors.purpleMid,
                size: 16,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  quote,
                  style: GoogleFonts.inter(
                    color: Colors.white.withValues(alpha: 0.88),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VentorStatsRow extends StatelessWidget {
  const VentorStatsRow({
    super.key,
    required this.sessionsLabel,
    required this.sessionsValue,
    required this.streakLabel,
    required this.streakValue,
  });

  final String sessionsLabel;
  final String sessionsValue;
  final String streakLabel;
  final String streakValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.person_outline_rounded,
            iconColor: SplashColors.purpleMid,
            label: sessionsLabel,
            value: sessionsValue,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _StatCard(
            icon: Icons.local_fire_department_rounded,
            iconColor: const Color(0xFFF97316),
            label: streakLabel,
            value: streakValue,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.icon,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 14, 10, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: Column(
          children: [
            Icon(icon, color: iconColor, size: 22),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class VentorMoodJourneyCard extends StatelessWidget {
  const VentorMoodJourneyCard({
    super.key,
    required this.title,
    required this.todayLabel,
    required this.dayLabels,
    required this.points,
    required this.todayIndex,
  });

  final String title;
  final String todayLabel;
  final List<String> dayLabels;
  final List<VentorMoodPoint> points;
  final int todayIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(18),
      child: Container(
        padding: const EdgeInsets.fromLTRB(14, 14, 14, 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('😊', style: TextStyle(fontSize: 16)),
                      Text('😐', style: TextStyle(fontSize: 16)),
                      Text('😢', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: CustomPaint(
                            painter: _MoodLinePainter(
                              points: points,
                              todayIndex: todayIndex,
                              todayLabel: todayLabel,
                            ),
                            child: const SizedBox.expand(),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            for (var i = 0; i < dayLabels.length; i++)
                              Expanded(
                                child: Text(
                                  dayLabels[i],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                    color: i == todayIndex
                                        ? SplashColors.purpleMid
                                        : VentorProfileTheme.muted,
                                    fontSize: 11,
                                    fontWeight: i == todayIndex
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MoodLinePainter extends CustomPainter {
  _MoodLinePainter({
    required this.points,
    required this.todayIndex,
    required this.todayLabel,
  });

  final List<VentorMoodPoint> points;
  final int todayIndex;
  final String todayLabel;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final sorted = [...points]
      ..sort((a, b) => a.dayIndex.compareTo(b.dayIndex));
    final n = 7;
    Offset pointAt(VentorMoodPoint p) {
      final x = (p.dayIndex.clamp(0, n - 1) / (n - 1)) * size.width;
      final y = (1 - p.mood.clamp(0.0, 1.0)) * size.height;
      return Offset(x, y);
    }

    final path = Path();
    for (var i = 0; i < sorted.length; i++) {
      final o = pointAt(sorted[i]);
      if (i == 0) {
        path.moveTo(o.dx, o.dy);
      } else {
        path.lineTo(o.dx, o.dy);
      }
    }

    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = ui.Gradient.linear(Offset.zero, Offset(size.width, 0), [
        SplashColors.purpleLight,
        SplashColors.purpleMid,
      ]);
    canvas.drawPath(path, linePaint);

    for (final p in sorted) {
      final o = pointAt(p);
      final isToday = p.dayIndex == todayIndex;
      canvas.drawCircle(
        o,
        isToday ? 5.5 : 4,
        Paint()..color = SplashColors.purpleMid,
      );
      canvas.drawCircle(o, isToday ? 3 : 2, Paint()..color = Colors.white);

      if (isToday) {
        final tp = TextPainter(
          text: TextSpan(
            text: todayLabel,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w700,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();
        final pillW = tp.width + 14;
        final pillH = tp.height + 8;
        final pillRect = RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(o.dx, o.dy - 18),
            width: pillW,
            height: pillH,
          ),
          const Radius.circular(999),
        );
        canvas.drawRRect(pillRect, Paint()..color = SplashColors.purpleMid);
        tp.paint(
          canvas,
          Offset(o.dx - tp.width / 2, o.dy - 18 - tp.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant _MoodLinePainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.todayIndex != todayIndex ||
        oldDelegate.todayLabel != todayLabel;
  }
}

class VentorAchievementsSection extends StatelessWidget {
  const VentorAchievementsSection({
    super.key,
    required this.title,
    required this.seeAllLabel,
    required this.achievements,
    required this.onSeeAll,
    required this.onTapAchievement,
  });

  final String title;
  final String seeAllLabel;
  final List<VentorAchievement> achievements;
  final VoidCallback onSeeAll;
  final ValueChanged<VentorAchievement> onTapAchievement;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: onSeeAll,
              style: TextButton.styleFrom(
                foregroundColor: SplashColors.purpleMid,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                seeAllLabel,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 118,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: achievements.length,
            separatorBuilder: (_, _) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = achievements[index];
              return _AchievementBadge(
                achievement: item,
                onTap: () => onTapAchievement(item),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({required this.achievement, required this.onTap});

  final VentorAchievement achievement;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = achievement.unlocked
        ? achievement.color
        : VentorProfileTheme.muted.withValues(alpha: 0.45);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 86,
        child: Column(
          children: [
            SizedBox(
              width: 64,
              height: 70,
              child: CustomPaint(
                painter: _HexagonPainter(
                  fill: color.withValues(
                    alpha: achievement.unlocked ? 0.22 : 0.12,
                  ),
                  stroke: color,
                ),
                child: Center(
                  child: Icon(
                    achievement.unlocked
                        ? achievement.icon
                        : Icons.lock_outline_rounded,
                    color: color,
                    size: 24,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              achievement.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              achievement.subtitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HexagonPainter extends CustomPainter {
  _HexagonPainter({required this.fill, required this.stroke});

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
  bool shouldRepaint(covariant _HexagonPainter oldDelegate) {
    return oldDelegate.fill != fill || oldDelegate.stroke != stroke;
  }
}

class VentorPointsCard extends StatelessWidget {
  const VentorPointsCard({
    super.key,
    required this.pointsLabel,
    required this.viewRewardsLabel,
    required this.onViewRewards,
  });

  final String pointsLabel;
  final String viewRewardsLabel;
  final VoidCallback onViewRewards;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2A1848), Color(0xFF1C1826)],
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: VentorProfileTheme.gold,
                      size: 28,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        pointsLabel,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: 42,
                  child: FilledButton(
                    onPressed: onViewRewards,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(viewRewardsLabel),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const _GiftIllustration(),
        ],
      ),
    );
  }
}

class _GiftIllustration extends StatelessWidget {
  const _GiftIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 54,
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: SplashColors.brandGradient,
              boxShadow: [
                BoxShadow(
                  color: SplashColors.purpleGlow.withValues(alpha: 0.3),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            child: Container(
              width: 62,
              height: 14,
              decoration: BoxDecoration(
                color: SplashColors.purpleLight.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          Container(
            width: 10,
            height: 46,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.35),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Positioned(
            top: 2,
            child: Icon(
              Icons.card_giftcard_rounded,
              color: Colors.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class VentorMyListenersSection extends StatelessWidget {
  const VentorMyListenersSection({
    super.key,
    required this.title,
    required this.seeAllLabel,
    required this.addFavoriteLabel,
    required this.listeners,
    required this.onSeeAll,
    required this.onAddFavorite,
    required this.onTapListener,
  });

  final String title;
  final String seeAllLabel;
  final String addFavoriteLabel;
  final List<VentorFavoriteListener> listeners;
  final VoidCallback onSeeAll;
  final VoidCallback onAddFavorite;
  final ValueChanged<VentorFavoriteListener> onTapListener;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: onSeeAll,
              style: TextButton.styleFrom(
                foregroundColor: SplashColors.purpleMid,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                seeAllLabel,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 108,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listeners.length + 1,
            separatorBuilder: (_, _) => const SizedBox(width: 14),
            itemBuilder: (context, index) {
              if (index == listeners.length) {
                return _AddFavoriteChip(
                  label: addFavoriteLabel,
                  onTap: onAddFavorite,
                );
              }
              final listener = listeners[index];
              return _ListenerChip(
                listener: listener,
                onTap: () => onTapListener(listener),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ListenerChip extends StatelessWidget {
  const _ListenerChip({required this.listener, required this.onTap});

  final VentorFavoriteListener listener;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 76,
        child: Column(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: SplashColors.purpleMid.withValues(alpha: 0.4),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: listener.avatarUrl == null
                    ? ColoredBox(
                        color: const Color(0xFF2A1848),
                        child: Center(
                          child: Text(
                            listener.name.isEmpty
                                ? '?'
                                : listener.name.substring(0, 1).toUpperCase(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : Image.network(listener.avatarUrl!, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              listener.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  listener.rating.toStringAsFixed(1),
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 3),
                const Icon(
                  Icons.favorite_rounded,
                  size: 11,
                  color: SplashColors.purpleMid,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddFavoriteChip extends StatelessWidget {
  const _AddFavoriteChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 76,
        child: Column(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: CustomPaint(
                painter: _DashedCirclePainter(
                  color: VentorProfileTheme.muted.withValues(alpha: 0.55),
                ),
                child: const Center(
                  child: Icon(
                    Icons.add_rounded,
                    color: VentorProfileTheme.muted,
                    size: 28,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  _DashedCirclePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.shortestSide / 2 - 1;
    const dashCount = 18;
    const dashSweep = (2 * math.pi) / dashCount * 0.55;
    const gapSweep = (2 * math.pi) / dashCount * 0.45;
    var start = -math.pi / 2;
    for (var i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        start,
        dashSweep,
        false,
        paint,
      );
      start += dashSweep + gapSweep;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedCirclePainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

/// Helper to build localized achievement mocks.
List<VentorAchievement> ventorMockAchievements(VentingMobLocalizations l10n) {
  return [
    VentorAchievement(
      id: 'first_step',
      title: l10n.ventor_profile_achievement_first_step,
      subtitle: l10n.ventor_profile_achievement_first_step_desc,
      description: l10n.ventor_profile_achievement_first_step_detail,
      color: VentorProfileTheme.gold,
      icon: Icons.emoji_events_rounded,
    ),
    VentorAchievement(
      id: 'be_heard',
      title: l10n.ventor_profile_achievement_be_heard,
      subtitle: l10n.ventor_profile_achievement_be_heard_desc,
      description: l10n.ventor_profile_achievement_be_heard_detail,
      color: SplashColors.purpleMid,
      icon: Icons.hearing_rounded,
    ),
    VentorAchievement(
      id: 'week_warrior',
      title: l10n.ventor_profile_achievement_week_warrior,
      subtitle: l10n.ventor_profile_achievement_week_warrior_desc,
      description: l10n.ventor_profile_achievement_week_warrior_detail,
      color: const Color(0xFF14B8A6),
      icon: Icons.local_fire_department_rounded,
    ),
    VentorAchievement(
      id: 'active_mind',
      title: l10n.ventor_profile_achievement_active_mind,
      subtitle: l10n.ventor_profile_achievement_active_mind_desc,
      description: l10n.ventor_profile_achievement_active_mind_detail,
      color: VentorProfileTheme.muted,
      icon: Icons.psychology_alt_rounded,
      unlocked: false,
    ),
  ];
}
