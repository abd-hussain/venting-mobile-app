import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/usecase/complete_listener_registration_usecase.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';

enum _SubmitPhase { submitting, success, error }

/// Finalizes listener registration via `POST /v1/listeners/register/complete`.
class ListenerRegistrationSubmitScreen extends StatefulWidget {
  const ListenerRegistrationSubmitScreen({
    super.key,
    required this.fcmToken,
    required this.onSuccess,
    required this.onRetryFromNotifications,
  });

  final String? fcmToken;
  final VoidCallback onSuccess;
  final VoidCallback onRetryFromNotifications;

  @override
  State<ListenerRegistrationSubmitScreen> createState() =>
      _ListenerRegistrationSubmitScreenState();
}

class _ListenerRegistrationSubmitScreenState
    extends State<ListenerRegistrationSubmitScreen>
    with SingleTickerProviderStateMixin {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static const _accent = Color(0xFF8A3CFE);
  static const _muted = Color(0xFF9B93AB);

  late final AnimationController _pulseController;

  _SubmitPhase _phase = _SubmitPhase.submitting;
  String? _errorMessage;
  var _attempt = 0;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);
    WidgetsBinding.instance.addPostFrameCallback((_) => _submit());
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!mounted) return;
    setState(() {
      _phase = _SubmitPhase.submitting;
      _errorMessage = null;
      _attempt += 1;
    });

    final result = await diContainer<CompleteListenerRegistrationUsecase>()(
      fcmToken: widget.fcmToken,
    ).run();

    if (!mounted) return;

    result.match(
      (error) {
        setState(() {
          _phase = _SubmitPhase.error;
          _errorMessage = _mapError(error);
        });
      },
      (_) {
        setState(() => _phase = _SubmitPhase.success);
        widget.onSuccess();
      },
    );
  }

  String _mapError(Object error) {
    if (error is MainAPIException) {
      final localized = error.getLocalizedMessage();
      if (localized.isNotEmpty) return localized;
      if (error.message.isNotEmpty) return error.message;
    }
    return VentingMobLocalizations.of(
      context,
    ).listener_reg_submit_error_generic;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);

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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 2),
                  Center(child: _HeroPulse(controller: _pulseController)),
                  const SizedBox(height: 32),
                  Text(
                    _phase == _SubmitPhase.error
                        ? l10n.listener_reg_submit_error_title
                        : l10n.listener_reg_submit_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _phase == _SubmitPhase.error
                        ? (_errorMessage ??
                              l10n.listener_reg_submit_error_generic)
                        : l10n.listener_reg_submit_subtitle,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      color: _muted,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 28),
                  if (_phase == _SubmitPhase.submitting) ...[
                    _ProgressCard(
                      title: l10n.listener_reg_submit_progress_title,
                      items: [
                        l10n.listener_reg_submit_progress_profile,
                        l10n.listener_reg_submit_progress_identity,
                        l10n.listener_reg_submit_progress_voice,
                        l10n.listener_reg_submit_progress_preferences,
                      ],
                      attempt: _attempt,
                    ),
                  ] else if (_phase == _SubmitPhase.error) ...[
                    _HintCard(text: l10n.listener_reg_submit_error_hint),
                  ],
                  const Spacer(flex: 3),
                  if (_phase == _SubmitPhase.error) ...[
                    SizedBox(
                      height: 56,
                      child: FilledButton(
                        onPressed: _submit,
                        style: FilledButton.styleFrom(
                          backgroundColor: _accent,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ),
                          textStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        child: Text(l10n.common_retry),
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: widget.onRetryFromNotifications,
                      child: Text(
                        l10n.listener_reg_submit_back_to_notifications,
                        style: GoogleFonts.inter(
                          color: _accent,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroPulse extends StatelessWidget {
  const _HeroPulse({required this.controller});

  final AnimationController controller;

  static const _accent = Color(0xFF8A3CFE);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final scale = 1 + (controller.value * 0.06);
        return Transform.scale(
          scale: scale,
          child: SizedBox(
            width: 132,
            height: 132,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 132,
                  height: 132,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _accent.withValues(alpha: 0.12),
                    boxShadow: [
                      BoxShadow(
                        color: _accent.withValues(alpha: 0.22),
                        blurRadius: 28,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 44,
                  height: 44,
                  child: CircularProgressIndicator(
                    strokeWidth: 3.2,
                    color: _accent,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.title,
    required this.items,
    required this.attempt,
  });

  final String title;
  final List<String> items;
  final int attempt;

  static const _accent = Color(0xFF8A3CFE);
  static const _cardFill = Color(0xFF1C1826);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      decoration: BoxDecoration(
        color: _cardFill,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: _accent.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              color: _accent,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          for (final item in items) ...[
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Color(0xFF9B93AB),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      item,
                      style: GoogleFonts.inter(
                        color: Colors.white.withValues(alpha: 0.88),
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (attempt > 1)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                VentingMobLocalizations.of(
                  context,
                ).listener_reg_submit_retrying(attempt),
                style: GoogleFonts.inter(
                  color: const Color(0xFF9B93AB),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HintCard extends StatelessWidget {
  const _HintCard({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1826),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          color: const Color(0xFF9B93AB),
          fontSize: 14,
          height: 1.45,
        ),
      ),
    );
  }
}
