import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorSessionsHeader extends StatelessWidget {
  const VentorSessionsHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.15,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          subtitle,
          style: GoogleFonts.inter(
            color: VentorProfileTheme.muted,
            fontSize: 14,
            height: 1.35,
          ),
        ),
      ],
    );
  }
}

class VentorSessionsSearchBar extends StatelessWidget {
  const VentorSessionsSearchBar({
    super.key,
    required this.controller,
    required this.hint,
    required this.onChanged,
    required this.onFilterTap,
    required this.filterActive,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;
  final VoidCallback onFilterTap;
  final bool filterActive;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: VentorProfileTheme.cardFill,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: VentorProfileTheme.cardBorder),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.search_rounded,
                  color: VentorProfileTheme.muted,
                  size: 22,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    cursorColor: SplashColors.purpleMid,
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: hint,
                      hintStyle: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                if (controller.text.isNotEmpty)
                  GestureDetector(
                    onTap: () {
                      controller.clear();
                      onChanged('');
                    },
                    child: const Icon(
                      Icons.close_rounded,
                      color: VentorProfileTheme.muted,
                      size: 18,
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Material(
          color: SplashColors.purpleMid,
          borderRadius: BorderRadius.circular(14),
          child: InkWell(
            onTap: onFilterTap,
            borderRadius: BorderRadius.circular(14),
            child: SizedBox(
              width: 48,
              height: 48,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(Icons.tune_rounded, color: Colors.white, size: 22),
                  if (filterActive)
                    Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: VentorProfileTheme.gold,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class VentorTopicChips extends StatelessWidget {
  const VentorTopicChips({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;
          return Material(
            color: selected
                ? SplashColors.purpleMid
                : VentorProfileTheme.cardFill,
            borderRadius: BorderRadius.circular(999),
            child: InkWell(
              onTap: () => onSelected(index),
              borderRadius: BorderRadius.circular(999),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: selected
                        ? SplashColors.purpleMid
                        : VentorProfileTheme.cardBorder,
                  ),
                ),
                child: Text(
                  labels[index],
                  style: GoogleFonts.inter(
                    color: selected ? Colors.white : VentorProfileTheme.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class VentorListenerCard extends StatelessWidget {
  const VentorListenerCard({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.ratingLabel,
    required this.experienceLabel,
    required this.country,
    required this.countryFlag,
    required this.languagesLabel,
    required this.topicsLabel,
    required this.isOnline,
    required this.isVerified,
    required this.isFavorite,
    required this.onTap,
    required this.onFavorite,
  });

  final String name;
  final String avatarUrl;
  final String ratingLabel;
  final String experienceLabel;
  final String country;
  final String countryFlag;
  final String languagesLabel;
  final String topicsLabel;
  final bool isOnline;
  final bool isVerified;
  final bool isFavorite;
  final VoidCallback onTap;
  final VoidCallback onFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 12, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: VentorProfileTheme.cardBorder),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(avatarUrl),
                    backgroundColor: SplashColors.purpleMid.withValues(
                      alpha: 0.25,
                    ),
                  ),
                  if (isOnline)
                    Positioned(
                      right: 2,
                      bottom: 2,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: VentorProfileTheme.success,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: VentorProfileTheme.cardFill,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                ],
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
                            name,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        if (isVerified) ...[
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.verified_rounded,
                            size: 16,
                            color: SplashColors.purpleMid,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          size: 15,
                          color: VentorProfileTheme.gold,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          ratingLabel,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            topicsLabel,
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
                    _MetaRow(
                      icon: Icons.auto_awesome_outlined,
                      text: experienceLabel,
                      allowWrap: true,
                    ),
                    const SizedBox(height: 4),
                    _MetaRow(
                      leading: Text(
                        countryFlag,
                        style: const TextStyle(fontSize: 14, height: 1),
                      ),
                      text: country,
                    ),
                    const SizedBox(height: 4),
                    _MetaRow(
                      icon: Icons.translate_rounded,
                      text: languagesLabel,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onFavorite,
                visualDensity: VisualDensity.compact,
                icon: Icon(
                  isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: isFavorite
                      ? SplashColors.purpleMid
                      : VentorProfileTheme.muted,
                  size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({
    required this.text,
    this.icon,
    this.leading,
    this.allowWrap = false,
  });

  final IconData? icon;
  final Widget? leading;
  final String text;
  final bool allowWrap;

  @override
  Widget build(BuildContext context) {
    final leadingWidget = leading;
    return Row(
      crossAxisAlignment: allowWrap
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        if (leadingWidget != null)
          Padding(
            padding: EdgeInsets.only(top: allowWrap ? 1 : 0),
            child: leadingWidget,
          )
        else if (icon != null)
          Padding(
            padding: EdgeInsets.only(top: allowWrap ? 1 : 0),
            child: Icon(icon, size: 14, color: VentorProfileTheme.muted),
          ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 12,
              height: 1.35,
            ),
            softWrap: allowWrap,
            maxLines: allowWrap ? null : 1,
            overflow: allowWrap ? TextOverflow.visible : TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class VentorSurpriseMeCard extends StatelessWidget {
  const VentorSurpriseMeCard({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.onTap,
  });

  final String title;
  final String buttonLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6D4AFF), Color(0xFF4B2FD4)],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 42,
                  child: FilledButton(
                    onPressed: onTap,
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: SplashColors.purpleMid,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      textStyle: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Text(buttonLabel),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.auto_awesome_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

class VentorSessionsSectionTabs extends StatelessWidget {
  const VentorSessionsSectionTabs({
    super.key,
    required this.findSelected,
    required this.findLabel,
    required this.bookedLabel,
    required this.onFind,
    required this.onBooked,
  });

  final bool findSelected;
  final String findLabel;
  final String bookedLabel;
  final VoidCallback onFind;
  final VoidCallback onBooked;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF15101F),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: _SessionsTabChip(
              label: findLabel,
              selected: findSelected,
              onTap: onFind,
            ),
          ),
          Expanded(
            child: _SessionsTabChip(
              label: bookedLabel,
              selected: !findSelected,
              onTap: onBooked,
            ),
          ),
        ],
      ),
    );
  }
}

class _SessionsTabChip extends StatelessWidget {
  const _SessionsTabChip({
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
      color: selected ? SplashColors.purpleMid : Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: selected ? Colors.white : VentorProfileTheme.muted,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class VentorBookedSessionCard extends StatelessWidget {
  const VentorBookedSessionCard({
    super.key,
    required this.listenerName,
    required this.avatarUrl,
    required this.statusLabel,
    required this.statusColor,
    required this.whenLabel,
    required this.metaLabel,
    required this.amountLabel,
    required this.onTap,
    this.actionLabel,
    this.onAction,
    this.isCancelled = false,
    this.refundTitle,
    this.refundSubtitle,
    this.rebookLabel,
    this.onRebook,
  });

  final String listenerName;
  final String avatarUrl;
  final String statusLabel;
  final Color statusColor;
  final String whenLabel;
  final String metaLabel;
  final String amountLabel;
  final VoidCallback onTap;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool isCancelled;
  final String? refundTitle;
  final String? refundSubtitle;
  final String? rebookLabel;
  final VoidCallback? onRebook;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: VentorProfileTheme.cardFill,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isCancelled
                  ? const Color(0xFFE57373).withValues(alpha: 0.45)
                  : VentorProfileTheme.cardBorder,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(avatarUrl),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listenerName,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          whenLabel,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.muted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.16),
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Text(
                      statusLabel,
                      style: GoogleFonts.inter(
                        color: statusColor,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                metaLabel,
                style: GoogleFonts.inter(
                  color: Colors.white.withValues(alpha: 0.88),
                  fontSize: 12,
                  height: 1.35,
                ),
              ),
              if (isCancelled &&
                  refundTitle != null &&
                  refundSubtitle != null) ...[
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: VentorProfileTheme.success.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: VentorProfileTheme.success.withValues(alpha: 0.35),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          color: VentorProfileTheme.success.withValues(
                            alpha: 0.18,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.account_balance_wallet_rounded,
                          color: VentorProfileTheme.success,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              refundTitle!,
                              style: GoogleFonts.inter(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              refundSubtitle!,
                              style: GoogleFonts.inter(
                                color: VentorProfileTheme.muted,
                                fontSize: 12,
                                height: 1.35,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              const SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    amountLabel,
                    style: GoogleFonts.inter(
                      color: isCancelled
                          ? VentorProfileTheme.muted
                          : SplashColors.purpleMid,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      decoration: isCancelled
                          ? TextDecoration.lineThrough
                          : null,
                    ),
                  ),
                  const Spacer(),
                  if (isCancelled && rebookLabel != null && onRebook != null)
                    SizedBox(
                      height: 36,
                      child: FilledButton.icon(
                        onPressed: onRebook,
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        icon: const Icon(Icons.refresh_rounded, size: 16),
                        label: Text(rebookLabel!),
                      ),
                    )
                  else if (actionLabel != null && onAction != null)
                    SizedBox(
                      height: 36,
                      child: FilledButton(
                        onPressed: onAction,
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Text(actionLabel!),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
