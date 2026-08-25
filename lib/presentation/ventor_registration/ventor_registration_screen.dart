import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/ventor_register_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/homescreen.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/steps/ventor_registration_interests_step.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/steps/ventor_registration_language_step.dart';
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
  static const _maxNicknameLength = 20;

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

  Future<void> _onFinishInterests(VentorInterestsSelection selection) async {
    if (_isSubmitting) return;
    if (_gender == null || _selectedLanguageIds.isEmpty) return;

    setState(() => _isSubmitting = true);

    final result = await diContainer<VentorRegisterUsecase>()(
      nickname: _nickname,
      gender: _genderApiValue,
      languageIds: _selectedLanguageIds.toList(growable: false),
      interestIds: selection.interestIds,
      otherInterestText: selection.otherInterestText,
      avatarPresetIndex: _galleryPhotoPath == null
          ? _selectedAvatarIndex
          : null,
      avatarFilePath: _galleryPhotoPath,
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
                onFinish: _onFinishInterests,
                isSubmitting: _isSubmitting,
              ),
              _ => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: IconButton(
                      onPressed: _onBack,
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            l10n.ventor_reg_title,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.ventor_reg_subtitle,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.65),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              height: 1.4,
                            ),
                          ),
                          const SizedBox(height: 28),
                          TextField(
                            controller: _nicknameController,
                            focusNode: _nicknameFocus,
                            maxLength: _maxNicknameLength,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) => _onContinue(),
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            cursorColor: SplashColors.purpleMid,
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
                                color: _muted,
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
                                      : Colors.white.withValues(alpha: 0.08),
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: showNicknameError
                                      ? const Color(0xFFE11D48)
                                      : SplashColors.purpleMid,
                                  width: 1.4,
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
                          const SizedBox(height: 14),
                          Text(
                            l10n.ventor_reg_suggestions_label,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.7),
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
                          const SizedBox(height: 28),
                          Text(
                            l10n.ventor_reg_gender_label,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 12),
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
                          const SizedBox(height: 28),
                          Text(
                            l10n.ventor_reg_avatar_label,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.85),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _VentorAvatarStyle.values.length + 1,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 16,
                                  crossAxisSpacing: 16,
                                ),
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return _GalleryAvatarOption(
                                  photoPath: _galleryPhotoPath,
                                  selected: _galleryPhotoPath != null,
                                  picking: _pickingPhoto,
                                  label: l10n.ventor_reg_avatar_gallery,
                                  onTap: _pickFromGallery,
                                  onClear: _galleryPhotoPath == null
                                      ? null
                                      : () {
                                          setState(
                                            () => _galleryPhotoPath = null,
                                          );
                                        },
                                );
                              }

                              final avatarIndex = index - 1;
                              final selected =
                                  _selectedAvatarIndex == avatarIndex;
                              return _AvatarOption(
                                style: _VentorAvatarStyle.values[avatarIndex],
                                selected: selected,
                                onTap: () {
                                  setState(() {
                                    _galleryPhotoPath = null;
                                    _selectedAvatarIndex = selected
                                        ? null
                                        : avatarIndex;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
                    child: SizedBox(
                      height: 54,
                      child: FilledButton(
                        onPressed: _onContinue,
                        style: FilledButton.styleFrom(
                          backgroundColor: SplashColors.purpleMid,
                          disabledBackgroundColor: SplashColors.purpleMid
                              .withValues(alpha: 0.35),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock_outline_rounded,
                          size: 14,
                          color: Colors.white.withValues(alpha: 0.55),
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            l10n.ventor_reg_change_anytime,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: Colors.white.withValues(alpha: 0.55),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
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
          ? SplashColors.purpleMid.withValues(alpha: 0.22)
          : _VentorRegistrationScreenState._fieldFill,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.1),
            ),
          ),
          child: Text(
            label,
            style: GoogleFonts.inter(
              color: selected
                  ? Colors.white
                  : _VentorRegistrationScreenState._muted,
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
      color: selected
          ? SplashColors.purpleMid.withValues(alpha: 0.22)
          : _VentorRegistrationScreenState._fieldFill,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.1),
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
    required this.label,
    required this.onTap,
    this.onClear,
  });

  final String? photoPath;
  final bool selected;
  final bool picking;
  final String label;
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
            border: Border.all(
              color: selected
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.12),
              width: selected ? 2.5 : 1.2,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: SplashColors.purpleMid.withValues(alpha: 0.35),
                      blurRadius: 12,
                    ),
                  ]
                : null,
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
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (picking)
                            const SizedBox(
                              width: 22,
                              height: 22,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: SplashColors.purpleMid,
                              ),
                            )
                          else
                            const Icon(
                              Icons.add_a_photo_outlined,
                              color: SplashColors.purpleMid,
                              size: 26,
                            ),
                          const SizedBox(height: 6),
                          Text(
                            label,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              color: _VentorRegistrationScreenState._muted,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum _VentorAvatarStyle {
  nightPeaks,
  mistValley,
  twinSpires,
  moonRidge,
  crystalPeak,
  duskHorizon,
}

class _AvatarOption extends StatelessWidget {
  const _AvatarOption({
    required this.style,
    required this.selected,
    required this.onTap,
  });

  final _VentorAvatarStyle style;
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
                  ? SplashColors.purpleMid
                  : Colors.white.withValues(alpha: 0.12),
              width: selected ? 2.5 : 1.2,
            ),
            boxShadow: selected
                ? [
                    BoxShadow(
                      color: SplashColors.purpleMid.withValues(alpha: 0.35),
                      blurRadius: 12,
                    ),
                  ]
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.all(3),
            child: ClipOval(
              child: CustomPaint(
                painter: _VentorAvatarPainter(style: style),
                child: const SizedBox.expand(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _VentorAvatarPainter extends CustomPainter {
  const _VentorAvatarPainter({required this.style});

  final _VentorAvatarStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final bg = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: _bgColors,
      ).createShader(rect);
    canvas.drawRect(rect, bg);

    final mountain = Paint()..color = _mountainColor;
    final accent = Paint()..color = _accentColor;

    switch (style) {
      case _VentorAvatarStyle.nightPeaks:
        _drawPeaks(canvas, size, mountain, [0.15, 0.5, 0.85], 0.55);
        _drawMoon(canvas, size, accent, const Offset(0.72, 0.28), 0.1);
      case _VentorAvatarStyle.mistValley:
        _drawPeaks(canvas, size, mountain, [0.2, 0.55, 0.9], 0.62);
        _drawGlow(canvas, size, accent, const Offset(0.5, 0.42), 0.18);
      case _VentorAvatarStyle.twinSpires:
        _drawPeaks(canvas, size, mountain, [0.28, 0.72], 0.48);
        _drawMoon(canvas, size, accent, const Offset(0.5, 0.22), 0.08);
      case _VentorAvatarStyle.moonRidge:
        _drawPeaks(canvas, size, mountain, [0.18, 0.48, 0.78], 0.58);
        _drawMoon(canvas, size, accent, const Offset(0.3, 0.26), 0.12);
      case _VentorAvatarStyle.crystalPeak:
        _drawPeaks(canvas, size, mountain, [0.5], 0.42);
        _drawGlow(canvas, size, accent, const Offset(0.5, 0.35), 0.14);
      case _VentorAvatarStyle.duskHorizon:
        _drawPeaks(canvas, size, mountain, [0.22, 0.6, 0.88], 0.66);
        _drawMoon(canvas, size, accent, const Offset(0.78, 0.34), 0.09);
    }

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width * 0.52,
      Paint()
        ..shader = RadialGradient(
          colors: [Colors.transparent, Colors.black.withValues(alpha: 0.25)],
        ).createShader(rect),
    );
  }

  List<Color> get _bgColors => switch (style) {
    _VentorAvatarStyle.nightPeaks => const [
      Color(0xFF2A1848),
      Color(0xFF12081F),
    ],
    _VentorAvatarStyle.mistValley => const [
      Color(0xFF3A1F5C),
      Color(0xFF1A0F2E),
    ],
    _VentorAvatarStyle.twinSpires => const [
      Color(0xFF24143F),
      Color(0xFF0E0718),
    ],
    _VentorAvatarStyle.moonRidge => const [
      Color(0xFF321C52),
      Color(0xFF140A24),
    ],
    _VentorAvatarStyle.crystalPeak => const [
      Color(0xFF4A2680),
      Color(0xFF1C0F33),
    ],
    _VentorAvatarStyle.duskHorizon => const [
      Color(0xFF3B1858),
      Color(0xFF160A28),
    ],
  };

  Color get _mountainColor => switch (style) {
    _VentorAvatarStyle.nightPeaks => const Color(0xFF7B3FD6),
    _VentorAvatarStyle.mistValley => const Color(0xFF9B5CFF),
    _VentorAvatarStyle.twinSpires => const Color(0xFF6A32C4),
    _VentorAvatarStyle.moonRidge => const Color(0xFF8E4AE8),
    _VentorAvatarStyle.crystalPeak => const Color(0xFFB44DFF),
    _VentorAvatarStyle.duskHorizon => const Color(0xFF7C3AED),
  };

  Color get _accentColor => SplashColors.purpleLight.withValues(alpha: 0.85);

  void _drawPeaks(
    Canvas canvas,
    Size size,
    Paint paint,
    List<double> xs,
    double peakY,
  ) {
    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(0, size.height * 0.78);

    for (final x in xs) {
      path.lineTo(size.width * x, size.height * peakY);
      path.lineTo(size.width * (x + 0.12).clamp(0.0, 1.0), size.height * 0.78);
    }

    path
      ..lineTo(size.width, size.height * 0.78)
      ..lineTo(size.width, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  void _drawMoon(
    Canvas canvas,
    Size size,
    Paint paint,
    Offset relative,
    double radiusFactor,
  ) {
    canvas.drawCircle(
      Offset(size.width * relative.dx, size.height * relative.dy),
      size.width * radiusFactor,
      paint,
    );
  }

  void _drawGlow(
    Canvas canvas,
    Size size,
    Paint paint,
    Offset relative,
    double radiusFactor,
  ) {
    final center = Offset(size.width * relative.dx, size.height * relative.dy);
    canvas.drawCircle(
      center,
      size.width * radiusFactor,
      Paint()
        ..shader =
            RadialGradient(
              colors: [paint.color, paint.color.withValues(alpha: 0)],
            ).createShader(
              Rect.fromCircle(
                center: center,
                radius: size.width * radiusFactor,
              ),
            ),
    );
  }

  @override
  bool shouldRepaint(covariant _VentorAvatarPainter oldDelegate) =>
      oldDelegate.style != style;
}
