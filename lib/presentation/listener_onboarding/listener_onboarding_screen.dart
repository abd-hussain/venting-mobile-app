import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venting_mobile_app/l10n/gen/app_localizations.dart';
import 'package:venting_mobile_app/presentation/listener_onboarding/widgets/listener_onboarding_illustrations.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/shared_widgets/app_language_selector.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

/// Listener onboarding shown after choosing
/// "I want to be a listener" on the welcome screen.
class ListenerOnboardingScreen extends StatefulWidget {
  const ListenerOnboardingScreen({super.key});

  @override
  State<ListenerOnboardingScreen> createState() =>
      _ListenerOnboardingScreenState();
}

class _ListenerOnboardingScreenState extends State<ListenerOnboardingScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  );

  static const _purple = SplashColors.purpleMid;
  static const _titleColor = Color(0xFF1A1228);
  static const _bodyColor = Color(0xFF6B6280);

  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<_ListenerPageData> _pages(VentingMobLocalizations l10n) => [
    _ListenerPageData(
      kind: ListenerOnboardingIllustrationKind.makeDifference,
      title: l10n.listener_onboarding_page1_title,
      description: l10n.listener_onboarding_page1_description,
      isLanding: true,
    ),
    _ListenerPageData(
      kind: ListenerOnboardingIllustrationKind.listenWithEmpathy,
      title: l10n.listener_onboarding_page2_title,
      description: l10n.listener_onboarding_page2_description,
    ),
    _ListenerPageData(
      kind: ListenerOnboardingIllustrationKind.buildProfile,
      title: l10n.listener_onboarding_page3_title,
      description: l10n.listener_onboarding_page3_description,
    ),
    _ListenerPageData(
      kind: ListenerOnboardingIllustrationKind.flexibleSupport,
      title: l10n.listener_onboarding_page4_title,
      description: l10n.listener_onboarding_page4_description,
    ),
  ];

  void _goToSignUp() {
    context.push(AppRoutes.authListenerRegister);
  }

  void _onNext(int pageCount) {
    if (_currentPage >= pageCount - 1) {
      _goToSignUp();
      return;
    }
    _pageController.nextPage(
      duration: const Duration(milliseconds: 360),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = VentingMobLocalizations.of(context);
    final pages = _pages(l10n);
    final isLanding = _currentPage == 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayStyle,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                const Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: AppLanguageSelector(),
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: pages.length,
                    onPageChanged: (index) {
                      setState(() => _currentPage = index);
                    },
                    itemBuilder: (context, index) {
                      return _ListenerPageView(data: pages[index]);
                    },
                  ),
                ),
                if (isLanding) ...[
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: FilledButton(
                      onPressed: () => _onNext(pages.length),
                      style: FilledButton.styleFrom(
                        backgroundColor: _purple,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                        textStyle: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      child: Text(l10n.onboarding_get_started),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _Dots(count: pages.length, index: _currentPage),
                ] else ...[
                  Row(
                    children: [
                      TextButton(
                        onPressed: _goToSignUp,
                        style: TextButton.styleFrom(
                          foregroundColor: _bodyColor,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 8,
                          ),
                        ),
                        child: Text(
                          l10n.onboarding_skip,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: _Dots(count: pages.length, index: _currentPage),
                      ),
                      Material(
                        color: _purple,
                        shape: const CircleBorder(),
                        child: InkWell(
                          customBorder: const CircleBorder(),
                          onTap: () => _onNext(pages.length),
                          child: const SizedBox(
                            width: 54,
                            height: 54,
                            child: Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ListenerPageData {
  const _ListenerPageData({
    required this.kind,
    required this.title,
    required this.description,
    this.isLanding = false,
  });

  final ListenerOnboardingIllustrationKind kind;
  final String title;
  final String description;
  final bool isLanding;
}

class _ListenerPageView extends StatelessWidget {
  const _ListenerPageView({required this.data});

  final _ListenerPageData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
              child: ListenerOnboardingIllustration(kind: data.kind),
            ),
          ),
        ),
        Text(
          data.title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: data.isLanding
                ? _ListenerOnboardingScreenState._titleColor
                : SplashColors.purpleMid,
            fontSize: data.isLanding ? 28 : 26,
            fontWeight: FontWeight.w700,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          data.description,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: _ListenerOnboardingScreenState._bodyColor,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 1.45,
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  const _Dots({required this.count, required this.index});

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
            color: active
                ? SplashColors.purpleMid
                : SplashColors.purpleMid.withValues(alpha: 0.22),
          ),
        );
      }),
    );
  }
}
