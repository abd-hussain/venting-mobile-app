import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/presentation/auth/auth_screen.dart';

part 'auth_destination.freezed.dart';

@freezed
sealed class AuthDestination with _$AuthDestination {
  const factory AuthDestination.home({required AuthUserType userType}) =
      _AuthDestinationHome;

  const factory AuthDestination.ventorRegistration({required String email}) =
      _AuthDestinationVentorRegistration;

  const factory AuthDestination.listenerRegistration({required String email}) =
      _AuthDestinationListenerRegistration;

  const factory AuthDestination.listenerUnderReview() =
      _AuthDestinationListenerUnderReview;

  const factory AuthDestination.listenerRejected() =
      _AuthDestinationListenerRejected;
}
