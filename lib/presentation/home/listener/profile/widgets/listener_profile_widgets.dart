import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ProfileSectionCard extends StatelessWidget {
  const ProfileSectionCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.gradient,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient,
        color: gradient == null ? ListenerProfileTheme.cardFill : null,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}

class ProfileSectionHeader extends StatelessWidget {
  const ProfileSectionHeader({
    super.key,
    required this.title,
    this.trailing,
    this.onEdit,
    this.editLabel,
  });

  final String title;
  final Widget? trailing;
  final VoidCallback? onEdit;
  final String? editLabel;

  @override
  Widget build(BuildContext context) {
    return Row(
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
        if (trailing != null)
          trailing!
        else if (onEdit != null)
          ProfileEditButton(label: editLabel ?? 'Edit', onTap: onEdit!),
      ],
    );
  }
}

class ProfileEditButton extends StatelessWidget {
  const ProfileEditButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: ListenerProfileTheme.accent,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: const Icon(Icons.edit_outlined, size: 16),
      label: Text(
        label,
        style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600),
      ),
    );
  }
}

class ProfileHeaderCard extends StatelessWidget {
  const ProfileHeaderCard({
    super.key,
    required this.name,
    required this.rating,
    required this.reviewCount,
    required this.statusLabel,
    this.email,
    this.dateOfBirth,
    this.onEditPhoto,
  });

  final String name;
  final double rating;
  final int reviewCount;
  final String statusLabel;

  /// Read-only account email — not editable from this card.
  final String? email;

  /// Read-only date of birth — not editable from this card.
  final String? dateOfBirth;

  final VoidCallback? onEditPhoto;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final hasReadOnlyInfo = email != null || dateOfBirth != null;

