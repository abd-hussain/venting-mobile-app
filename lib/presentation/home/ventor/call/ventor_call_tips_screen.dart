import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/bloc/ventor_call_join/ventor_call_join_bloc.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_args.dart';
import 'package:venting_mobile_app/presentation/home/ventor/call/ventor_call_screen.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class VentorCallTipsScreen extends StatefulWidget {
  const VentorCallTipsScreen({super.key, required this.args});

  final VentorCallArgs args;

  @override
  State<VentorCallTipsScreen> createState() => _VentorCallTipsScreenState();
}

class _VentorCallTipsScreenState extends State<VentorCallTipsScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  var _micGranted = false;
  var _cameraGranted = false;

  bool get _needsCamera => widget.args.isVideoCall;

  bool _canJoin(bool isJoining) =>
      !isJoining && _micGranted && (!_needsCamera || _cameraGranted);

  @override
  void initState() {
    super.initState();
    _refreshPermissions();
  }

  Future<void> _refreshPermissions() async {
    final mic = await Permission.microphone.isGranted;
    final camera = await Permission.camera.isGranted;
    if (!mounted) return;
    setState(() {
      _micGranted = mic;
      _cameraGranted = camera;
    });
  }

  Future<bool> _requestPermission(Permission permission) async {
    var status = await permission.status;
    if (status.isGranted) return true;
    if (status.isPermanentlyDenied) {
      if (!mounted) return false;
      _showSnack(
        VentingMobLocalizations.of(context).ventor_call_permission_settings,
      );
      await openAppSettings();
      return false;
    }
    status = await permission.request();
    return status.isGranted;
  }

  Future<void> _requestMic() async {
    final granted = await _requestPermission(Permission.microphone);
    if (!mounted) return;
    setState(() => _micGranted = granted);
  }

  Future<void> _requestCamera() async {
    final granted = await _requestPermission(Permission.camera);
    if (!mounted) return;
    setState(() => _cameraGranted = granted);
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  void _onEnterCall(BuildContext context) {
    context.read<VentorCallJoinBloc>().add(
      VentorCallJoinEvent.joinRequested(sessionId: widget.args.sessionId),
    );
  }

  Future<void> _openCallScreen(VentorCallJoinState state) async {
    final credentials = state.callCredentials;
    if (credentials == null) return;
    if (!mounted) return;
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => VentorCallScreen(
          args: widget.args.copyWith(callCredentials: credentials),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final args = widget.args;

    return BlocProvider(
      create: (_) => diContainer<VentorCallJoinBloc>(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: BlocConsumer<VentorCallJoinBloc, VentorCallJoinState>(
          listenWhen: (previous, current) =>
              previous.joinSucceeded != current.joinSucceeded ||
              previous.errorMessage != current.errorMessage,
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              _showSnack(state.errorMessage);
              return;
            }
            if (state.joinSucceeded) {
              _openCallScreen(state);
            }
          },
          builder: (context, joinState) {
            return Scaffold(
              backgroundColor: SplashColors.backgroundBottom,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: joinState.isJoining
                      ? null
                      : () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                  color: Colors.white,
                ),
                title: Text(
                  l10n.ventor_call_tips_title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                      children: [
                        _ListenerHeader(
                          name: args.listenerName,
                          avatarUrl: args.listenerAvatarUrl,
                          rating: args.listenerRating,
                          durationMinutes: args.durationMinutes,
                          speechLanguage: args.speechLanguage,
                          isVideoCall: args.isVideoCall,
                          l10n: l10n,
                        ),
                        const SizedBox(height: 22),
                        Text(
                          l10n.ventor_sessions_confirm_tips_title,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _TipTile(
                          icon: Icons.volume_off_rounded,
                          text: l10n.ventor_sessions_confirm_tip_quiet,
                        ),
                        _TipTile(
                          icon: Icons.favorite_outline_rounded,
                          text: l10n.ventor_sessions_confirm_tip_honest,
                        ),
                        _TipTile(
                          icon: Icons.shield_outlined,
                          text: l10n.ventor_sessions_confirm_tip_boundaries,
                        ),
                        _TipTile(
                          icon: Icons.exit_to_app_rounded,
                          text: l10n.ventor_sessions_confirm_tip_leave,
                        ),
                        const SizedBox(height: 22),
                        Text(
                          l10n.ventor_call_permissions_heading,
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          _needsCamera
                              ? l10n.ventor_call_permissions_subtitle_video
                              : l10n.ventor_call_permissions_subtitle_voice,
                          style: GoogleFonts.inter(
                            color: VentorProfileTheme.muted,
                            fontSize: 13,
                            height: 1.35,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _PermissionRow(
                          icon: Icons.mic_rounded,
                          label: l10n.ventor_call_permission_mic,
                          granted: _micGranted,
                          allowLabel: l10n.ventor_call_permission_allow,
                          grantedLabel: l10n.ventor_call_permission_granted,
                          onAllow: joinState.isJoining ? null : _requestMic,
                        ),
                        if (_needsCamera) ...[
                          const SizedBox(height: 10),
                          _PermissionRow(
                            icon: Icons.videocam_rounded,
                            label: l10n.ventor_call_permission_camera,
                            granted: _cameraGranted,
                            allowLabel: l10n.ventor_call_permission_allow,
                            grantedLabel: l10n.ventor_call_permission_granted,
                            onAllow: joinState.isJoining
                                ? null
                                : _requestCamera,
                          ),
                        ],
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    child: SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: FilledButton(
                        onPressed: _canJoin(joinState.isJoining)
                            ? () => _onEnterCall(context)
                            : null,
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          disabledBackgroundColor: SplashColors.purpleMid
                              .withValues(alpha: 0.4),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: joinState.isJoining
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                l10n.ventor_call_enter,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _ListenerHeader extends StatelessWidget {
  const _ListenerHeader({
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.durationMinutes,
    required this.speechLanguage,
    required this.isVideoCall,
    required this.l10n,
  });

  final String name;
  final String? avatarUrl;
  final double rating;
  final int durationMinutes;
  final String speechLanguage;
  final bool isVideoCall;
  final VentingMobLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: avatarUrl != null
                ? NetworkImage(avatarUrl!)
                : null,
            child: avatarUrl == null
                ? Text(
                    name.isNotEmpty ? name[0].toUpperCase() : '?',
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      size: 14,
                      color: VentorProfileTheme.gold,
                    ),
                    const SizedBox(width: 3),
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
                      l10n.ventor_sessions_duration_minutes(durationMinutes),
                      style: GoogleFonts.inter(
                        color: VentorProfileTheme.muted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  [
                    if (isVideoCall)
                      l10n.ventor_sessions_call_video
                    else
                      l10n.ventor_sessions_call_voice,
                    l10n.ventor_sessions_booked_speech_language(speechLanguage),
                  ].join(' · '),
                  style: GoogleFonts.inter(
                    color: VentorProfileTheme.muted,
                    fontSize: 12,
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

class _TipTile extends StatelessWidget {
  const _TipTile({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: VentorProfileTheme.cardFill,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: VentorProfileTheme.cardBorder),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: VentorProfileTheme.gold, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 13,
                  height: 1.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionRow extends StatelessWidget {
  const _PermissionRow({
    required this.icon,
    required this.label,
    required this.granted,
    required this.allowLabel,
    required this.grantedLabel,
    required this.onAllow,
  });

  final IconData icon;
  final String label;
  final bool granted;
  final String allowLabel;
  final String grantedLabel;
  final VoidCallback? onAllow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: VentorProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: VentorProfileTheme.cardBorder),
      ),
      child: Row(
        children: [
          Icon(icon, color: SplashColors.purpleMid, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          if (granted)
            Text(
              grantedLabel,
              style: GoogleFonts.inter(
                color: VentorProfileTheme.success,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            )
          else
            TextButton(
              onPressed: onAllow,
              style: TextButton.styleFrom(
                foregroundColor: SplashColors.purpleMid,
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              child: Text(
                allowLabel,
                style: GoogleFonts.inter(fontWeight: FontWeight.w700),
              ),
            ),
        ],
      ),
    );
  }
}
