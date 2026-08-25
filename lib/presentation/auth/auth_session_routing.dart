import 'package:venting_mobile_app/domain/data/api/auth_me_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/auth_user_model.dart';
import 'package:venting_mobile_app/presentation/auth/auth_destination.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';

/// Maps authenticated user / me payloads to post-login navigation targets.
class AuthSessionRouting {
  const AuthSessionRouting._();

  static AuthUserType mapRole(String role) => switch (role) {
    'listener' => AuthUserType.lissener,
    _ => AuthUserType.ventor,
  };

  /// Maps login/register/social `user` (+ optional check-email status) to a destination.
  static AuthDestination destinationForSessionUser(
    AuthUserModel user, {
    String? listenerProfileStatus,
  }) {
    final mappedType = mapRole(user.role);
    if (!user.registration_complete) {
      if (mappedType == AuthUserType.ventor) {
        return AuthDestination.ventorRegistration(email: user.email);
      }
      return AuthDestination.listenerRegistration(email: user.email);
    }

    if (mappedType == AuthUserType.lissener) {
      switch (listenerProfileStatus) {
        case 'under_review':
          return const AuthDestination.listenerUnderReview();
        case 'rejected':
          return const AuthDestination.listenerRejected();
        case 'incomplete':
          return AuthDestination.listenerRegistration(email: user.email);
        case 'approved':
        case null:
        default:
          break;
      }
    }

    return AuthDestination.home(userType: mappedType);
  }

  static AuthDestination destinationForAuthMe(AuthMeData authMe) {
    final mappedType = mapRole(authMe.role);

    if (!authMe.registration_complete) {
      if (mappedType == AuthUserType.ventor) {
        return AuthDestination.ventorRegistration(email: authMe.email);
      }
      return AuthDestination.listenerRegistration(email: authMe.email);
    }

    if (mappedType == AuthUserType.lissener) {
      switch (authMe.listener_profile_status) {
        case 'under_review':
          return const AuthDestination.listenerUnderReview();
        case 'rejected':
          return const AuthDestination.listenerRejected();
        case 'incomplete':
        case null:
          return AuthDestination.listenerRegistration(email: authMe.email);
        case 'approved':
        default:
          break;
      }
    }

    return AuthDestination.home(userType: mappedType);
  }
}
