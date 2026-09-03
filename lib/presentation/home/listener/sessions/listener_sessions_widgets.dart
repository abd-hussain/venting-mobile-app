import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum ListenerSessionFilter { upcoming, missed, history }

enum ListenerSessionHistoryOutcome { accepted, declined }

class ListenerSessionItem {
  const ListenerSessionItem({
    required this.id,
    required this.scheduledAt,
    required this.durationMinutes,
    required this.ventorName,
    required this.message,
    required this.chosenReason,
    required this.tags,
    this.ventorAvatarUrl,
    this.speechLanguage,
    this.isWaiting = false,
    this.canJoinNow = false,
    this.isVideoCall = false,
    this.ventorRating = 4.9,
    this.statusLabel,
    this.sessionCost,
    this.isMissed = false,
    this.historyOutcome,
  });

  final String id;
  final DateTime scheduledAt;
  final int durationMinutes;
  final String ventorName;
  final String? ventorAvatarUrl;
  final String message;
  final String chosenReason;
  final List<String> tags;
  final String? speechLanguage;
  final bool isWaiting;
  final bool canJoinNow;
  final bool isVideoCall;
  final double ventorRating;
  final String? statusLabel;
  final double? sessionCost;
  final bool isMissed;
  final ListenerSessionHistoryOutcome? historyOutcome;

  double get penaltyAmount => sessionCost == null ? 0 : sessionCost! * 0.2;
}

class ListenerSessionRequest {
  const ListenerSessionRequest({
    required this.id,
    required this.ventorName,
    required this.message,
    required this.chosenReason,
    required this.scheduledAt,
    required this.durationMinutes,
    required this.tags,
    required this.receivedAt,
    required this.speechLanguage,
    this.ventorAvatarUrl,
    this.isVideoCall = false,
    this.ventorRating = 4.9,
  });

  final String id;
  final String ventorName;
  final String? ventorAvatarUrl;
  final String message;
  final String chosenReason;
  final DateTime scheduledAt;
  final int durationMinutes;
  final List<String> tags;
  final DateTime receivedAt;
  final String speechLanguage;
  final bool isVideoCall;
  final double ventorRating;
}

class ListenerSessionStats {
  const ListenerSessionStats({
    required this.acceptedCount,
    required this.declinedCount,
    required this.missedCount,
  });

  final int acceptedCount;
  final int declinedCount;
  final int missedCount;

  int get total => acceptedCount + declinedCount + missedCount;

  int get acceptedPercent =>
      total == 0 ? 0 : ((acceptedCount * 100) / total).round();

  int get declinedPercent =>
      total == 0 ? 0 : ((declinedCount * 100) / total).round();

  int get missedPercent =>
      total == 0 ? 0 : ((missedCount * 100) / total).round();
}

