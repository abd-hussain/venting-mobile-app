import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_painters.dart';

/// Orchestrates the 6-step Venting splash animation.
class SplashAnimatedContent extends StatefulWidget {
  const SplashAnimatedContent({super.key});

  @override
  State<SplashAnimatedContent> createState() => _SplashAnimatedContentState();
}

class _SplashAnimatedContentState extends State<SplashAnimatedContent>
    with TickerProviderStateMixin {
  late final AnimationController _mainController;
  late final AnimationController _waveController;
  late final AnimationController _progressController;

  late final Animation<double> _outline;
  late final Animation<double> _fill;
  late final Animation<double> _dots;
  late final Animation<double> _face;
  late final Animation<double> _glow;
  late final Animation<double> _sparkles;
  late final Animation<double> _brand;
  late final Animation<double> _wave;
  late final Animation<double> _progressBar;
  late final Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();

    // Total sequence ~3.8s so it aligns with SplashBloc minimum duration.
    _mainController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3800),
    );

    _waveController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );

    _progressController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    // 1. START — faint outline
    _outline = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0, 0.14, curve: Curves.easeOut),
    );

    // 2. SHAPE FORMS — fill + dots
    _fill = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.12, 0.32, curve: Curves.easeOutCubic),
    );
    _dots = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.18, 0.36, curve: Curves.easeOut),
    );

    // 3. FACE APPEARS
    _face = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.30, 0.46, curve: Curves.easeOut),
    );

    // 4. GLOW & SPARKLE
    _glow = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.42, 0.62, curve: Curves.easeInOut),
    );
    _sparkles = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.44, 0.72, curve: Curves.easeOut),
    );
    _logoScale = Tween<double>(begin: 0.92, end: 1).animate(
      CurvedAnimation(
        parent: _mainController,
        curve: const Interval(0.42, 0.62, curve: Curves.easeOutBack),
      ),
    );

    // 5. BRAND REVEAL
    _brand = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.58, 0.78, curve: Curves.easeOut),
    );
    _wave = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.60, 0.82, curve: Curves.easeOut),
    );

    // 6. READY — progress bar
    _progressBar = CurvedAnimation(
      parent: _mainController,
      curve: const Interval(0.78, 1, curve: Curves.easeInOut),
    );

    _mainController.forward();
    _waveController.repeat();

    _mainController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _progressController.forward();
      }
    });
  }

  @override
  void dispose() {
    _mainController.dispose();
    _waveController.dispose();
    _progressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _mainController,
        _waveController,
        _progressController,
      ]),
      builder: (context, _) {
        return DecoratedBox(
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
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Ambient sparkles (lower + around logo)
              CustomPaint(
                painter: SplashSparklesPainter(
                  progress: _sparkles.value,
                  seed: 42,
                ),
              ),
              // Bottom waves
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.42,
                  width: double.infinity,
                  child: CustomPaint(
                    painter: SplashWavePainter(
                      progress: _wave.value,
                      phase: _waveController.value * 6.28,
                    ),
                  ),
                ),
              ),

              // Center brand stack
              SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const Spacer(flex: 3),
                    Transform.scale(
                      scale: _logoScale.value,
                      child: SizedBox(
                        width: 140,
                        height: 140,
                        child: CustomPaint(
                          painter: SplashLogoPainter(
                            outlineProgress: _outline.value,
                            fillProgress: _fill.value,
                            faceProgress: _face.value,
                            dotsProgress: _dots.value,
                            glowProgress: _glow.value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Opacity(
                      opacity: _brand.value,
                      child: Transform.translate(
                        offset: Offset(0, 16 * (1 - _brand.value)),
                        child: Column(
                          children: [
                            _VentingWordmark(opacity: _brand.value),
                            const SizedBox(height: 14),
                            Text(
                              'BE HEARD. FEEL BETTER.',
                              style: GoogleFonts.inter(
                                color: Colors.white.withValues(
                                  alpha: 0.78 * _brand.value,
                                ),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 3.6,
                                height: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(flex: 4),
                    if (_progressBar.value > 0.01)
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          48,
                          0,
                          48,
                          24 + MediaQuery.paddingOf(context).bottom,
                        ),
                        child: Opacity(
                          opacity: _progressBar.value,
                          child: _SplashProgressBar(
                            // Keep filling while main finishes, then continue.
                            value: _progressBar.value < 1
                                ? _progressBar.value * 0.55
                                : 0.55 + (_progressController.value * 0.45),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 4 + 24 + MediaQuery.paddingOf(context).bottom,
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _VentingWordmark extends StatelessWidget {
  const _VentingWordmark({required this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    final textStyle = GoogleFonts.greatVibes(
      fontSize: 64,
      fontWeight: FontWeight.w400,
      height: 1,
      letterSpacing: 0.5,
    );

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        // Soft neon glow behind script.
        Text(
          'Venting',
          style: textStyle.copyWith(
            color: SplashColors.purpleGlow.withValues(alpha: 0.45 * opacity),
            shadows: [
              Shadow(
                color: SplashColors.purpleGlow.withValues(alpha: 0.8 * opacity),
                blurRadius: 24,
              ),
              Shadow(
                color: SplashColors.purpleMid.withValues(alpha: 0.5 * opacity),
                blurRadius: 40,
              ),
            ],
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcIn,
          shaderCallback: (bounds) =>
              SplashColors.brandGradient.createShader(bounds),
          child: Text('Venting', style: textStyle),
        ),
        // Tiny heart at the end of the "g" tail (decorative).
        Positioned(
          right: 4,
          bottom: 4,
          child: Opacity(
            opacity: opacity,
            child: Icon(
              Icons.favorite_border_rounded,
              size: 14,
              color: SplashColors.purpleLight.withValues(alpha: 0.9),
            ),
          ),
        ),
      ],
    );
  }
}

class _SplashProgressBar extends StatelessWidget {
  const _SplashProgressBar({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      decoration: BoxDecoration(
        color: SplashColors.purpleDeep.withValues(alpha: 0.28),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: value.clamp(0.0, 1.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: SplashColors.progressGradient,
              borderRadius: BorderRadius.circular(999),
              boxShadow: [
                BoxShadow(
                  color: SplashColors.purpleGlow.withValues(alpha: 0.55),
                  blurRadius: 10,
                  spreadRadius: 0.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
