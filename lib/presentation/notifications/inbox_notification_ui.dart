import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer_manager/shimmer_manager.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

abstract final class InboxNotificationUi {
  static IconData iconFor(AppNotificationType type) {
    return switch (type) {
      AppNotificationType.welcome => Icons.waving_hand_rounded,
      AppNotificationType.completeRegistration => Icons.edit_note_rounded,
      AppNotificationType.bookFirstSession => Icons.event_available_rounded,
      AppNotificationType.sessionRequest => Icons.headphones_rounded,
      AppNotificationType.sessionReminder => Icons.schedule_rounded,
      AppNotificationType.review => Icons.star_rounded,
      AppNotificationType.payout => Icons.payments_rounded,
      AppNotificationType.rewards => Icons.card_giftcard_rounded,
      AppNotificationType.system => Icons.info_outline_rounded,
    };
  }

  static Color iconColorFor(AppNotificationType type) {
    return switch (type) {
      AppNotificationType.welcome => SplashColors.purpleMid,
      AppNotificationType.completeRegistration => ListenerProfileTheme.gold,
      AppNotificationType.bookFirstSession => ListenerProfileTheme.success,
      AppNotificationType.sessionRequest => SplashColors.purpleMid,
      AppNotificationType.sessionReminder => ListenerProfileTheme.gold,
      AppNotificationType.review => ListenerProfileTheme.gold,
      AppNotificationType.payout => ListenerProfileTheme.success,
      AppNotificationType.rewards => ListenerProfileTheme.gold,
      AppNotificationType.system => ListenerProfileTheme.muted,
    };
  }
}

class InboxNotificationCard extends StatelessWidget {
  const InboxNotificationCard({
    super.key,
    required this.item,
    required this.timeLabel,
    required this.onTap,
  });

  final AppNotification item;
  final String timeLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final icon = InboxNotificationUi.iconFor(item.type);
    final iconColor = InboxNotificationUi.iconColorFor(item.type);

    return Material(
      color: item.isRead
          ? ListenerProfileTheme.cardFill
          : SplashColors.purpleMid.withValues(alpha: 0.1),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: item.isRead
                  ? ListenerProfileTheme.cardBorder
                  : SplashColors.purpleMid.withValues(alpha: 0.35),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 20),
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
                            item.title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: item.isRead
                                  ? FontWeight.w600
                                  : FontWeight.w700,
                            ),
                          ),
                        ),
                        if (!item.isRead)
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: SplashColors.purpleMid,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item.body,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 13,
                        height: 1.35,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      timeLabel,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted.withValues(
                          alpha: 0.8,
                        ),
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InboxNotificationsShimmer extends StatelessWidget {
  const InboxNotificationsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withValues(alpha: 0.08),
      highlightColor: Colors.white.withValues(alpha: 0.16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 132,
                height: 32,
                decoration: BoxDecoration(
                  color: ListenerProfileTheme.cardFill,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: ListenerProfileTheme.cardBorder),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
              itemCount: 6,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (_, __) => const _InboxNotificationCardShimmer(),
            ),
          ),
        ],
      ),
    );
  }
}

class _InboxNotificationCardShimmer extends StatelessWidget {
  const _InboxNotificationCardShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _InboxShimmerBox(width: 40, height: 40, radius: 12),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _InboxShimmerLine(width: double.infinity, height: 14),
                SizedBox(height: 8),
                _InboxShimmerLine(width: double.infinity, height: 12),
                SizedBox(height: 6),
                _InboxShimmerLine(width: 168, height: 12),
                SizedBox(height: 10),
                _InboxShimmerLine(width: 64, height: 11),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InboxShimmerLine extends StatelessWidget {
  const _InboxShimmerLine({required this.width, required this.height});

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}

class _InboxShimmerBox extends StatelessWidget {
  const _InboxShimmerBox({
    required this.width,
    required this.height,
    required this.radius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}

String inboxNotificationTimeLabel(DateTime date, VentingMobLocalizations l10n) {
  final now = DateTime.now();
  final diff = now.difference(date);
  if (diff.inMinutes < 1) {
    return l10n.listener_dashboard_notifications_just_now;
  }
  if (diff.inMinutes < 60) {
    return l10n.listener_dashboard_notifications_minutes_ago(diff.inMinutes);
  }
  if (diff.inHours < 24) {
    return l10n.listener_dashboard_notifications_hours_ago(diff.inHours);
  }
  if (diff.inDays < 7) {
    return l10n.listener_dashboard_notifications_days_ago(diff.inDays);
  }
  return '${date.day}/${date.month}/${date.year}';
}
