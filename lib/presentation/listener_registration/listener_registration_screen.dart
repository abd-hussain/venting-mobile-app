import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';
import 'package:venting_mobile_app/presentation/homescreen.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_step.dart';
import 'package:venting_mobile_app/presentation/listener_registration/status/listener_profile_status.dart';
import 'package:venting_mobile_app/presentation/listener_registration/status/listener_profile_status_screen.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step1_create_account.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step2_identity_verification.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step3_about_you.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step4_life_experience.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step5_comfort_areas.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step6_boundaries.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step7_voice_intro.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step8_availability.dart';
import 'package:venting_mobile_app/presentation/listener_registration/steps/listener_registration_step9_notifications.dart';
import 'package:venting_mobile_app/presentation/listener_registration/widgets/listener_registration_header.dart';
import 'package:venting_mobile_app/presentation/splash/widgets/splash_colors.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

class ListenerRegistrationArgs {
  const ListenerRegistrationArgs({required this.email, this.initialStep});

  final String email;
  final ListenerRegistrationStep? initialStep;
}

/// Multi-step listener registration flow (9 steps).
class ListenerRegistrationScreen extends StatefulWidget {
  const ListenerRegistrationScreen({
    super.key,
    required this.email,
    this.initialStep,
  });

  final String email;
  final ListenerRegistrationStep? initialStep;

  @override
  State<ListenerRegistrationScreen> createState() =>
      _ListenerRegistrationScreenState();
}

class _ListenerRegistrationScreenState
    extends State<ListenerRegistrationScreen> {
  static const _overlayStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: SplashColors.backgroundBottom,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  ListenerRegistrationStep _step = ListenerRegistrationStep.createAccount;
  bool _showUnderReview = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialStep != null) {
      _step = widget.initialStep!;
    }
  }

  void _goTo(ListenerRegistrationStep step) {
    setState(() => _step = step);
  }

  void _onBack() {
    if (_showUnderReview) {
      setState(() => _showUnderReview = false);
      return;
    }
    final previous = _step.previous;
    if (previous == null) {
      context.pop();
      return;
    }
    _goTo(previous);
  }

  void _onContinue() {
    if (_step == ListenerRegistrationStep.notifications) {
      setState(() => _showUnderReview = true);
      return;
    }
    final next = _step.next;
    if (next == null) return;
    _goTo(next);
  }

  void _onSkipForNow() {
    context.go(
      AppRoutes.tabHome,
      extra: const HomeScreenArgs(userType: AuthUserType.lissener),
    );
  }

  Widget _buildStep() {
    return switch (_step) {
      ListenerRegistrationStep.createAccount =>
        ListenerRegistrationStep1CreateAccount(
          email: widget.email,
          onContinue: _onContinue,
        ),
      ListenerRegistrationStep.identityVerification =>
        ListenerRegistrationStep2IdentityVerification(onContinue: _onContinue),
      ListenerRegistrationStep.aboutYou => ListenerRegistrationStep3AboutYou(
        onContinue: _onContinue,
      ),
      ListenerRegistrationStep.experience =>
        ListenerRegistrationStep4LifeExperience(onContinue: _onContinue),
      ListenerRegistrationStep.expertise =>
        ListenerRegistrationStep5ComfortAreas(onContinue: _onContinue),
      ListenerRegistrationStep.boundaries =>
        ListenerRegistrationStep6Boundaries(onContinue: _onContinue),
      ListenerRegistrationStep.voiceIntro =>
        ListenerRegistrationStep7VoiceIntro(onContinue: _onContinue),
      ListenerRegistrationStep.availability =>
        ListenerRegistrationStep8Availability(onContinue: _onContinue),
      ListenerRegistrationStep.notifications =>
        ListenerRegistrationStep9Notifications(onContinue: _onContinue),
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_showUnderReview) {
      return const ListenerProfileStatusScreen(
        status: ListenerProfileStatus.underReview,
      );
    }

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
            child: Column(
              children: [
                ListenerRegistrationHeader(
                  step: _step,
                  onBack: _onBack,
                  onSkip: _onSkipForNow,
                ),
                Expanded(child: _buildStep()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
