import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/home/ventor/profile/ventor_profile_theme.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/custom_buttomsheet.dart';

class EditVentorProfileResult {
  const EditVentorProfileResult({
    required this.name,
    this.avatarFilePath,
    this.clearLocalAvatar = false,
  });

  final String name;

  /// Local picked image path. Null means keep the previous local/remote avatar
  /// unless [clearLocalAvatar] is true.
  final String? avatarFilePath;
  final bool clearLocalAvatar;
}

/// Shows a sheet to edit ventor display name and avatar photo.
Future<EditVentorProfileResult?> showEditVentorProfileBottomSheet({
  required BuildContext context,
  required String initialName,
  String? initialAvatarUrl,
  String? initialAvatarFilePath,
}) {
  return CustomButtomsheet(
    context: context,
    backgroundColor: VentorProfileTheme.cardFill,
    padding: EdgeInsets.zero,
  ).show<EditVentorProfileResult>(
    widget: EditVentorProfileBottomSheet(
      initialName: initialName,
      initialAvatarUrl: initialAvatarUrl,
      initialAvatarFilePath: initialAvatarFilePath,
    ),
  );
}

class EditVentorProfileBottomSheet extends StatefulWidget {
  const EditVentorProfileBottomSheet({
    super.key,
    required this.initialName,
    this.initialAvatarUrl,
    this.initialAvatarFilePath,
  });

  final String initialName;
  final String? initialAvatarUrl;
  final String? initialAvatarFilePath;

  static const maxNameLength = 20;

  @override
  State<EditVentorProfileBottomSheet> createState() =>
      _EditVentorProfileBottomSheetState();
}

class _EditVentorProfileBottomSheetState
    extends State<EditVentorProfileBottomSheet> {
  late final TextEditingController _nameController;
  late final FocusNode _nameFocus;
  final _picker = ImagePicker();

  String? _pickedPath;
  var _clearLocalAvatar = false;
  var _picking = false;
  var _submitted = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _nameFocus = FocusNode();
    _nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  String get _trimmedName => _nameController.text.trim();

  bool get _nameValid =>
      _trimmedName.isNotEmpty &&
      _trimmedName.characters.length <=
          EditVentorProfileBottomSheet.maxNameLength;

  bool get _hasChanges {
    final nameChanged = _trimmedName != widget.initialName.trim();
    final photoChanged = _pickedPath != null || _clearLocalAvatar;
    return nameChanged || photoChanged;
  }

  bool get _canSave => _nameValid && _hasChanges;

  Future<void> _pickPhoto(ImageSource source) async {
    if (_picking) return;
    setState(() => _picking = true);
    try {
      final file = await _picker.pickImage(source: source, imageQuality: 85);
      if (!mounted || file == null) return;
      setState(() {
        _pickedPath = file.path;
        _clearLocalAvatar = false;
      });
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.camera_init_failed_generic)));
    } finally {
      if (mounted) setState(() => _picking = false);
    }
  }

  Future<void> _onChangePhoto() async {
    final l10n = VentingMobLocalizations.of(context);
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      backgroundColor: VentorProfileTheme.cardFill,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.photo_library_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    l10n.ventor_profile_edit_photo_gallery,
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                  onTap: () => Navigator.pop(context, ImageSource.gallery),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    l10n.ventor_profile_edit_photo_camera,
                    style: GoogleFonts.inter(color: Colors.white),
                  ),
                  onTap: () => Navigator.pop(context, ImageSource.camera),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (source == null || !mounted) return;
    await _pickPhoto(source);
  }

  void _onSave() {
    setState(() => _submitted = true);
    if (!_canSave) return;
    Navigator.of(context).pop(
      EditVentorProfileResult(
        name: _trimmedName,
        avatarFilePath: _pickedPath,
        clearLocalAvatar: _clearLocalAvatar,
      ),
    );
  }

  Widget _avatarPreview() {
    final picked = _pickedPath;
    if (picked != null) {
      return Image.file(File(picked), fit: BoxFit.cover);
    }
    final local = widget.initialAvatarFilePath;
    if (!_clearLocalAvatar && local != null && File(local).existsSync()) {
      return Image.file(File(local), fit: BoxFit.cover);
    }
    final url = widget.initialAvatarUrl;
    if (url != null && url.isNotEmpty) {
      return Image.network(
        url,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => const ColoredBox(
          color: Color(0xFF2A1848),
          child: Icon(Icons.person_rounded, color: Colors.white70, size: 48),
        ),
      );
    }
    return const ColoredBox(
      color: Color(0xFF2A1848),
      child: Icon(Icons.person_rounded, color: Colors.white70, size: 48),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final count = _nameController.text.characters.length;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    final showNameError = _submitted && !_nameValid;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 20 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            l10n.ventor_profile_edit_title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.ventor_profile_edit_subtitle,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: VentorProfileTheme.muted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 22),
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: SplashColors.purpleMid.withValues(alpha: 0.55),
                      width: 2.5,
                    ),
                  ),
                  child: ClipOval(child: _avatarPreview()),
                ),
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: Material(
                    color: SplashColors.purpleMid,
                    shape: const CircleBorder(),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: _picking ? null : _onChangePhoto,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: _picking
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Icon(
                                Icons.photo_camera_rounded,
                                size: 16,
                                color: Colors.white,
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: _picking ? null : _onChangePhoto,
            child: Text(
              l10n.ventor_profile_edit_change_photo,
              style: GoogleFonts.inter(
                color: SplashColors.purpleMid,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.ventor_profile_edit_name_label,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _nameController,
            focusNode: _nameFocus,
            maxLength: EditVentorProfileBottomSheet.maxNameLength,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            textInputAction: TextInputAction.done,
            style: GoogleFonts.inter(color: Colors.white, fontSize: 15),
            decoration: InputDecoration(
              hintText: l10n.ventor_profile_edit_name_hint,
              hintStyle: GoogleFonts.inter(color: VentorProfileTheme.muted),
              counterText: '',
              filled: true,
              fillColor: SplashColors.backgroundBottom.withValues(alpha: 0.55),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 14,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: VentorProfileTheme.cardBorder),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: VentorProfileTheme.cardBorder),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: SplashColors.purpleMid),
              ),
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(color: Color(0xFFEF4444)),
              ),
              errorText: showNameError
                  ? l10n.ventor_reg_nickname_required
                  : null,
            ),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              l10n.listener_profile_edit_about_me_counter(
                count,
                EditVentorProfileBottomSheet.maxNameLength,
              ),
              style: GoogleFonts.inter(
                color: VentorProfileTheme.muted,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton(
              onPressed: _canSave ? _onSave : null,
              style: FilledButton.styleFrom(
                backgroundColor: SplashColors.purpleMid,
                disabledBackgroundColor: SplashColors.purpleMid.withValues(
                  alpha: 0.35,
                ),
                foregroundColor: Colors.white,
                disabledForegroundColor: Colors.white.withValues(alpha: 0.7),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                textStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              child: Text(l10n.listener_profile_edit),
            ),
          ),
        ],
      ),
    );
  }
}
