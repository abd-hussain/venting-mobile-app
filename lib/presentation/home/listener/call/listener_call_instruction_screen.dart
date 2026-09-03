import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/bloc/listener_call_join/listener_call_join_bloc.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_args.dart';
import 'package:venting_mobile_app/presentation/home/listener/call/listener_call_screen.dart';
import 'package:venting_mobile_app/presentation/home/listener/profile/listener_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

class ListenerCallInstructionScreen extends StatefulWidget {
  const ListenerCallInstructionScreen({super.key, required this.args});

  final ListenerCallArgs args;

  @override
  State<ListenerCallInstructionScreen> createState() =>
      _ListenerCallInstructionScreenState();
}

class _ListenerCallInstructionScreenState
    extends State<ListenerCallInstructionScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
  );

  bool _micGranted = false;
  bool _cameraGranted = false;

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
      final l10n = VentingMobLocalizations.of(context);
      _showSnack(l10n.listener_call_permission_settings);
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

  bool _canJoin(bool isJoining) => _micGranted && _cameraGranted && !isJoining;

  void _onJoinCall(BuildContext context) {
    context.read<ListenerCallJoinBloc>().add(
      ListenerCallJoinEvent.joinRequested(sessionId: widget.args.sessionId),
    );
  }

  Future<void> _openCallScreen(ListenerCallJoinState state) async {
    final credentials = state.callCredentials;
    if (credentials == null) return;
    if (!mounted) return;
    await Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => ListenerCallScreen(
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
      create: (_) => diContainer<ListenerCallJoinBloc>(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _overlayStyle,
        child: BlocConsumer<ListenerCallJoinBloc, ListenerCallJoinState>(
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
                  l10n.listener_call_instructions_title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
                children: [
                  _VentorHeader(
                    name: args.ventorName,
                    avatarUrl: args.ventorAvatarUrl,
                    durationMinutes: args.durationMinutes,
                    l10n: l10n,
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: SplashColors.purpleMid.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: SplashColors.purpleMid.withValues(alpha: 0.35),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          args.isVideoCall
                              ? Icons.videocam_rounded
                              : Icons.call_rounded,
                          color: SplashColors.purpleMid,
                          size: 22,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            args.isVideoCall
                                ? l10n.listener_call_mode_video
                                : l10n.listener_call_mode_audio,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.listener_call_instructions_heading,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _InstructionTile(
                    icon: Icons.favorite_outline_rounded,
                    text: l10n.listener_call_instruction_respect,
                  ),
                  _InstructionTile(
                    icon: Icons.hearing_rounded,
                    text: l10n.listener_call_instruction_listen,
                  ),
                  _InstructionTile(
                    icon: Icons.shield_outlined,
                    text: l10n.listener_call_instruction_safe,
                  ),
                  _InstructionTile(
                    icon: Icons.timer_outlined,
                    text: l10n.listener_call_instruction_time(
                      args.durationMinutes,
                    ),
                  ),
                  _InstructionTile(
                    icon: Icons.block_flipped,
                    text: l10n.listener_call_instruction_boundaries,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    l10n.listener_call_permissions_heading,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    l10n.listener_call_permissions_subtitle,
                    style: GoogleFonts.inter(
                      color: ListenerProfileTheme.muted,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 14),
                  _PermissionTile(
                    icon: Icons.mic_rounded,
                    label: l10n.listener_call_permission_mic,
                    granted: _micGranted,
                    actionLabel: _micGranted
                        ? l10n.listener_call_permission_granted
                        : l10n.listener_call_permission_allow,
                    onTap: _micGranted || joinState.isJoining
                        ? null
                        : _requestMic,
                  ),
                  const SizedBox(height: 10),
                  _PermissionTile(
                    icon: Icons.videocam_rounded,
                    label: l10n.listener_call_permission_camera,
                    granted: _cameraGranted,
                    actionLabel: _cameraGranted
                        ? l10n.listener_call_permission_granted
                        : l10n.listener_call_permission_allow,
                    onTap: _cameraGranted || joinState.isJoining
                        ? null
                        : _requestCamera,
                  ),
                  const SizedBox(height: 28),
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: _canJoin(joinState.isJoining)
                          ? () => _onJoinCall(context)
                          : null,
                      style: FilledButton.styleFrom(
                        backgroundColor: SplashColors.purpleMid,
                        disabledBackgroundColor: SplashColors.purpleMid
                            .withValues(alpha: 0.35),
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
                                strokeWidth: 2.4,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              l10n.listener_call_join_now,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
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

class _VentorHeader extends StatelessWidget {
  const _VentorHeader({
    required this.name,
    required this.avatarUrl,
    required this.durationMinutes,
    required this.l10n,
  });

  final String name;
  final String? avatarUrl;
  final int durationMinutes;
  final VentingMobLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: SizedBox(
            width: 56,
            height: 56,
            child: avatarUrl != null && avatarUrl!.isNotEmpty
                ? Image.network(avatarUrl!, fit: BoxFit.cover)
                : ColoredBox(
                    color: SplashColors.purpleMid.withValues(alpha: 0.35),
                    child: Center(
                      child: Text(
                        name.isNotEmpty ? name[0].toUpperCase() : '?',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                l10n.listener_avail_min_value(durationMinutes),
                style: GoogleFonts.inter(
                  color: ListenerProfileTheme.muted,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _InstructionTile extends StatelessWidget {
  const _InstructionTile({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: SplashColors.purpleMid, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.inter(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: 14,
                height: 1.45,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const _PermissionTile({
    required this.icon,
    required this.label,
    required this.granted,
    required this.actionLabel,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool granted;
  final String actionLabel;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: ListenerProfileTheme.cardFill,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: granted
              ? ListenerProfileTheme.success.withValues(alpha: 0.4)
              : ListenerProfileTheme.cardBorder,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: granted ? ListenerProfileTheme.success : Colors.white70,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.inter(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          if (granted)
            const Icon(
              Icons.check_circle_rounded,
              color: ListenerProfileTheme.success,
              size: 20,
            )
          else
            TextButton(
              onPressed: onTap,
              child: Text(
                actionLabel,
                style: GoogleFonts.inter(
                  color: SplashColors.purpleMid,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