    return ProfileSectionCard(
      padding: EdgeInsets.zero,
      gradient: ListenerProfileTheme.headerGradient,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 18, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Avatar(
                  onEditPhoto: onEditPhoto,
                  initials: name.characters.first,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              name,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.verified_rounded,
                            color: ListenerProfileTheme.accent,
                            size: 18,
                          ),
                        ],
                      ),

                      const SizedBox(height: 6),
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: ListenerProfileTheme.success,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            statusLabel,
                            style: GoogleFonts.inter(
                              color: ListenerProfileTheme.success,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: ListenerProfileTheme.gold,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${rating.toStringAsFixed(1)} (${l10n.listener_profile_reviews_count(reviewCount)})',
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.88),
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (hasReadOnlyInfo) ...[
              const SizedBox(height: 14),
              Divider(height: 1, color: Colors.white.withValues(alpha: 0.08)),
              const SizedBox(height: 12),
              if (email != null)
                _ReadOnlyInfoRow(
                  icon: Icons.email_outlined,
                  label: l10n.listener_profile_email,
                  value: email!,
                ),
              if (email != null && dateOfBirth != null)
                const SizedBox(height: 10),
              if (dateOfBirth != null)
                _ReadOnlyInfoRow(
                  icon: Icons.cake_outlined,
                  label: l10n.listener_profile_date_of_birth,
                  value: dateOfBirth!,
                ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ReadOnlyInfoRow extends StatelessWidget {
  const _ReadOnlyInfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 16, color: ListenerProfileTheme.muted),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.inter(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({required this.onEditPhoto, required this.initials});

  final VoidCallback? onEditPhoto;
  final String initials;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 72,
          height: 72,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF8B74EF), Color(0xFF5A3DB8)],
            ),
            border: Border.all(color: Colors.white.withValues(alpha: 0.12)),
          ),
          alignment: Alignment.center,
          child: Text(
            initials.toUpperCase(),
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        Positioned(
          right: -2,
          bottom: -2,
          child: GestureDetector(
            onTap: onEditPhoto,
            child: Container(
              width: 26,
              height: 26,
              decoration: BoxDecoration(
                color: ListenerProfileTheme.success,
                shape: BoxShape.circle,
                border: Border.all(
                  color: ListenerProfileTheme.cardFill,
                  width: 2,
                ),
              ),
              child: const Icon(Icons.edit, size: 13, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileVoiceIntroSection extends StatelessWidget {
  const ProfileVoiceIntroSection({
    super.key,
    required this.title,
    required this.editLabel,
    required this.durationLabel,
    required this.isPlaying,
    required this.onEdit,
    required this.onPlayToggle,
  });

  final String title;
  final String editLabel;
  final String durationLabel;
  final bool isPlaying;
  final VoidCallback onEdit;
  final VoidCallback onPlayToggle;

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileSectionHeader(
            title: title,
            editLabel: editLabel,
            onEdit: onEdit,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              GestureDetector(
                onTap: onPlayToggle,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: const BoxDecoration(
                    color: ListenerProfileTheme.accent,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SizedBox(
                  height: 36,
                  child: CustomPaint(
                    painter: _WaveformPainter(seed: 7, active: isPlaying),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                durationLabel,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileAboutMeSection extends StatelessWidget {
  const ProfileAboutMeSection({
    super.key,
    required this.title,
    required this.editLabel,
    required this.body,
    required this.seeMoreLabel,
    required this.seeLessLabel,
    required this.expanded,
    required this.onEdit,
    required this.onToggleExpanded,
  });

  final String title;
  final String editLabel;
  final String body;
  final String seeMoreLabel;
  final String seeLessLabel;
  final bool expanded;
  final VoidCallback onEdit;
  final VoidCallback onToggleExpanded;

  @override
  Widget build(BuildContext context) {
    return ProfileSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileSectionHeader(
            title: title,
            editLabel: editLabel,
            onEdit: onEdit,
          ),
          const SizedBox(height: 12),
          Text(
            body,
            maxLines: expanded ? null : 3,
            overflow: expanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.82),
              fontSize: 14,
              height: 1.55,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: onToggleExpanded,
            child: Text(
              expanded ? seeLessLabel : seeMoreLabel,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.accent,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileGoodAtSection extends StatelessWidget {
  const ProfileGoodAtSection({
    super.key,
    required this.title,
    required this.editLabel,
    required this.tags,
    required this.onEdit,
    this.emptyLabel,
  });

  final String title;
  final String editLabel;
  final List<String> tags;
  final VoidCallback onEdit;
  final String? emptyLabel;

  @override
  Widget build(BuildContext context) {
    final resolvedEmpty =
        emptyLabel ??
        VentingMobLocalizations.of(context).listener_profile_experiences_empty;

    return ProfileSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileSectionHeader(
            title: title,
            editLabel: editLabel,
            onEdit: onEdit,
          ),
          const SizedBox(height: 14),
          if (tags.isEmpty)
            Text(
              resolvedEmpty,
              style: GoogleFonts.inter(
                color: ListenerProfileTheme.muted,
                fontSize: 13,
                height: 1.4,
              ),
            )
          else
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [for (final tag in tags) _TagChip(label: tag)],
            ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFF241E32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: ListenerProfileTheme.cardBorder),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: Colors.white.withValues(alpha: 0.9),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class ProfileDetailRow extends StatelessWidget {
  const ProfileDetailRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.editLabel,
    required this.onEdit,
    this.showDivider = true,
  });

  final IconData icon;
  final String label;
  final String value;
  final String editLabel;
  final VoidCallback onEdit;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Icon(icon, size: 20, color: ListenerProfileTheme.accent),
              const SizedBox(width: 12),
              Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              ProfileEditButton(label: editLabel, onTap: onEdit),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1, color: Colors.white.withValues(alpha: 0.06)),
      ],
    );
  }
}

class ProfileReviewsSection extends StatelessWidget {
  const ProfileReviewsSection({
    super.key,
    required this.title,
    required this.viewAllLabel,
    required this.rating,
    required this.reviewCount,
    required this.distribution,
    required this.onViewAll,
  });

  final String title;
  final String viewAllLabel;
  final double rating;
  final int reviewCount;
  final List<int> distribution;
  final VoidCallback onViewAll;

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final maxCount = distribution.reduce(math.max);

    return ProfileSectionCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileSectionHeader(
            title: title,
            trailing: TextButton(
              onPressed: onViewAll,
              style: TextButton.styleFrom(
                foregroundColor: ListenerProfileTheme.accent,
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                viewAllLabel,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: List.generate(
                      5,
                      (_) => const Icon(
                        Icons.star_rounded,
                        color: ListenerProfileTheme.gold,
                        size: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    l10n.listener_profile_reviews_count(reviewCount),
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: List.generate(5, (index) {
                    final stars = 5 - index;
                    final count = distribution[index];
                    final fraction = maxCount == 0 ? 0.0 : count / maxCount;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        children: [
                          Text(
                            '$stars',
                            style: GoogleFonts.inter(
                              color: ListenerProfileTheme.muted,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: LinearProgressIndicator(
                                value: fraction,
                                minHeight: 6,
                                backgroundColor: const Color(0xFF2A2238),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  stars >= 4
                                      ? ListenerProfileTheme.accent
                                      : ListenerProfileTheme.muted.withValues(
                                          alpha: 0.35,
                                        ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 28,
                            child: Text(
                              '$count',
                              textAlign: TextAlign.end,
                              style: GoogleFonts.inter(
                                color: ListenerProfileTheme.muted,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  const _WaveformPainter({required this.seed, required this.active});

  final int seed;
  final bool active;

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random(seed);
    const barCount = 36;
    final barWidth = size.width / (barCount * 1.8);
    final gap = barWidth * 0.8;

    for (var i = 0; i < barCount; i++) {
      final normalized = random.nextDouble();
      final heightFactor = 0.25 + normalized * 0.75;
      final barHeight = size.height * heightFactor;
      final x = i * (barWidth + gap);
      final y = (size.height - barHeight) / 2;

      final paint = Paint()
        ..color = active
            ? SplashColors.purpleMid.withValues(alpha: 0.55 + normalized * 0.45)
            : SplashColors.purpleMid.withValues(
                alpha: 0.25 + normalized * 0.35,
              );

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          Radius.circular(barWidth / 2),
        ),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) =>
      oldDelegate.active != active;
}
