import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

/// Step 2 — Identity verification (government ID + selfie).
class ListenerRegistrationStep2IdentityVerification extends StatefulWidget {
  const ListenerRegistrationStep2IdentityVerification({
    super.key,
    required this.onContinue,
  });

  final VoidCallback onContinue;

  @override
  State<ListenerRegistrationStep2IdentityVerification> createState() =>
      _ListenerRegistrationStep2IdentityVerificationState();
}

class _ListenerRegistrationStep2IdentityVerificationState
    extends State<ListenerRegistrationStep2IdentityVerification> {
  static const _cardFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);

  final _picker = ImagePicker();

  String? _idImagePath;
  String? _selfieImagePath;
  bool _capturingId = false;
  bool _capturingSelfie = false;

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
      setState(() => _idImagePath = file.path);
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
      setState(() => _selfieImagePath = file.path);
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

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    l10n.listener_reg_identity_title,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.listener_reg_identity_subtitle,
                    style: GoogleFonts.inter(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 15,
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
                    cardFill: _cardFill,
                    muted: _muted,
                    onTap: _captureId,
                  ),
                  const SizedBox(height: 12),
                  _VerificationCaptureCard(
                    title: l10n.listener_reg_identity_selfie_title,
                    subtitle: l10n.listener_reg_identity_selfie_subtitle,
                    icon: Icons.person_rounded,
                    imagePath: _selfieImagePath,
                    isLoading: _capturingSelfie,
                    cardFill: _cardFill,
                    muted: _muted,
                    circularPreview: true,
                    onTap: _captureSelfie,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 54,
            child: FilledButton(
              onPressed: _canContinue ? widget.onContinue : null,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                disabledBackgroundColor: SplashColors.purpleMid.withValues(
                  alpha: 0.35,
                ),
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
              child: Text(l10n.listener_reg_continue),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            l10n.listener_reg_identity_secure_note,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
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
    required this.cardFill,
    required this.muted,
    required this.onTap,
    this.circularPreview = false,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final String? imagePath;
  final bool isLoading;
  final Color cardFill;
  final Color muted;
  final VoidCallback onTap;
  final bool circularPreview;

  @override
  Widget build(BuildContext context) {
    final hasImage = imagePath != null;

    return Material(
      color: cardFill,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: isLoading ? null : onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
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
                        color: muted,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              _PreviewTile(
                icon: icon,
                imagePath: imagePath,
                isLoading: isLoading,
                circular: circularPreview,
                hasImage: hasImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewTile extends StatelessWidget {
  const _PreviewTile({
    required this.icon,
    required this.imagePath,
    required this.isLoading,
    required this.circular,
    required this.hasImage,
  });

  final IconData icon;
  final String? imagePath;
  final bool isLoading;
  final bool circular;
  final bool hasImage;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(circular ? 24 : 14);

    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: radius,
          child: Container(
            width: 56,
            height: 56,
            color: SplashColors.purpleMid,
            child: hasImage
                ? Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                    width: 56,
                    height: 56,
                  )
                : Icon(icon, color: Colors.white, size: 26),
          ),
        ),
        if (isLoading)
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.45),
              borderRadius: radius,
            ),
            child: const Center(
              child: SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  strokeWidth: 2.2,
                  color: Colors.white,
                ),
              ),
            ),
          )
        else if (hasImage)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Color(0xFF22C55E),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.check, size: 14, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
