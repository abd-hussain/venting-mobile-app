import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_notification_preferences_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class VentorNotificationPreferencesRepository extends BaseRepository {
  const VentorNotificationPreferencesRepository(super.apiClient);

  TaskEither<Exception, VentorNotificationPreferencesResponseModel>
  getPreferences() => executeRequest(
    request: apiClient.get<Object?>('v1/ventors/me/notification-preferences'),
    fromJson: VentorNotificationPreferencesResponseModel.fromJson,
  );

  TaskEither<Exception, VentorNotificationPreferencesResponseModel>
  updatePreferences({required Map<String, dynamic> body}) => executeRequest(
    request: apiClient.put<Object?>(
      'v1/ventors/me/notification-preferences',
      data: body,
    ),
    fromJson: VentorNotificationPreferencesResponseModel.fromJson,
  );
}
