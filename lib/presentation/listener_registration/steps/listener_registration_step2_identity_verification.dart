import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/utils/registration_image.dart';
import 'package:venting_mobile_app/utils/registration_media_storage.dart';

/// Step 2 — Identity verification (government ID + selfie).
class ListenerRegistrationStep2IdentityVerification extends StatefulWidget {
  const ListenerRegistrationStep2IdentityVerification({
    super.key,
    required this.onContinue,
    this.initialIdImagePath,
    this.initialSelfieImagePath,
  });

  final ValueChanged<ListenerRegistrationStep2Data> onContinue;
  final String? initialIdImagePath;
  final String? initialSelfieImagePath;

  @override
  State<ListenerRegistrationStep2IdentityVerification> createState() =>
      _ListenerRegistrationStep2IdentityVerificationState();
}

class _ListenerRegistrationStep2IdentityVerificationState
    extends State<ListenerRegistrationStep2IdentityVerification> {
  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);

  final _picker = ImagePicker();

  String? _idImagePath;
  String? _selfieImagePath;
  bool _capturingId = false;
  bool _capturingSelfie = false;

  @override
  void initState() {
    super.initState();
    _idImagePath = widget.initialIdImagePath;
    _selfieImagePath = widget.initialSelfieImagePath;
  }

  bool get _canContinue => _idImagePath != null && _selfieImagePath != null;

  Future<void> _captureId() async {
    if (_capturingId || _capturingSelfie) return;
    setState(() => _capturingId = true);
    try {
      // Prefer back camera for government ID (rear is ImagePicker default).
      final file = await _picker.pickImage(
        source: ImageSource.camera,
        // ignore: avoid_redundant_argument_values
        preferredCameraDevice: CameraDevice.rear,
        imageQuality: 85,
      );
      if (!mounted || file == null) return;
      final persisted = await RegistrationMediaStorage.persistImage(
        file.path,
        prefix: 'identity_document',
      );
      if (!mounted) return;
      setState(() => _idImagePath = persisted);
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.camera_init_failed_generic)));
    } finally {
      if (mounted) setState(() => _capturingId = false);
    }
  }

  Future<void> _captureSelfie() async {
    if (_capturingId || _capturingSelfie) return;
    setState(() => _capturingSelfie = true);
    try {
      final file = await _picker.pickImage(
        source: ImageSource.camera,
        preferredCameraDevice: CameraDevice.front,
        imageQuality: 85,
      );
      if (!mounted || file == null) return;
      final persisted = await RegistrationMediaStorage.persistImage(
        file.path,
        prefix: 'selfie',
      );
      if (!mounted) return;
      setState(() => _selfieImagePath = persisted);
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.camera_init_failed_generic)));
    } finally {
      if (mounted) setState(() => _capturingSelfie = false);
    }
  }

  void _submit() {
    if (!_canContinue) return;
    widget.onContinue(
      ListenerRegistrationStep2Data(
        idImagePath: _idImagePath!,
        selfieImagePath: _selfieImagePath!,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 12, 24, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.listener_reg_identity_title,
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    height: 1.15,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  l10n.listener_reg_identity_subtitle,
                  style: GoogleFonts.inter(
                    color: _muted,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.45,
                  ),
                ),
                const SizedBox(height: 28),
                _VerificationCaptureCard(
                  title: l10n.listener_reg_identity_upload_id_title,
                  subtitle: l10n.listener_reg_identity_upload_id_subtitle,
                  icon: Icons.badge_outlined,
                  imagePath: _idImagePath,
                  isLoading: _capturingId,
                  onTap: _captureId,
                ),
                const SizedBox(height: 14),
                _VerificationCaptureCard(
                  title: l10n.listener_reg_identity_selfie_title,
                  subtitle: l10n.listener_reg_identity_selfie_subtitle,
                  icon: Icons.photo_camera_front_outlined,
                  imagePath: _selfieImagePath,
                  isLoading: _capturingSelfie,
                  onTap: _captureSelfie,
                ),
                const SizedBox(height: 28),
                Text(
                  l10n.listener_reg_identity_how_title,
                  style: GoogleFonts.inter(
                    color: _muted,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 16),
                _HowStep(
                  number: 1,
                  label: l10n.listener_reg_identity_how_step1,
                ),
                const SizedBox(height: 14),
                _HowStep(
                  number: 2,
                  label: l10n.listener_reg_identity_how_step2,
                ),
                const SizedBox(height: 14),
                _HowStep(
                  number: 3,
                  label: l10n.listener_reg_identity_how_step3,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
          child: SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: _canContinue ? _submit : null,
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
              child: Text(l10n.listener_reg_continue),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
          child: Text(
            l10n.listener_reg_identity_secure_note,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: _muted,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class _VerificationCaptureCard extends StatelessWidget {
  const _VerificationCaptureCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.imagePath,
    required this.isLoading,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String? imagePath;
  final bool isLoading;
  final VoidCallback onTap;

  static const _muted = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _iconFill = Color(0xFF2A2140);
  static const _success = Color(0xFF22C55E);

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath != null;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(18),
        child: CustomPaint(
          painter: _DashedRRectPainter(
            color: hasImage ? _accent : _accent.withValues(alpha: 0.55),
            radius: 18,
            strokeWidth: 1.4,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: _iconFill,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: hasImage
                          ? Image(
                              image: registrationImageProvider(imagePath)!,
                              fit: BoxFit.cover,
                              width: 48,
                              height: 48,
                            )
                          : Icon(icon, color: _accent, size: 24),
                    ),
                    if (isLoading)
                      Positioned.fill(
                        child: ColoredBox(
                          color: Colors.black.withValues(alpha: 0.45),
                          child: const Center(
                            child: SizedBox(
                              width: 18,
                              height: 18,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    else if (hasImage)
                      Positioned(
                        right: -4,
                        bottom: -4,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            color: _success,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check_rounded,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: GoogleFonts.inter(
                          color: _muted,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 1.35,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right_rounded,
                  color: _accent,
                  size: 26,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HowStep extends StatelessWidget {
  const _HowStep({required this.number, required this.label});

  final int number;
  final String label;

  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: _accent,
            shape: BoxShape.circle,
          ),
          child: Text(
            '$number',
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
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
      ],
    );
  }
}

class _DashedRRectPainter extends CustomPainter {
  const _DashedRRectPainter({
    required this.color,
    required this.radius,
    required this.strokeWidth,
  });

  final Color color;
  final double radius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        strokeWidth / 2,
        strokeWidth / 2,
        size.width - strokeWidth,
        size.height - strokeWidth,
      ),
      Radius.circular(radius),
    );

    final path = Path()..addRRect(rect);
    for (final metric in path.computeMetrics()) {
      const dashLength = 6.0;
      const gapLength = 4.5;
      var distance = 0.0;
      while (distance < metric.length) {
        final next = math.min(distance + dashLength, metric.length);
        canvas.drawPath(metric.extractPath(distance, next), paint);
        distance = next + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedRRectPainter oldDelegate) =>
      oldDelegate.color != color ||
      oldDelegate.radius != radius ||
      oldDelegate.strokeWidth != strokeWidth;
}
