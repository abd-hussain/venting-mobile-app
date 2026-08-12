import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum ListenerNotificationType {
  sessionRequest,
  sessionReminder,
  review,
  payout,
  system,
}

class ListenerNotificationItem {
  const ListenerNotificationItem({
    required this.id,
    required this.type,
    required this.title,
    required this.body,
    required this.createdAt,
    this.isRead = false,
  });

  final String id;
  final ListenerNotificationType type;
  final String title;
  final String body;
  final DateTime createdAt;
  final bool isRead;

  ListenerNotificationItem copyWith({bool? isRead}) {
    return ListenerNotificationItem(
      id: id,
      type: type,
      title: title,
      body: body,
      createdAt: createdAt,
      isRead: isRead ?? this.isRead,
    );
  }
}

/// Opens the listener notifications inbox screen.
Future<void> openListenerNotificationsScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(builder: (_) => const ListenerNotificationsScreen()),
  );
}

class ListenerNotificationsScreen extends StatefulWidget {
  const ListenerNotificationsScreen({super.key});

  @override
  State<ListenerNotificationsScreen> createState() =>
      _ListenerNotificationsScreenState();
}

class _ListenerNotificationsScreenState
    extends State<ListenerNotificationsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  bool _unreadOnly = false;

  // TODO: Load notifications from listener notifications API.
  late List<ListenerNotificationItem> _items;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _items = [
      ListenerNotificationItem(
        id: 'n1',
        type: ListenerNotificationType.sessionRequest,
        title: 'New session request',
        body: 'Omar H. requested a 30 min session starting soon.',
        createdAt: now.subtract(const Duration(minutes: 8)),
      ),
      ListenerNotificationItem(
        id: 'n2',
        type: ListenerNotificationType.sessionReminder,
        title: 'Session starts in 15 minutes',
        body: 'Your session with Maya R. begins at 7:30 PM.',
        createdAt: now.subtract(const Duration(minutes: 22)),
      ),
      ListenerNotificationItem(
        id: 'n3',
        type: ListenerNotificationType.review,
        title: 'New review received',
        body: 'Emma left a 5-star review after your last conversation.',
        createdAt: now.subtract(const Duration(hours: 2)),
        isRead: true,
      ),
      ListenerNotificationItem(
        id: 'n4',
        type: ListenerNotificationType.payout,
        title: 'Payout completed',
        body: r'$210.40 was sent to your PayPal account.',
        createdAt: now.subtract(const Duration(days: 1, hours: 3)),
        isRead: true,
      ),
      ListenerNotificationItem(
        id: 'n5',
        type: ListenerNotificationType.system,
        title: 'Complete your setup',
        body: 'Finish training to start accepting more session requests.',
        createdAt: now.subtract(const Duration(days: 2)),
      ),
      ListenerNotificationItem(
        id: 'n6',
        type: ListenerNotificationType.sessionRequest,
        title: 'Session request declined',
        body: 'You declined a request from Alex M. for tomorrow evening.',
        createdAt: now.subtract(const Duration(days: 3)),
        isRead: true,
      ),
    ];
  }

  List<ListenerNotificationItem> get _visibleItems {
    if (!_unreadOnly) return _items;
    return _items.where((item) => !item.isRead).toList();
  }

  bool get _hasUnread => _items.any((item) => !item.isRead);

  void _markAllAsRead() {
    // TODO: Mark all notifications as read via API.
    setState(() {
      _items = _items.map((item) => item.copyWith(isRead: true)).toList();
    });
  }

  void _onTapItem(ListenerNotificationItem item) {
    // TODO: Navigate based on notification type / deep link.
    if (item.isRead) return;
    setState(() {
      _items = _items
          .map((n) => n.id == item.id ? n.copyWith(isRead: true) : n)
          .toList();
    });
  }

  Future<void> _onDeleteItem(ListenerNotificationItem item) async {
    final l10n = VentingMobLocalizations.of(context);
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: ListenerProfileTheme.cardFill,
          title: Text(
            l10n.confirm_delete_title,
            style: GoogleFonts.inter(color: Colors.white),
          ),
          content: Text(
            l10n.confirm_delete_description,
            style: GoogleFonts.inter(color: ListenerProfileTheme.muted),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(
                l10n.listener_call_report_cancel,
                style: GoogleFonts.inter(color: ListenerProfileTheme.muted),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                l10n.listener_dashboard_notifications_delete,
                style: GoogleFonts.inter(color: const Color(0xFFEF4444)),
              ),
            ),
          ],
        );
      },
    );
    if (confirmed != true || !mounted) return;

    // TODO: Delete notification via API.
    setState(() {
      _items = _items.where((n) => n.id != item.id).toList();
    });
  }

  String _timeLabel(DateTime date, VentingMobLocalizations l10n) {
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

  IconData _iconFor(ListenerNotificationType type) {
    return switch (type) {
      ListenerNotificationType.sessionRequest => Icons.headphones_rounded,
      ListenerNotificationType.sessionReminder => Icons.schedule_rounded,
      ListenerNotificationType.review => Icons.star_rounded,
      ListenerNotificationType.payout => Icons.payments_rounded,
      ListenerNotificationType.system => Icons.info_outline_rounded,
    };
  }

  Color _iconColorFor(ListenerNotificationType type) {
    return switch (type) {
      ListenerNotificationType.sessionRequest => SplashColors.purpleMid,
      ListenerNotificationType.sessionReminder => ListenerProfileTheme.gold,
      ListenerNotificationType.review => ListenerProfileTheme.gold,
      ListenerNotificationType.payout => ListenerProfileTheme.success,
      ListenerNotificationType.system => ListenerProfileTheme.muted,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final visible = _visibleItems;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
            color: Colors.white,
          ),
          title: Text(
            l10n.notifications_screen_title,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          actions: [
            if (_hasUnread)
              TextButton(
                onPressed: _markAllAsRead,
                child: Text(
                  l10n.notifications_mark_all_as_read,
                  style: GoogleFonts.inter(
                    color: SplashColors.purpleMid,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
              child: Align(
                alignment: Alignment.centerRight,
                child: FilterChip(
                  selected: _unreadOnly,
                  label: Text(
                    _unreadOnly
                        ? l10n.notifications_show_all
                        : l10n.notifications_show_unread_only,
                    style: GoogleFonts.inter(
                      color: _unreadOnly
                          ? Colors.white
                          : ListenerProfileTheme.muted,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  selectedColor: SplashColors.purpleMid.withValues(alpha: 0.3),
                  backgroundColor: ListenerProfileTheme.cardFill,
                  checkmarkColor: SplashColors.purpleMid,
                  side: BorderSide(
                    color: _unreadOnly
                        ? SplashColors.purpleMid
                        : ListenerProfileTheme.cardBorder,
                  ),
                  onSelected: (value) => setState(() => _unreadOnly = value),
                ),
              ),
            ),
            Expanded(
              child: visible.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(32),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.notifications_none_rounded,
                              size: 48,
                              color: ListenerProfileTheme.muted.withValues(
                                alpha: 0.7,
                              ),
                            ),
                            const SizedBox(height: 14),
                            Text(
                              _unreadOnly
                                  ? l10n.notifications_no_unread
                                  : l10n.listener_dashboard_notifications_empty,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: ListenerProfileTheme.muted,
                                fontSize: 14,
                                height: 1.4,
                              ),
                            ),
                            if (_unreadOnly) ...[
                              const SizedBox(height: 12),
                              TextButton(
                                onPressed: () =>
                                    setState(() => _unreadOnly = false),
                                child: Text(
                                  l10n.notifications_show_all,
                                  style: GoogleFonts.inter(
                                    color: SplashColors.purpleMid,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 28),
                      itemCount: visible.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final item = visible[index];
                        return Dismissible(
                          key: ValueKey(item.id),
                          direction: DismissDirection.endToStart,
                          confirmDismiss: (_) async {
                            await _onDeleteItem(item);
                            return false;
                          },
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFEF4444,
                              ).withValues(alpha: 0.18),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.delete_outline_rounded,
                              color: Color(0xFFEF4444),
                            ),
                          ),
                          child: _NotificationCard(
                            item: item,
                            timeLabel: _timeLabel(item.createdAt, l10n),
                            icon: _iconFor(item.type),
                            iconColor: _iconColorFor(item.type),
                            onTap: () => _onTapItem(item),
                          ),
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

class _NotificationCard extends StatelessWidget {
  const _NotificationCard({
    required this.item,
    required this.timeLabel,
    required this.icon,
    required this.iconColor,
    required this.onTap,
  });

  final ListenerNotificationItem item;
  final String timeLabel;
  final IconData icon;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
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
