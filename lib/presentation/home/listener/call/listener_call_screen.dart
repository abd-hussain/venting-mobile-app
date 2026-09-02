import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_args.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_rating_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_report_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerCallScreen extends StatefulWidget {
  const ListenerCallScreen({super.key, required this.args});

  final ListenerCallArgs args;

  @override
  State<ListenerCallScreen> createState() => _ListenerCallScreenState();
}

class _ListenerCallScreenState extends State<ListenerCallScreen>
    with TickerProviderStateMixin {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  late final AnimationController _pulseController;
  Timer? _timer;
  late Duration _remaining;
  bool _muted = false;
  bool _speakerOn = true;
  bool _frontCamera = true;

  @override
  void initState() {
    super.initState();
    _remaining = Duration(minutes: widget.args.durationMinutes);
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;
      if (_remaining.inSeconds <= 0) {
        _timer?.cancel();
        _endCall();
        return;
      }
      setState(() => _remaining -= const Duration(seconds: 1));
    });
  }

  String _formatDuration(Duration d) {
    final m = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final s = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  Future<void> _endCall() async {
    _timer?.cancel();
    // TODO: End call via signaling / WebRTC service.
    if (!mounted) return;
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ListenerCallRatingScreen(args: widget.args),
      ),
    );
  }

  Future<void> _onReportSession() async {
    final reason = await showListenerCallReportBottomSheet(
      context: context,
      sessionId: widget.args.sessionId,
    );
    if (!mounted || reason == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          VentingMobLocalizations.of(context).listener_call_report_success,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final args = widget.args;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundBottom,
        body: SafeArea(
          child: Column(
            children: [
              _CallHeader(
                name: args.ventorName,
                avatarUrl: args.ventorAvatarUrl,
                rating: args.ventorRating,
                timerText: _formatDuration(_remaining),
                endLabel: l10n.listener_call_end,
                onEnd: _endCall,
              ),
              Expanded(
                child: args.isVideoCall
                    ? _VideoCallBody(
                        remoteAvatarUrl: args.ventorAvatarUrl,
                        remoteName: args.ventorName,
                        frontCamera: _frontCamera,
                      )
                    : _AudioCallBody(
                        avatarUrl: args.ventorAvatarUrl,
                        name: args.ventorName,
                        pulseController: _pulseController,
                      ),
              ),
              _CallControls(
                isVideoCall: args.isVideoCall,
                muted: _muted,
                speakerOn: _speakerOn,
                muteLabel: l10n.listener_call_mute,
                speakerLabel: l10n.listener_call_speaker,
                flipLabel: l10n.listener_call_flip,
                onToggleMute: () => setState(() => _muted = !_muted),
                onToggleSpeaker: () => setState(() => _speakerOn = !_speakerOn),
                onFlipCamera: () =>
                    setState(() => _frontCamera = !_frontCamera),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: _onReportSession,
                icon: const Icon(
                  Icons.flag_outlined,
                  size: 16,
                  color: ListenerProfileTheme.muted,
                ),
                label: Text(
                  l10n.listener_call_report_session,
                  style: GoogleFonts.inter(
                    color: ListenerProfileTheme.muted,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

class _CallHeader extends StatelessWidget {
  const _CallHeader({
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.timerText,
    required this.endLabel,
    required this.onEnd,
  });

  final String name;
  final String? avatarUrl;
  final double rating;
  final String timerText;
  final String endLabel;
  final VoidCallback onEnd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          ClipOval(
            child: SizedBox(
              width: 40,
              height: 40,
              child: _avatarImage(avatarUrl, name, 18),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: ListenerProfileTheme.gold,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      rating.toStringAsFixed(1),
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timerText,
                      style: GoogleFonts.inter(
                        color: ListenerProfileTheme.muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: onEnd,
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              endLabel,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _avatarImage(String? url, String name, double initialSize) {
  if (url != null && url.isNotEmpty) {
    return Image.network(url, fit: BoxFit.cover);
  }
  return ColoredBox(
    color: SplashColors.purpleMid.withValues(alpha: 0.35),
    child: Center(
      child: Text(
        name.isNotEmpty ? name[0].toUpperCase() : '?',
        style: GoogleFonts.inter(
          color: Colors.white,
          fontSize: initialSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}

class _AudioCallBody extends StatelessWidget {
  const _AudioCallBody({
    required this.avatarUrl,
    required this.name,
    required this.pulseController,
  });

  final String? avatarUrl;
  final String name;
  final AnimationController pulseController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 260,
        height: 260,
        child: Stack(
          alignment: Alignment.center,
          children: [
            for (var i = 0; i < 3; i++)
              AnimatedBuilder(
                animation: pulseController,
                builder: (context, child) {
                  final t = (pulseController.value + i * 0.33) % 1.0;
                  final scale = 0.85 + t * 0.45;
                  final opacity = (1 - t) * 0.35;
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: SplashColors.purpleMid.withValues(
                            alpha: opacity,
                          ),
                          width: 2,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ClipOval(
              child: SizedBox(
                width: 180,
                height: 180,
                child: _avatarImage(avatarUrl, name, 48),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VideoCallBody extends StatelessWidget {
  const _VideoCallBody({
    required this.remoteAvatarUrl,
    required this.remoteName,
    required this.frontCamera,
  });

  final String? remoteAvatarUrl;
  final String remoteName;
  final bool frontCamera;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // TODO: Replace with remote WebRTC video stream.
        _avatarImage(remoteAvatarUrl, remoteName, 64),
        Container(color: Colors.black.withValues(alpha: 0.15)),
        Positioned(
          right: 16,
          bottom: 16,
          child: Container(
            width: 96,
            height: 136,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white24, width: 1.5),
              color: ListenerProfileTheme.cardFill,
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // TODO: Replace with local camera preview.
                ColoredBox(
                  color: SplashColors.purpleMid.withValues(alpha: 0.25),
                  child: Icon(
                    frontCamera
                        ? Icons.person_rounded
                        : Icons.camera_rear_rounded,
                    color: Colors.white54,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CallControls extends StatelessWidget {
  const _CallControls({
    required this.isVideoCall,
    required this.muted,
    required this.speakerOn,
    required this.muteLabel,
    required this.speakerLabel,
    required this.flipLabel,
    required this.onToggleMute,
    required this.onToggleSpeaker,
    required this.onFlipCamera,
  });

  final bool isVideoCall;
  final bool muted;
  final bool speakerOn;
  final String muteLabel;
  final String speakerLabel;
  final String flipLabel;
  final VoidCallback onToggleMute;
  final VoidCallback onToggleSpeaker;
  final VoidCallback onFlipCamera;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ControlButton(
            icon: muted ? Icons.mic_off_rounded : Icons.mic_rounded,
            label: muteLabel,
            active: muted,
            onTap: onToggleMute,
          ),
          _ControlButton(
            icon: isVideoCall
                ? Icons.flip_camera_ios_rounded
                : (speakerOn
                      ? Icons.volume_up_rounded
                      : Icons.volume_off_rounded),
            label: isVideoCall ? flipLabel : speakerLabel,
            active: isVideoCall ? false : !speakerOn,
            onTap: isVideoCall ? onFlipCamera : onToggleSpeaker,
          ),
        ],
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.icon,
    required this.label,
    required this.onTap,
    this.active = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: active
              ? SplashColors.purpleMid.withValues(alpha: 0.35)
              : Colors.white.withValues(alpha: 0.08),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: SizedBox(
              width: 56,
              height: 56,
              child: Icon(icon, color: Colors.white, size: 24),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            color: ListenerProfileTheme.muted,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
