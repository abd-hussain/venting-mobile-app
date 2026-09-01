import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_register_repository.dart';
import 'package:venting_mobile_app/utils/registration_fcm.dart';

class CompleteVentorRegistrationUsecase {
  const CompleteVentorRegistrationUsecase(
    this._repository,
    this._ventingPreferences,
  );

  final VentorRegisterRepository _repository;
  final VentingPreferences _ventingPreferences;

  TaskEither<Exception, VentorProfileResponseModel> call({
    required bool notificationsEnabled,
    String? fcmToken,
  }) {
    return TaskEither(() async {
      final resolvedFcmToken = await resolveRegistrationFcmToken(fcmToken);
      final result = await _repository
          .completeRegistration(
            notificationsEnabled: notificationsEnabled,
            fcmToken: resolvedFcmToken,
          )
          .run();

      if (result.isLeft()) {
        return Left(result.getLeft().toNullable()!);
      }

      final response = result.getOrElse(
        (_) => throw StateError('Expected ventor registration complete'),
      );

      try {
        await _ventingPreferences.setValue(
          SavedConstants.compleateRegistration,
          'true',
        );
        await _ventingPreferences.setValue(SavedConstants.userType, 'ventor');
        return Right(response);
      } on Object catch (error, stackTrace) {
        return Left(
          MainAPIException(
            status: 'failed',
            type: 'unknown',
            code: -1,
            message: error.toString(),
            stackTrace: stackTrace,
          ),
        );
      }
    });
  }
}
