import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/main_onboarding/widgets/onboarding_illustrations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class MainOnboardingScreen extends StatefulWidget {
  const MainOnboardingScreen({super.key});

  @override
  State<MainOnboardingScreen> createState() => _MainOnboardingScreenState();
}

class _MainOnboardingScreenState extends State<MainOnboardingScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarContrastEnforced: false,
  );

  static const _ctaGradient = LinearGradient(
    colors: [Color(0xFFB44DFF), Color(0xFFFF4DB8)],
  );

  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<_OnboardingPageData> _pages(VentingMobLocalizations l10n) => [
    _OnboardingPageData(
      kind: OnboardingIllustrationKind.brand,
      title: l10n.onboarding_page1_title,
      tagline: l10n.onboarding_page1_tagline,
      description: l10n.onboarding_page1_description,
      isBrandPage: true,
    ),
    _OnboardingPageData(
      kind: OnboardingIllustrationKind.listener,
      title: l10n.onboarding_page2_title,
      description: l10n.onboarding_page2_description,
    ),
    _OnboardingPageData(
      kind: OnboardingIllustrationKind.privacy,
      title: l10n.onboarding_page3_title,
      description: l10n.onboarding_page3_description,
    ),
    _OnboardingPageData(
      kind: OnboardingIllustrationKind.rewards,
      title: l10n.onboarding_page4_title,
      description: l10n.onboarding_page4_description,
    ),
    _OnboardingPageData(
      kind: OnboardingIllustrationKind.community,
      title: l10n.onboarding_page5_title,
      description: l10n.onboarding_page5_description,
    ),
  ];

  Future<void> _completeOnboarding() async {
    await diContainer<VentingPreferences>().setValue(
      SavedConstants.onboardingShown,
      true,
    );
    if (!mounted) return;
    context.go(AppRoutes.welcome);
  }

  void _onNext(int pageCount) {
    if (_currentPage >= pageCount - 1) {
      _completeOnboarding();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 380),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final pages = _pages(l10n);
    final isLast = _currentPage == pages.length - 1;

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
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      const AppLanguageSelector(),
                      const Spacer(),
                      TextButton(
                        onPressed: _completeOnboarding,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white.withValues(alpha: 0.72),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          l10n.onboarding_skip,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) {
                        return _OnboardingPageView(data: pages[index]);
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  _PageDots(count: pages.length, index: _currentPage),
                  const SizedBox(height: 20),
                  _GradientButton(
                    label: isLast
                        ? l10n.onboarding_get_started
                        : l10n.onboarding_next,
                    gradient: _ctaGradient,
                    onPressed: () => _onNext(pages.length),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.kind,
    required this.title,
    required this.description,
    this.tagline,
    this.isBrandPage = false,
  });

  final OnboardingIllustrationKind kind;
  final String title;
  final String description;
  final String? tagline;
  final bool isBrandPage;
}

class _OnboardingPageView extends StatelessWidget {
  const _OnboardingPageView({required this.data});

  final _OnboardingPageData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 280, maxHeight: 280),
              child: OnboardingIllustration(kind: data.kind),
            ),
          ),
        ),
        if (data.isBrandPage) ...[
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              height: 1.1,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            data.tagline ?? '',
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white.withValues(alpha: 0.55),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              letterSpacing: 2.8,
            ),
          ),
        ] else ...[
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
          ),
        ],
        const SizedBox(height: 14),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class _PageDots extends StatelessWidget {
  const _PageDots({required this.count, required this.index});

  final int count;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final active = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: active ? 18 : 7,
          height: 7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            gradient: active
                ? const LinearGradient(
                    colors: [Color(0xFFB44DFF), Color(0xFFFF4DB8)],
                  )
                : null,
            color: active ? null : Colors.white.withValues(alpha: 0.22),
          ),
        );
      }),
    );
  }
}

class _GradientButton extends StatelessWidget {
  const _GradientButton({
    required this.label,
    required this.gradient,
    required this.onPressed,
  });

  final String label;
  final Gradient gradient;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(28),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFF4DB8).withValues(alpha: 0.28),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(28),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
