import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venting_mobile_app/presentation/auth/auth_destination.dart';
import 'package:venting_mobile_app/presentation/homescreen.dart';
import 'package:venting_mobile_app/presentation/listener_registration/listener_registration_screen.dart';
import 'package:venting_mobile_app/presentation/ventor_registration/ventor_registration_screen.dart';
import 'package:venting_mobile_app/utils/router_config.dart';

void navigateToAuthDestination(
  BuildContext context,
  AuthDestination destination,
) {
  destination.when(
    home: (userType) {
      context.go(AppRoutes.tabHome, extra: HomeScreenArgs(userType: userType));
    },
    ventorRegistration: (email) {
      context.go(
        AppRoutes.ventorRegistration,
        extra: VentorRegistrationArgs(email: email),
      );
    },
    listenerRegistration: (email) {
      context.go(
        AppRoutes.listenerRegistration,
        extra: ListenerRegistrationArgs(email: email),
      );
    },
    listenerUnderReview: () {
      context.go(AppRoutes.listenerProfileUnderReview);
    },
    listenerRejected: () {
      context.go(AppRoutes.listenerProfileRejected);
    },
  );
}
