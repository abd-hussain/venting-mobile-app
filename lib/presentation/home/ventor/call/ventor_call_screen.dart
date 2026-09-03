import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/bloc/ventor_call_end/ventor_call_end_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_rating_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorCallScreen extends StatefulWidget {
  const VentorCallScreen({super.key, required this.args});

  final VentorCallArgs args;

  @override
  State<VentorCallScreen> createState() => _VentorCallScreenState();
}

class _VentorCallScreenState extends State<VentorCallScreen>
    with TickerProviderStateMixin {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  late final AnimationController _pulseController;
  late final VentorCallEndBloc _endBloc;
  late final DateTime _startedAt;
  Timer? _timer;
  late Duration _remaining;
  var _muted = false;
  var _speakerOn = true;
  var _frontCamera = true;

  @override
  void initState() {
    super.initState();
    _startedAt = DateTime.now();
    _endBloc = diContainer<VentorCallEndBloc>();
    // Demo-friendly countdown while keeping session length visible in tips.
    final minutes = widget.args.durationMinutes;
    _remaining = Duration(seconds: minutes <= 1 ? 60 : 45);
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..repeat();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted || _endBloc.state.isEnding) return;
      if (_remaining.inSeconds <= 0) {
        _timer?.cancel();
        _requestEndCall();
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

  int _elapsedSeconds() {
    final seconds = DateTime.now().difference(_startedAt).inSeconds;
    return seconds < 0 ? 0 : seconds;
  }

  void _requestEndCall() {
    if (_endBloc.state.isEnding || _endBloc.state.endSucceeded) return;
    _timer?.cancel();
    _endBloc.add(
      VentorCallEndEvent.endRequested(
        sessionId: widget.args.sessionId,
        durationSeconds: _elapsedSeconds(),
      ),
    );
  }

  Future<void> _openRatingScreen() async {
    if (!mounted) return;
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => VentorCallRatingScreen(args: widget.args),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pulseController.dispose();
    _endBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final args = widget.args;

    return BlocProvider.value(
      value: _endBloc,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: BlocConsumer<VentorCallEndBloc, VentorCallEndState>(
          listenWhen: (previous, current) =>
              previous.endSucceeded != current.endSucceeded,
          listener: (context, state) {
            if (!state.endSucceeded) return;
            if (state.errorMessage.isNotEmpty) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
            _openRatingScreen();
          },
          builder: (context, endState) {
            return Scaffold(
              backgroundColor: SplashColors.backgroundBottom,
              body: SafeArea(
                child: Column(
                  children: [
                    _CallHeader(
                      name: args.listenerName,
                      avatarUrl: args.listenerAvatarUrl,
                      rating: args.listenerRating,
                      timerText: _formatDuration(_remaining),
                      languageLabel: args.speechLanguage,
                      endLabel: l10n.ventor_call_end,
                      isEnding: endState.isEnding,
                      onEnd: endState.isEnding ? null : _requestEndCall,
                    ),
                    Expanded(
                      child: args.isVideoCall
                          ? _VideoCallBody(
                              remoteAvatarUrl: args.listenerAvatarUrl,
                              remoteName: args.listenerName,
                              frontCamera: _frontCamera,
                            )
                          : _AudioCallBody(
                              avatarUrl: args.listenerAvatarUrl,
                              name: args.listenerName,
                              pulseController: _pulseController,
                              speakingLabel: l10n.ventor_call_speaking,
                            ),
                    ),
                    _CallControls(
                      isVideoCall: args.isVideoCall,
                      muted: _muted,
                      speakerOn: _speakerOn,
                      muteLabel: l10n.ventor_call_mute,
                      speakerLabel: l10n.ventor_call_speaker,
                      flipLabel: l10n.ventor_call_flip,
                      onToggleMute: endState.isEnding
                          ? null
                          : () => setState(() => _muted = !_muted),
                      onToggleSpeaker: endState.isEnding
                          ? null
                          : () => setState(() => _speakerOn = !_speakerOn),
                      onFlipCamera: endState.isEnding
                          ? null
                          : () => setState(() => _frontCamera = !_frontCamera),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            );
          },
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
    required this.languageLabel,
    required this.endLabel,
    required this.isEnding,
    required this.onEnd,
  });

  final String name;
  final String? avatarUrl;
  final double rating;
  final String timerText;
  final String languageLabel;
  final String endLabel;
  final bool isEnding;
  final VoidCallback? onEnd;

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
                      color: VentorProfileTheme.gold,
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
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        languageLabel,
                        style: GoogleFonts.inter(
                          color: VentorProfileTheme.muted,
                          fontSize: 11,
                        ),
                        overflow: TextOverflow.ellipsis,
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
              disabledBackgroundColor: const Color(
                0xFFEF4444,
              ).withValues(alpha: 0.5),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: isEnding
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                : Text(
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
    required this.speakingLabel,
  });

  final String? avatarUrl;
  final String name;
  final AnimationController pulseController;
  final String speakingLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
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
        const SizedBox(height: 16),
        Text(
          speakingLabel,
          style: GoogleFonts.inter(
            color: VentorProfileTheme.muted,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
              color: VentorProfileTheme.cardFill,
            ),
            clipBehavior: Clip.antiAlias,
            child: ColoredBox(
              color: SplashColors.purpleMid.withValues(alpha: 0.25),
              child: Icon(
                frontCamera ? Icons.person_rounded : Icons.camera_rear_rounded,
                color: Colors.white54,
                size: 40,
              ),
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
  final VoidCallback? onToggleMute;
  final VoidCallback? onToggleSpeaker;
  final VoidCallback? onFlipCamera;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ControlButton(
            icon: muted ? Icons.mic_off_rounded : Icons.mic_rounded,
            label: muteLabel,
            active: !muted,
            onTap: onToggleMute,
          ),
          _ControlButton(
            icon: speakerOn
                ? Icons.volume_up_rounded
                : Icons.volume_off_rounded,
            label: speakerLabel,
            active: speakerOn,
            onTap: onToggleSpeaker,
          ),
          if (isVideoCall)
            _ControlButton(
              icon: Icons.cameraswitch_rounded,
              label: flipLabel,
              active: true,
              onTap: onFlipCamera,
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
    required this.active,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color: active
              ? SplashColors.purpleMid.withValues(alpha: 0.22)
              : Colors.white.withValues(alpha: 0.08),
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: SizedBox(
              width: 58,
              height: 58,
              child: Icon(
                icon,
                color: active ? Colors.white : VentorProfileTheme.muted,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: GoogleFonts.inter(
            color: VentorProfileTheme.muted,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
