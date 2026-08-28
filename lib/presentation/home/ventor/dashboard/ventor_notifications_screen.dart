import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/home/ventor/dashboard/bloc/ventor_notifications_bloc.dart';
import 'package:venting_mobile_app/presentation/notifications/inbox_notification_ui.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/notification_action_handler.dart';

Future<void> openVentorNotificationsScreen({required BuildContext context}) {
  return Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (_) =>
            diContainer<VentorNotificationsBloc>()
              ..add(const VentorNotificationsEvent.started()),
        child: const VentorNotificationsScreen(),
      ),
    ),
  );
}

class VentorNotificationsScreen extends StatelessWidget {
  const VentorNotificationsScreen({super.key});

  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  Future<void> _onDeleteItem(BuildContext context, AppNotification item) async {
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
    if (confirmed != true || !context.mounted) return;

    context.read<VentorNotificationsBloc>().add(
      VentorNotificationsEvent.deleteRequested(notificationId: item.id),
    );
  }

  void _onNotificationTap(BuildContext context, AppNotification item) {
    context.read<VentorNotificationsBloc>().add(
      VentorNotificationsEvent.notificationTapped(notificationId: item.id),
    );

    if (item.action == AppNotificationAction.none) return;

    handleAppNotificationAction(
      context: context,
      notification: item,
      audience: NotificationAudience.ventor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return BlocListener<VentorNotificationsBloc, VentorNotificationsState>(
      listenWhen: (previous, current) =>
          current.errorMessage.isNotEmpty &&
          current.errorMessage != previous.errorMessage,
      listener: (context, state) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(state.errorMessage)));
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
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
              BlocBuilder<VentorNotificationsBloc, VentorNotificationsState>(
                buildWhen: (previous, current) =>
                    previous.hasUnread != current.hasUnread ||
                    previous.isMarkingAllAsRead != current.isMarkingAllAsRead,
                builder: (context, state) {
                  if (!state.hasUnread) return const SizedBox.shrink();

                  return TextButton(
                    onPressed: state.isMarkingAllAsRead
                        ? null
                        : () => context.read<VentorNotificationsBloc>().add(
                            const VentorNotificationsEvent.markAllAsReadRequested(),
                          ),
                    child: state.isMarkingAllAsRead
                        ? const SizedBox(
                            width: 16,
                            height: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Text(
                            l10n.notifications_mark_all_as_read,
                            style: GoogleFonts.inter(
                              color: SplashColors.purpleMid,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                  );
                },
              ),
            ],
          ),
          body: BlocBuilder<VentorNotificationsBloc, VentorNotificationsState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.isLoadFailure) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.errorMessage.isNotEmpty
                              ? state.errorMessage
                              : l10n.common_unknown_error,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                        const SizedBox(height: 16),
                        FilledButton(
                          onPressed: () => context
                              .read<VentorNotificationsBloc>()
                              .add(const VentorNotificationsEvent.retryLoad()),
                          child: Text(l10n.common_retry),
                        ),
                      ],
                    ),
                  ),
                );
              }

              final visible = state.visibleItems;

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 12),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FilterChip(
                        selected: state.unreadOnly,
                        label: Text(
                          state.unreadOnly
                              ? l10n.notifications_show_all
                              : l10n.notifications_show_unread_only,
                          style: GoogleFonts.inter(
                            color: state.unreadOnly
                                ? Colors.white
                                : ListenerProfileTheme.muted,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        selectedColor: SplashColors.purpleMid.withValues(
                          alpha: 0.3,
                        ),
                        backgroundColor: ListenerProfileTheme.cardFill,
                        checkmarkColor: SplashColors.purpleMid,
                        side: BorderSide(
                          color: state.unreadOnly
                              ? SplashColors.purpleMid
                              : ListenerProfileTheme.cardBorder,
                        ),
                        onSelected: (value) =>
                            context.read<VentorNotificationsBloc>().add(
                              VentorNotificationsEvent.unreadOnlyFilterChanged(
                                unreadOnly: value,
                              ),
                            ),
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
                                    color: ListenerProfileTheme.muted
                                        .withValues(alpha: 0.7),
                                  ),
                                  const SizedBox(height: 14),
                                  Text(
                                    state.unreadOnly
                                        ? l10n.notifications_no_unread
                                        : l10n.listener_dashboard_notifications_empty,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      color: ListenerProfileTheme.muted,
                                      fontSize: 14,
                                      height: 1.4,
                                    ),
                                  ),
                                  if (state.unreadOnly) ...[
                                    const SizedBox(height: 12),
                                    TextButton(
                                      onPressed: () => context
                                          .read<VentorNotificationsBloc>()
                                          .add(
                                            const VentorNotificationsEvent.unreadOnlyFilterChanged(
                                              unreadOnly: false,
                                            ),
                                          ),
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
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final item = visible[index];
                              return Dismissible(
                                key: ValueKey(item.id),
                                direction: DismissDirection.endToStart,
                                confirmDismiss: (_) async {
                                  await _onDeleteItem(context, item);
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
                                child: InboxNotificationCard(
                                  item: item,
                                  timeLabel: inboxNotificationTimeLabel(
                                    item.createdAt,
                                    l10n,
                                  ),
                                  onTap: () =>
                                      _onNotificationTap(context, item),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
