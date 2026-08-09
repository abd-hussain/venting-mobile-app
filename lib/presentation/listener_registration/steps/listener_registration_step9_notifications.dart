import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 9 — Enable push notifications for profile review updates.
class ListenerRegistrationStep9Notifications extends StatefulWidget {
  const ListenerRegistrationStep9Notifications({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep9Notifications> createState() =>
      _ListenerRegistrationStep9NotificationsState();
}

class _ListenerRegistrationStep9NotificationsState
    extends State<ListenerRegistrationStep9Notifications> {
  bool _isRequesting = false;

  Future<void> _enableNotifications() async {
    if (_isRequesting) return;
    setState(() => _isRequesting = true);
    try {
      if (Platform.isAndroid) {
        final status = await Permission.notification.request();
        if (status.isGranted || status.isLimited) {
          // Continue — Android 13+ permission granted.
        }
      }

      await FirebaseMessaging.instance.requestPermission();
    } catch (_) {
      // Still continue — permission can be enabled later in system settings.
    } finally {
      if (mounted) {
        setState(() => _isRequesting = false);
        widget.onContinue();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: SplashColors.purpleMid,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '9',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  l10n.listener_reg_step_notifications,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: [
                const Spacer(flex: 2),
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
                    color: Colors.white.withValues(alpha: 0.65),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 36),
                const _NotificationBellArt(),
                const Spacer(flex: 3),
                SizedBox(
                  height: 54,
                  child: FilledButton(
                    onPressed: _isRequesting ? null : _enableNotifications,
                    style: FilledButton.styleFrom(
                      backgroundColor: SplashColors.purpleMid,
                      disabledBackgroundColor: SplashColors.purpleMid
                          .withValues(alpha: 0.45),
                      foregroundColor: Colors.white,
                      disabledForegroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
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
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _isRequesting ? null : widget.onContinue,
                  child: Text(
                    l10n.listener_reg_notif_skip,
                    style: GoogleFonts.inter(
                      color: SplashColors.purpleMid,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
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

class _NotificationBellArt extends StatelessWidget {
  const _NotificationBellArt();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (final angle in [-50.0, -25.0, 0.0, 25.0, 50.0])
            Transform.rotate(
              angle: angle * 3.14159 / 180,
              child: Align(
                alignment: const Alignment(0, -0.85),
                child: Container(
                  width: 3,
                  height: 18,
                  decoration: BoxDecoration(
                    color: SplashColors.purpleLight.withValues(alpha: 0.55),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: SplashColors.purpleMid.withValues(alpha: 0.12),
            ),
          ),
          Container(
            width: 118,
            height: 118,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFD48BFF),
                  SplashColors.purpleMid,
                  SplashColors.purpleDeep,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: SplashColors.purpleMid.withValues(alpha: 0.45),
                  blurRadius: 28,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(
                  Icons.notifications_rounded,
                  color: Colors.white,
                  size: 64,
                ),
                Positioned(
                  bottom: 28,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.18),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.favorite_rounded,
                      color: SplashColors.purpleMid,
                      size: 16,
                    ),
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
