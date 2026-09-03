import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerDashboardHeader extends StatelessWidget {
  const ListenerDashboardHeader({
    super.key,
    required this.greeting,
    required this.subtitle,
    required this.hasNotifications,
    required this.onNotifications,
  });

  final String greeting;
  final String subtitle;
  final bool hasNotifications;
  final VoidCallback onNotifications;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 14,
                  height: 1.35,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: onNotifications,
          style: IconButton.styleFrom(
            backgroundColor: Colors.white.withValues(alpha: 0.06),
            fixedSize: const Size(44, 44),
          ),
          icon: Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                color: Colors.white,
                size: 22,
              ),
              if (hasNotifications)
                Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEF4444),
                      shape: BoxShape.circle,
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

class ListenerDashboardAvailabilityCard extends StatelessWidget {
  const ListenerDashboardAvailabilityCard({
    super.key,
    required this.isOnline,
    required this.currentlyLabel,
    required this.availableLabel,
    required this.offlineLabel,
    required this.acceptingLabel,
    required this.pausedLabel,
    required this.goOfflineLabel,
    required this.goOnlineLabel,
    required this.onToggle,
    this.canGoOnline = true,
    this.blockedFootnote,
  });

  final bool isOnline;
  final bool canGoOnline;
  final String currentlyLabel;
  final String availableLabel;
  final String offlineLabel;
  final String acceptingLabel;
  final String pausedLabel;
  final String goOfflineLabel;
  final String goOnlineLabel;
  final String? blockedFootnote;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
    final statusColor = isOnline
        ? ListenerProfileTheme.success
        : ListenerProfileTheme.muted;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentlyLabel,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                        boxShadow: isOnline
                            ? [
                                BoxShadow(
                                  color: statusColor.withValues(alpha: 0.55),
                                  blurRadius: 8,
                                ),
                              ]
                            : null,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isOnline ? availableLabel : offlineLabel,
                      style: GoogleFonts.inter(
                        color: statusColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  isOnline ? acceptingLabel : pausedLabel,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 12,
                  ),
                ),
                if (!canGoOnline && blockedFootnote != null) ...[
                  const SizedBox(height: 6),
                  Text(
                    blockedFootnote!,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 11,
                      height: 1.35,
                    ),
                  ),
                ],
              ],
            ),
          ),
          OutlinedButton(
            onPressed: onToggle,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white.withValues(alpha: 0.35)),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              isOnline ? goOfflineLabel : goOnlineLabel,
              style: GoogleFonts.inter(
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

class ListenerDashboardUpcomingCard extends StatelessWidget {
  const ListenerDashboardUpcomingCard({
    super.key,
    required this.title,
    required this.timeLabel,
    required this.durationLabel,
    required this.waitingLabel,
    required this.viewLabel,
    required this.avatarUrl,
    required this.ventorName,
    required this.onView,
  }) : emptyMessage = null;

  const ListenerDashboardUpcomingCard.empty({
    super.key,
    required this.title,
    required this.emptyMessage,
  }) : timeLabel = '',
       durationLabel = '',
       waitingLabel = '',
       viewLabel = '',
       avatarUrl = null,
       ventorName = '',
       onView = _noOp;

  static void _noOp() {}

  final String title;
  final String? emptyMessage;
  final String timeLabel;
  final String durationLabel;
  final String waitingLabel;
  final String viewLabel;
  final String? avatarUrl;
  final String ventorName;
  final VoidCallback onView;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 14, 12, 14),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(
                Icons.info_outline_rounded,
                size: 16,
                color: ListenerProfileTheme.muted,
              ),
            ],
          ),
          const SizedBox(height: 14),
          if (emptyMessage != null)
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 20,
                  color: ListenerProfileTheme.muted,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    emptyMessage!,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            )
          else
            Row(
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: avatarUrl != null && avatarUrl!.isNotEmpty
                        ? Image.network(avatarUrl!, fit: BoxFit.cover)
                        : ColoredBox(
                            color: SplashColors.purpleMid.withValues(
                              alpha: 0.35,
                            ),
                            child: Center(
                              child: Text(
                                ventorName.isNotEmpty
                                    ? ventorName[0].toUpperCase()
                                    : '?',
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        timeLabel,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        durationLabel,
                        style: GoogleFonts.inter(
                          color: ListenerProfileTheme.muted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        waitingLabel,
                        style: GoogleFonts.inter(
                          color: SplashColors.purpleMid,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: onView,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: BorderSide(
                      color: Colors.white.withValues(alpha: 0.35),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    viewLabel,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class ListenerDashboardReminderCard extends StatelessWidget {
  const ListenerDashboardReminderCard({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
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
                      Icons.favorite_rounded,
                      size: 16,
                      color: SplashColors.purpleMid,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      title,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  message,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          const _MugIllustration(),
        ],
      ),
    );
  }
}

class _MugIllustration extends StatelessWidget {
  const _MugIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 72,
      height: 72,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 8,
            right: 10,
            child: Icon(
              Icons.auto_awesome,
              size: 14,
              color: ListenerProfileTheme.gold.withValues(alpha: 0.9),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 6,
            child: Icon(
              Icons.star_rounded,
              size: 12,
              color: ListenerProfileTheme.gold.withValues(alpha: 0.7),
            ),
          ),
          Container(
            width: 44,
            height: 48,
            decoration: BoxDecoration(
              color: SplashColors.purpleMid.withValues(alpha: 0.28),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(8),
                bottom: Radius.circular(12),
              ),
              border: Border.all(
                color: SplashColors.purpleMid.withValues(alpha: 0.55),
              ),
            ),
            child: const Center(
              child: Icon(
                Icons.favorite_rounded,
                color: ListenerProfileTheme.gold,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
