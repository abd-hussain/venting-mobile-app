import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venting_mobile_app/domain/data/app/registration_notifications_data.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';

/// Step 9 — Enable push notifications for profile review updates.
class ListenerRegistrationStep9Notifications extends StatefulWidget {
  const ListenerRegistrationStep9Notifications({
    super.key,
    required this.onContinue,
  });

  final ValueChanged<RegistrationNotificationsData> onContinue;

  @override
  State<ListenerRegistrationStep9Notifications> createState() =>
      _ListenerRegistrationStep9NotificationsState();
}

class _ListenerRegistrationStep9NotificationsState
    extends State<ListenerRegistrationStep9Notifications> {
  static const _accent = Color(0xFF8A3CFE);
  static const _muted = Color(0xFF9B93AB);
  static const _cardFill = Color(0xFF1C1826);

  bool _isRequesting = false;

  Future<void> _enableNotifications() async {
    if (_isRequesting) return;
    setState(() => _isRequesting = true);

    var notificationsEnabled = false;
    String? fcmToken;

    try {
      if (Platform.isAndroid) {
        final status = await Permission.notification.request();
        notificationsEnabled = status.isGranted || status.isLimited;
      }

      final settings = await FirebaseMessaging.instance.requestPermission();
      notificationsEnabled =
          notificationsEnabled ||
          settings.authorizationStatus == AuthorizationStatus.authorized ||
          settings.authorizationStatus == AuthorizationStatus.provisional;

      if (notificationsEnabled) {
        fcmToken = await FirebaseMessaging.instance.getToken();
      }
    } catch (_) {
      notificationsEnabled = false;
      fcmToken = null;
    } finally {
      if (mounted) {
        setState(() => _isRequesting = false);
        widget.onContinue(
          RegistrationNotificationsData(
            notificationsEnabled: notificationsEnabled,
            fcmToken: fcmToken,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    final aboutItems = [
      l10n.listener_reg_notif_about_1,
      l10n.listener_reg_notif_about_2,
      l10n.listener_reg_notif_about_3,
      l10n.listener_reg_notif_about_4,
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Center(child: _NotificationHeroImage()),
          const SizedBox(height: 28),
          Text(
            l10n.listener_reg_notif_title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            l10n.listener_reg_notif_subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: _muted,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
            decoration: BoxDecoration(
              color: _cardFill,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _accent.withValues(alpha: 0.45)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.listener_reg_notif_about_title,
                  style: GoogleFonts.inter(
                    color: _accent,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 12),
                for (final item in aboutItems) ...[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 7),
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: const BoxDecoration(
                              color: _muted,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            item,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.88),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: _isRequesting ? null : _enableNotifications,
              style: FilledButton.styleFrom(
                backgroundColor: _accent,
                disabledBackgroundColor: _accent.withValues(alpha: 0.42),
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999),
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: _isRequesting
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.4,
                        color: Colors.white,
                      ),
                    )
                  : Text(l10n.listener_reg_notif_enable),
            ),
          ),
        ],
      ),
    );
  }
}

class _NotificationHeroImage extends StatelessWidget {
  const _NotificationHeroImage();

  static const _accent = Color(0xFF8A3CFE);
  static const _imagePath =
      'assets/images/regestration_enable_notifications.png';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (final offset in [-18.0, 0.0, 18.0])
            Positioned(
              top: 8,
              left: 80 + offset - 1.5,
              child: Transform.rotate(
                angle: offset * 0.015,
                child: Container(
                  width: 3,
                  height: 16,
                  decoration: BoxDecoration(
                    color: _accent.withValues(alpha: 0.75),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _accent.withValues(alpha: 0.12),
              boxShadow: [
                BoxShadow(
                  color: _accent.withValues(alpha: 0.22),
                  blurRadius: 24,
                ),
              ],
            ),
          ),
          Image.asset(
            _imagePath,
            width: 50,
            height: 50,
            fit: BoxFit.contain,
            filterQuality: FilterQuality.high,
          ),
        ],
      ),
    );
  }
}
