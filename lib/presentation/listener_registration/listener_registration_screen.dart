import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/app/registration_notifications_data.dart';
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
import 'package:venting_mobile_app/presentation/listener_registration/submit/listener_registration_submit_screen.dart';
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
  late final ListenerRegistrationDraft _draft;
  var _showSubmit = false;
  var _showUnderReview = false;

  @override
  void initState() {
    super.initState();
    _draft = ListenerRegistrationDraft(email: widget.email);
    if (widget.initialStep != null) {
      _step = widget.initialStep!;
    }
  }

  void _goTo(ListenerRegistrationStep step) {
    setState(() {
      _showSubmit = false;
      _step = step;
    });
  }

  void _onBack() {
    if (_showUnderReview) {
      setState(() => _showUnderReview = false);
      return;
    }
    if (_showSubmit) {
      setState(() => _showSubmit = false);
      return;
    }
    final previous = _step.previous;
    if (previous == null) {
      if (context.canPop()) {
        context.pop();
      } else {
        context.go(AppRoutes.welcome);
      }
      return;
    }
    _goTo(previous);
  }

  void _onStep1Continue(ListenerRegistrationStep1Data data) {
    _draft.applyStep1(data);
    _goTo(ListenerRegistrationStep.identityVerification);
  }

  void _onStep2Continue(ListenerRegistrationStep2Data data) {
    _draft.applyStep2(data);
    _goTo(ListenerRegistrationStep.aboutYou);
  }

  void _onStep3Continue(ListenerRegistrationStep3Data data) {
    _draft.applyStep3(data);
    _goTo(ListenerRegistrationStep.experience);
  }

  void _onStep4Continue(ListenerRegistrationStep4Data data) {
    _draft.applyStep4(data);
    _goTo(ListenerRegistrationStep.expertise);
  }

  void _onStep5Continue(ListenerRegistrationStep5Data data) {
    _draft.applyStep5(data);
    _goTo(ListenerRegistrationStep.boundaries);
  }

  void _onStep6Continue(ListenerRegistrationStep6Data data) {
    _draft.applyStep6(data);
    _goTo(ListenerRegistrationStep.voiceIntro);
  }

  void _onStep7Continue(ListenerRegistrationStep7Data data) {
    _draft.applyStep7(data);
    _goTo(ListenerRegistrationStep.availability);
  }

  void _onStep8Continue(ListenerRegistrationStep8Data data) {
    _draft.applyStep8(data);
    _goTo(ListenerRegistrationStep.notifications);
  }

  void _onStep9Continue(RegistrationNotificationsData data) {
    _draft.applyStep9(data);
    setState(() => _showSubmit = true);
  }

  void _onSubmitSuccess() {
    setState(() {
      _showSubmit = false;
      _showUnderReview = true;
    });
  }

  void _onRetryFromNotifications() {
    setState(() {
      _showSubmit = false;
      _step = ListenerRegistrationStep.notifications;
    });
  }

  void _onSkipForNow() {
    context.go(
      AppRoutes.tabHome,
      extra: const HomeScreenArgs(userType: AuthUserType.lissener),
    );
  }

  IsoCode? _phoneCountryFromDraft() {
    try {
      return IsoCode.values.byName(_draft.phoneCountryIso);
    } catch (_) {
      return IsoCode.JO;
    }
  }

  Widget _buildStep() {
    return switch (_step) {
      ListenerRegistrationStep.createAccount =>
        ListenerRegistrationStep1CreateAccount(
          email: widget.email,
          initialProfilePhotoPath: _draft.profilePhotoPath,
          initialFullName: _draft.fullName,
          initialPhoneNational: _draft.phoneNational,
          initialPhoneCountry: _phoneCountryFromDraft(),
          initialAgreedToTerms: _draft.agreedToTerms,
          onContinue: _onStep1Continue,
        ),
      ListenerRegistrationStep.identityVerification =>
        ListenerRegistrationStep2IdentityVerification(
          initialIdImagePath: _draft.idImagePath,
          initialSelfieImagePath: _draft.selfieImagePath,
          onContinue: _onStep2Continue,
        ),
      ListenerRegistrationStep.aboutYou => ListenerRegistrationStep3AboutYou(
        initialDateOfBirth: _draft.dateOfBirth,
        initialCountryIso: _draft.countryIso,
        initialCity: _draft.city,
        initialLanguageIds: _draft.languageIds,
        onContinue: _onStep3Continue,
      ),
      ListenerRegistrationStep.experience =>
        ListenerRegistrationStep4LifeExperience(
          initialRelationshipId: _draft.relationshipId,
          initialFamilyIds: _draft.familyIds,
          initialExperienceIds: _draft.experienceIds,
          initialCustomExperiences: _draft.customExperiences,
          onContinue: _onStep4Continue,
        ),
      ListenerRegistrationStep.expertise =>
        ListenerRegistrationStep5ComfortAreas(
          initialSelectedIds: _draft.comfortAreaIds,
          initialOtherText: _draft.comfortAreaOtherText,
          onContinue: _onStep5Continue,
        ),
      ListenerRegistrationStep.boundaries =>
        ListenerRegistrationStep6Boundaries(
          initialSelectedIds: _draft.boundaryIds,
          initialOtherText: _draft.boundaryOtherText,
          onContinue: _onStep6Continue,
        ),
      ListenerRegistrationStep.voiceIntro =>
        ListenerRegistrationStep7VoiceIntro(
          initialRecordingPath: _draft.voiceIntroPath,
          initialRecordedSeconds: _draft.voiceIntroSeconds,
          onContinue: _onStep7Continue,
        ),
      ListenerRegistrationStep.availability =>
        ListenerRegistrationStep8Availability(
          initialTimeZoneId: _draft.timeZoneId,
          initialSelectedDays: _draft.availabilityDays,
          initialFromHour: _draft.availabilityFrom,
          initialToHour: _draft.availabilityTo,
          initialAcceptInstantCall: _draft.acceptInstantCalls,
          initialSessionMinutes: _draft.sessionMinutes,
          onContinue: _onStep8Continue,
        ),
      ListenerRegistrationStep.notifications =>
        ListenerRegistrationStep9Notifications(onContinue: _onStep9Continue),
    };
  }

  @override
  Widget build(BuildContext context) {
    if (_showUnderReview) {
      return const ListenerProfileStatusScreen(
        status: ListenerProfileStatus.underReview,
      );
    }

    if (_showSubmit) {
      return ListenerRegistrationSubmitScreen(
        draft: _draft,
        onSuccess: _onSubmitSuccess,
        onRetryFromNotifications: _onRetryFromNotifications,
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