class ListenerSessionPenaltyNote extends StatelessWidget {
  const ListenerSessionPenaltyNote({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.gold.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ListenerProfileTheme.gold.withValues(alpha: 0.35),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info_outline_rounded,
            size: 18,
            color: ListenerProfileTheme.gold,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListenerSessionsFilterBar extends StatelessWidget {
  const ListenerSessionsFilterBar({
    super.key,
    required this.selected,
    required this.upcomingLabel,
    required this.missedLabel,
    required this.historyLabel,
    required this.onChanged,
  });

  final ListenerSessionFilter selected;
  final String upcomingLabel;
  final String missedLabel;
  final String historyLabel;
  final ValueChanged<ListenerSessionFilter> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF15101F),
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: _FilterChip(
              label: upcomingLabel,
              selected: selected == ListenerSessionFilter.upcoming,
              onTap: () => onChanged(ListenerSessionFilter.upcoming),
            ),
          ),
          Expanded(
            child: _FilterChip(
              label: missedLabel,
              selected: selected == ListenerSessionFilter.missed,
              onTap: () => onChanged(ListenerSessionFilter.missed),
            ),
          ),
          Expanded(
            child: _FilterChip(
              label: historyLabel,
              selected: selected == ListenerSessionFilter.history,
              onTap: () => onChanged(ListenerSessionFilter.history),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
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
                color: selected ? Colors.white : ListenerProfileTheme.muted,
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

class ListenerSessionStatsCard extends StatelessWidget {
  const ListenerSessionStatsCard({
    super.key,
    required this.title,
    required this.acceptedLabel,
    required this.declinedLabel,
    required this.missedLabel,
    required this.acceptedPercent,
    required this.declinedPercent,
    required this.missedPercent,
    required this.acceptedCount,
    required this.declinedCount,
    required this.missedCount,
  });

  final String title;
  final String acceptedLabel;
  final String declinedLabel;
  final String missedLabel;
  final int acceptedPercent;
  final int declinedPercent;
  final int missedPercent;
  final int acceptedCount;
  final int declinedCount;
  final int missedCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ListenerProfileTheme.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _StatColumn(
                  label: acceptedLabel,
                  percent: acceptedPercent,
                  count: acceptedCount,
                  color: ListenerProfileTheme.success,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatColumn(
                  label: declinedLabel,
                  percent: declinedPercent,
                  count: declinedCount,
                  color: const Color(0xFFEF4444),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatColumn(
                  label: missedLabel,
                  percent: missedPercent,
                  count: missedCount,
                  color: ListenerProfileTheme.gold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({
    required this.label,
    required this.percent,
    required this.count,
    required this.color,
  });

  final String label;
  final int percent;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$percent%',
            style: GoogleFonts.inter(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$count',
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class ListenerSessionCard extends StatelessWidget {
  const ListenerSessionCard({
    super.key,
    required this.ventorName,
    required this.message,
    required this.chosenReasonLabel,
    required this.chosenReason,
    required this.dateTimeLabel,
    required this.durationLabel,
    required this.tags,
    this.ventorAvatarUrl,
    this.headerLabel,
    this.headerTrailing,
    this.badgeLabel,
    this.waitingLabel,
    this.isWaiting = false,
    this.canJoinNow = false,
    this.isVideoCall = false,
    this.statusLabel,
    this.penaltyLabel,
    this.isMissed = false,
    this.historyOutcome,
    this.joinNowLabel,
    this.onJoinNow,
    this.declineLabel,
    this.acceptLabel,
    this.onDecline,
    this.onAccept,
    this.speechLanguageLabel,
    this.speechLanguage,
  });

  final String ventorName;
  final String? ventorAvatarUrl;
  final String message;
  final String chosenReasonLabel;
  final String chosenReason;
  final String dateTimeLabel;
  final String durationLabel;
  final List<String> tags;
  final String? headerLabel;
  final String? headerTrailing;
  final String? badgeLabel;
  final String? waitingLabel;
  final bool isWaiting;
  final bool canJoinNow;
  final bool isVideoCall;
  final String? statusLabel;
  final String? penaltyLabel;
  final bool isMissed;
  final ListenerSessionHistoryOutcome? historyOutcome;
  final String? joinNowLabel;
  final VoidCallback? onJoinNow;
  final String? declineLabel;
  final String? acceptLabel;
  final VoidCallback? onDecline;
  final VoidCallback? onAccept;
  final String? speechLanguageLabel;
  final String? speechLanguage;

  bool get _isRequest => onAccept != null && onDecline != null;

  Color? get _historyBorderColor {
    if (isMissed) return const Color(0xFFEF4444).withValues(alpha: 0.4);
    return switch (historyOutcome) {
      ListenerSessionHistoryOutcome.accepted =>
        ListenerProfileTheme.success.withValues(alpha: 0.35),
      ListenerSessionHistoryOutcome.declined => const Color(
        0xFFEF4444,
      ).withValues(alpha: 0.35),
      null => null,
    };
  }

  Color? get _statusColor {
    if (isMissed) return const Color(0xFFEF4444);
    return switch (historyOutcome) {
      ListenerSessionHistoryOutcome.accepted => ListenerProfileTheme.success,
      ListenerSessionHistoryOutcome.declined => const Color(0xFFEF4444),
      null => ListenerProfileTheme.muted,
    };
  }

  IconData? get _statusIcon {
    return switch (historyOutcome) {
      ListenerSessionHistoryOutcome.accepted =>
        Icons.check_circle_outline_rounded,
      ListenerSessionHistoryOutcome.declined => Icons.cancel_outlined,
      null => null,
    };
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = _historyBorderColor ?? ListenerProfileTheme.cardBorder;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (headerLabel != null || badgeLabel != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                children: [
                  if (badgeLabel != null) ...[
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: SplashColors.purpleMid.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: SplashColors.purpleMid.withValues(alpha: 0.55),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            isVideoCall
                                ? Icons.videocam_rounded
                                : Icons.phone_in_talk_rounded,
                            size: 13,
                            color: SplashColors.purpleMid,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            badgeLabel!,
                            style: GoogleFonts.inter(
                              color: SplashColors.purpleMid,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Text(
                      headerLabel ?? '',
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  if (headerTrailing != null)
                    Text(
                      headerTrailing!,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                ],
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _VentorAvatar(name: ventorName, avatarUrl: ventorAvatarUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ventorName,
                      style: GoogleFonts.inter(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '$dateTimeLabel · $durationLabel',
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (speechLanguage != null && speechLanguageLabel != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: SplashColors.purpleMid.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: SplashColors.purpleMid.withValues(alpha: 0.4),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.translate_rounded,
                    size: 18,
                    color: SplashColors.purpleMid,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          speechLanguageLabel!,
                          style: GoogleFonts.inter(
                            color: ListenerProfileTheme.muted,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          speechLanguage!,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
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
          Text(
            message,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.9),
              fontSize: 14,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            chosenReasonLabel,
            style: GoogleFonts.inter(
              color: ListenerProfileTheme.muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            chosenReason,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.85),
              fontSize: 13,
              height: 1.35,
            ),
          ),
          if (tags.isNotEmpty) ...[
            const SizedBox(height: 10),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: tags.map((tag) => _TagChip(label: tag)).toList(),
            ),
          ],
          if (isWaiting && waitingLabel != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                const Icon(
                  Icons.warning_amber_rounded,
                  size: 14,
                  color: ListenerProfileTheme.gold,
                ),
                const SizedBox(width: 4),
                Text(
                  waitingLabel!,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.gold,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
          if (statusLabel != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                if (_statusIcon != null) ...[
                  Icon(_statusIcon, size: 14, color: _statusColor),
                  const SizedBox(width: 4),
                ],
                Text(
                  statusLabel!,
                  style: GoogleFonts.inter(
                    color: _statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
          if (penaltyLabel != null) ...[
            const SizedBox(height: 4),
            Text(
              penaltyLabel!,
              style: GoogleFonts.inter(
                color: const Color(0xFFEF4444).withValues(alpha: 0.85),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
          if (canJoinNow && joinNowLabel != null && onJoinNow != null) ...[
            const SizedBox(height: 14),
            FilledButton.icon(
              onPressed: onJoinNow,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              icon: Icon(
                isVideoCall ? Icons.videocam_rounded : Icons.call_rounded,
                size: 18,
              ),
              label: Text(
                joinNowLabel!,
                style: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
          ],
          if (_isRequest) ...[
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: onDecline,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      declineLabel!,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton(
                    onPressed: onAccept,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      acceptLabel!,
                      style: GoogleFonts.inter(fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _VentorAvatar extends StatelessWidget {
  const _VentorAvatar({required this.name, this.avatarUrl});

  final String name;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';

    return ClipOval(
      child: SizedBox(
        width: 44,
        height: 44,
        child: avatarUrl != null && avatarUrl!.isNotEmpty
            ? Image.network(
                avatarUrl!,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _InitialsAvatar(initial: initial),
              )
            : _InitialsAvatar(initial: initial),
      ),
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({required this.initial});

  final String initial;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: SplashColors.purpleMid.withValues(alpha: 0.35),
      child: Center(
        child: Text(
          initial,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  const _TagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: SplashColors.purpleMid.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          color: Colors.white.withValues(alpha: 0.85),
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
