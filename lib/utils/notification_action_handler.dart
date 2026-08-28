import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/domain/data/app/listener_notification.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_step_slug.dart';
import 'package:venting_mobile_app/domain/usecase/get_cached_auth_me_usecase.dart';
import 'package:venting_mobile_app/presentation/home/listener/dashboard/listener_training_bottom_sheet.dart';
import 'package:venting_mobile_app/presentation/home/listener/listener_home_shell.dart';
import 'package:venting_mobile_app/presentation/home/ventor/ventor_home_shell.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_screen.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/ventor_registration_screen.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

enum NotificationAudience { listener, ventor }

/// Navigates from an inbox notification tap based on API `data.action` / type.
Future<void> handleAppNotificationAction({
  required BuildContext context,
  required AppNotification notification,
  required NotificationAudience audience,
}) async {
  if (!context.mounted) return;

  switch (notification.action) {
    case AppNotificationAction.openRegistration:
      await _openRegistration(
        context: context,
        audience: audience,
        nextStep: notification.nextStep,
      );
    case AppNotificationAction.bookFirstSession:
      await _openFirstSession(context: context, audience: audience);
    case AppNotificationAction.openAvailability:
      _openListenerAvailability(context);
    case AppNotificationAction.openDiscoverListeners:
      _openVentorSessions(context);
    case AppNotificationAction.openTraining:
      await openListenerTrainingBottomSheet(context: context);
    case AppNotificationAction.none:
      break;
  }
}

Future<void> _openRegistration({
  required BuildContext context,
  required NotificationAudience audience,
  String? nextStep,
}) async {
  final email = diContainer<GetCachedAuthMeUsecase>()()?.email ?? '';

  if (audience == NotificationAudience.listener) {
    final initialStep = nextStep == null
        ? null
        : ListenerRegistrationStepSlug.fromPathSegment(
            nextStep,
          )?.toWizardStep();

    await context.push(
      AppRoutes.listenerRegistration,
      extra: ListenerRegistrationArgs(email: email, initialStep: initialStep),
    );
    return;
  }

  await context.push(
    AppRoutes.ventorRegistration,
    extra: VentorRegistrationArgs(email: email),
  );
}

Future<void> _openFirstSession({
  required BuildContext context,
  required NotificationAudience audience,
}) async {
  if (audience == NotificationAudience.listener) {
    _openListenerAvailability(context);
    return;
  }

  _openVentorSessions(context);
}

void _openListenerAvailability(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
  ListenerHomeShell.goToTab(context, ListenerHomeShell.availabilityTab);
}

void _openVentorSessions(BuildContext context) {
  Navigator.of(context).popUntil((route) => route.isFirst);
  VentorHomeShell.goToTab(context, VentorHomeShell.sessionsTab);
}
