import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/registration_notifications_data.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/ventor_register_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/homescreen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/steps/ventor_registration_interests_step.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/steps/ventor_registration_language_step.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/steps/ventor_registration_notifications_step.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class VentorRegistrationArgs {
  const VentorRegistrationArgs({required this.email});

  final String email;
}

enum VentorGender { male, female, preferNotToSay }

/// Ventor registration: profile → language → interests → dashboard.
class VentorRegistrationScreen extends StatefulWidget {
  const VentorRegistrationScreen({super.key, required this.email});

  final String email;

  @override
  State<VentorRegistrationScreen> createState() =>
      _VentorRegistrationScreenState();
}

class _VentorRegistrationScreenState extends State<VentorRegistrationScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _fieldFill = Color(0xFF1C1826);
  static const _muted = Color(0xFF9B93AB);
  static const _label = Color(0xFF9B93AB);
  static const _accent = Color(0xFF8A3CFE);
  static const _chipFill = Color(0xFF2A2140);
  static const _progressTrack = Color(0xFF3A2F52);
  static const _totalSteps = 4;
  static const _maxNicknameLength = 20;

  static const _presetAvatarAssets = <String>[
    'assets/images/avatar1.svg',
    'assets/images/avatar2.svg',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
  ];

  final _nicknameController = TextEditingController();
  final _nicknameFocus = FocusNode();
  final _picker = ImagePicker();

  int _stepIndex = 0;
  int? _selectedAvatarIndex;
  String? _galleryPhotoPath;
  VentorGender? _gender;
  bool _submitted = false;
  bool _pickingPhoto = false;
  bool _isSubmitting = false;
  Set<String> _selectedLanguageIds = {};
  VentorInterestsSelection? _interestsSelection;

  @override
  void initState() {
    super.initState();
    _nicknameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _nicknameController.dispose();
    _nicknameFocus.dispose();
    super.dispose();
  }

  String get _nickname => _nicknameController.text.trim();

  bool get _isNicknameValid =>
      _nickname.isNotEmpty && _nickname.length <= _maxNicknameLength;

  bool get _canContinue => _isNicknameValid && _gender != null;

  List<String> _suggestions(VentingMobLocalizations l10n) => [
    l10n.ventor_reg_suggestion_1,
    l10n.ventor_reg_suggestion_2,
    l10n.ventor_reg_suggestion_3,
    l10n.ventor_reg_suggestion_4,
    l10n.ventor_reg_suggestion_5,
  ];

  void _applySuggestion(String value) {
    _nicknameController
      ..text = value
      ..selection = TextSelection.collapsed(offset: value.length);
    setState(() {});
  }

  Future<void> _pickFromGallery() async {
    if (_pickingPhoto) return;
    setState(() => _pickingPhoto = true);
    try {
      final file = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (!mounted || file == null) return;
      setState(() {
        _galleryPhotoPath = file.path;
        _selectedAvatarIndex = null;
      });
    } catch (_) {
      if (!mounted) return;
      final l10n = VentingMobLocalizations.of(context);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.camera_init_failed_generic)));
    } finally {
      if (mounted) setState(() => _pickingPhoto = false);
    }
  }

  void _onContinue() {
    setState(() => _submitted = true);
    if (!_canContinue) return;
    setState(() => _stepIndex = 1);
  }

  void _onContinueLanguages(VentorLanguagesSelection selection) {
    setState(() {
      _selectedLanguageIds = selection.languageIds.toSet();
      _stepIndex = 2;
    });
  }

  String get _genderApiValue {
    return switch (_gender!) {
      VentorGender.male => 'male',
      VentorGender.female => 'female',
      VentorGender.preferNotToSay => 'prefer_not_to_say',
    };
  }

  void _onContinueInterests(VentorInterestsSelection selection) {
    setState(() {
      _interestsSelection = selection;
      _stepIndex = 3;
    });
  }

  Future<void> _onFinishNotifications(
    RegistrationNotificationsData notifications,
  ) async {
    if (_isSubmitting) return;
    final interests = _interestsSelection;
    if (interests == null || _gender == null || _selectedLanguageIds.isEmpty) {
      return;
    }

    setState(() => _isSubmitting = true);

    final result = await diContainer<VentorRegisterUsecase>()(
      nickname: _nickname,
      gender: _genderApiValue,
      languageIds: _selectedLanguageIds.toList(growable: false),
      interestIds: interests.interestIds,
      otherInterestText: interests.otherInterestText,
      avatarPresetIndex: _galleryPhotoPath == null
          ? _selectedAvatarIndex
          : null,
      avatarFilePath: _galleryPhotoPath,
      notificationsEnabled: notifications.notificationsEnabled,
      fcmToken: notifications.fcmToken,
    ).run();

    if (!mounted) return;

    result.match(
      (error) {
        setState(() => _isSubmitting = false);
        final message = _mapRegisterError(error);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
      },
      (_) {
        context.go(
          AppRoutes.tabHome,
          extra: const HomeScreenArgs(userType: AuthUserType.ventor),
        );
      },
    );
  }

  String _mapRegisterError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    return VentingMobLocalizations.of(context).common_unknown_error;
  }

  void _onBack() {
    if (_isSubmitting) return;
    if (_stepIndex > 0) {
      setState(() => _stepIndex -= 1);
      return;
    }
    if (context.canPop()) {
      context.pop();
    } else {
      // Arrived via `go` after login/register — no stack to pop.
      context.go(AppRoutes.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final count = _nicknameController.text.characters.length;
    final showNicknameError = _submitted && !_isNicknameValid;
    final showGenderError = _submitted && _gender == null;
    final suggestions = _suggestions(l10n);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: SplashColors.backgroundTop,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                SplashColors.backgroundTop,
                SplashColors.backgroundBottom,
              ],
            ),
          ),
          child: SafeArea(
            child: switch (_stepIndex) {
              1 => VentorRegistrationLanguageStep(
                onBack: _onBack,
                onContinue: _onContinueLanguages,
                initialSelectedIds: _selectedLanguageIds,
              ),
              2 => VentorRegistrationInterestsStep(
                onBack: _onBack,
                onContinue: _onContinueInterests,
                initialSelection: _interestsSelection,
              ),
              3 => VentorRegistrationNotificationsStep(
                onBack: _onBack,
                onContinue: _onFinishNotifications,
                isSubmitting: _isSubmitting,
              ),
              _ => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: Row(
                      children: [
                        Material(
                          color: _fieldFill,
                          shape: const CircleBorder(),
                          child: InkWell(
                            customBorder: const CircleBorder(),
                            onTap: _onBack,
                            child: Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _accent.withValues(alpha: 0.55),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_back_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '1/$_totalSteps',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: List.generate(_totalSteps, (i) {
                            final active = i == 0;
                            return Padding(
                              padding: EdgeInsetsDirectional.only(
                                start: i == 0 ? 0 : 5,
                              ),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 220),
                                width: active ? 28 : 18,
                                height: 5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(999),
                                  color: active ? _accent : _progressTrack,
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 28, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.ventor_reg_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              height: 1.15,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            l10n.ventor_reg_subtitle,
                            style: GoogleFonts.inter(
                              color: _muted,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              height: 1.45,
                            ),
                          ),
                          const SizedBox(height: 28),
                          Text(
                            l10n.ventor_reg_nickname_label,
                            style: GoogleFonts.inter(
                              color: _label,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: _nicknameController,
                            focusNode: _nicknameFocus,
                            maxLength: _maxNicknameLength,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _onContinue(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            cursorColor: _accent,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                RegExp(r'[a-zA-Z0-9_\u0600-\u06FF ]'),
                              ),
                              LengthLimitingTextInputFormatter(
                                _maxNicknameLength,
                              ),
                            ],
                            decoration: InputDecoration(
                              hintText: l10n.ventor_reg_nickname_hint,
                              hintStyle: GoogleFonts.inter(
                                color: _muted.withValues(alpha: 0.75),
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              counterText: '',
                              filled: true,
                              fillColor: _fieldFill,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 16,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: showNicknameError
                                      ? const Color(0xFFE11D48)
                                      : _accent,
                                  width: 1.2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: showNicknameError
                                      ? const Color(0xFFE11D48)
                                      : _accent,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              if (showNicknameError)
                                Expanded(
                                  child: Text(
                                    l10n.ventor_reg_nickname_required,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFFE11D48),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              else
                                const Spacer(),
                              Text(
                                '$count/$_maxNicknameLength',
                                style: GoogleFonts.inter(
                                  color: _muted,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            l10n.ventor_reg_suggestions_label,
                            style: GoogleFonts.inter(
                              color: _label,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              for (final suggestion in suggestions)
                                _SuggestionChip(
                                  label: suggestion,
                                  selected: _nickname == suggestion,
                                  onTap: () => _applySuggestion(suggestion),
                                ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Text(
                            l10n.ventor_reg_gender_label,
                            style: GoogleFonts.inter(
                              color: _label,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              _GenderChip(
                                label: l10n.ventor_reg_gender_male,
                                selected: _gender == VentorGender.male,
                                onTap: () {
                                  setState(() => _gender = VentorGender.male);
                                },
                              ),
                              _GenderChip(
                                label: l10n.ventor_reg_gender_female,
                                selected: _gender == VentorGender.female,
                                onTap: () {
                                  setState(() => _gender = VentorGender.female);
                                },
                              ),
                              _GenderChip(
                                label: l10n.ventor_reg_gender_prefer_not,
                                selected:
                                    _gender == VentorGender.preferNotToSay,
                                onTap: () {
                                  setState(
                                    () => _gender = VentorGender.preferNotToSay,
                                  );
                                },
                              ),
                            ],
                          ),
                          if (showGenderError) ...[
                            const SizedBox(height: 8),
                            Text(
                              l10n.ventor_reg_gender_required,
                              style: GoogleFonts.inter(
                                color: const Color(0xFFE11D48),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                          const SizedBox(height: 24),
                          Text(
                            l10n.ventor_reg_avatar_label,
                            style: GoogleFonts.inter(
                              color: _label,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 14),
                          SizedBox(
                            height: 72,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount: _presetAvatarAssets.length + 1,
                              separatorBuilder: (_, _) =>
                                  const SizedBox(width: 12),
                              itemBuilder: (context, index) {
                                if (index == 0) {
                                  return SizedBox(
                                    width: 72,
                                    height: 72,
                                    child: _GalleryAvatarOption(
                                      photoPath: _galleryPhotoPath,
                                      selected: _galleryPhotoPath != null,
                                      picking: _pickingPhoto,
                                      onTap: _pickFromGallery,
                                      onClear: _galleryPhotoPath == null
                                          ? null
                                          : () {
                                              setState(
                                                () => _galleryPhotoPath = null,
                                              );
                                            },
                                    ),
                                  );
                                }

                                final avatarIndex = index - 1;
                                final selected =
                                    _selectedAvatarIndex == avatarIndex;
                                return SizedBox(
                                  width: 72,
                                  height: 72,
                                  child: _AvatarOption(
                                    assetPath: _presetAvatarAssets[avatarIndex],
                                    selected: selected,
                                    onTap: () {
                                      setState(() {
                                        _galleryPhotoPath = null;
                                        _selectedAvatarIndex = selected
                                            ? null
                                            : avatarIndex;
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
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
                        onPressed: _onContinue,
                        style: FilledButton.styleFrom(
                          backgroundColor: _canContinue
                              ? _accent
                              : _accent.withValues(alpha: 0.42),
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
                      l10n.ventor_reg_change_anytime,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        color: _muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            },
          ),
        ),
      ),
    );
  }
}

class _SuggestionChip extends StatelessWidget {
  const _SuggestionChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected
          ? _VentorRegistrationScreenState._accent.withValues(alpha: 0.28)
          : _VentorRegistrationScreenState._chipFill,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected
                  ? _VentorRegistrationScreenState._accent
                  : Colors.transparent,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: selected ? Colors.white : const Color(0xFFC9B8E8),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}

class _GenderChip extends StatelessWidget {
  const _GenderChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: _VentorRegistrationScreenState._chipFill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? _VentorRegistrationScreenState._accent
                  : Colors.transparent,
              width: selected ? 1.4 : 1,
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: selected
                  ? Colors.white
                  : _VentorRegistrationScreenState._muted,
              fontSize: 14,
              fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _GalleryAvatarOption extends StatelessWidget {
  const _GalleryAvatarOption({
    required this.photoPath,
    required this.selected,
    required this.picking,
    required this.onTap,
    this.onClear,
  });

  final String? photoPath;
  final bool selected;
  final bool picking;
  final VoidCallback onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final hasPhoto = photoPath != null;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: picking ? null : onTap,
        onLongPress: onClear,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _VentorRegistrationScreenState._chipFill,
            border: Border.all(
              color: selected || !hasPhoto
                  ? _VentorRegistrationScreenState._accent
                  : Colors.white.withValues(alpha: 0.12),
              width: selected ? 2.2 : 1.4,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: ColoredBox(
                color: _VentorRegistrationScreenState._fieldFill,
                child: hasPhoto
                    ? Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.file(File(photoPath!), fit: BoxFit.cover),
                          if (picking)
                            const ColoredBox(
                              color: Color(0x66000000),
                              child: Center(
                                child: SizedBox(
                                  width: 22,
                                  height: 22,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      )
                    : Center(
                        child: picking
                            ? const SizedBox(
                                width: 22,
                                height: 22,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: _VentorRegistrationScreenState._accent,
                                ),
                              )
                            : const Icon(
                                Icons.add_rounded,
                                color: _VentorRegistrationScreenState._accent,
                                size: 30,
                              ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarOption extends StatelessWidget {
  const _AvatarOption({
    required this.assetPath,
    required this.selected,
    required this.onTap,
  });

  final String assetPath;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: selected
                  ? _VentorRegistrationScreenState._accent
                  : Colors.white.withValues(alpha: 0.12),
              width: selected ? 2.2 : 1.2,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: _VentorRegistrationScreenState._accent.withValues(
                        alpha: 0.35,
                      ),
                      blurRadius: 12,
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: assetPath.endsWith('.svg')
                  ? SvgPicture.asset(
                      assetPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    )
                  : Image.asset(
                      assetPath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
