import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_notification_preferences_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerNotificationPreferencesRepository extends BaseRepository {
  const ListenerNotificationPreferencesRepository(super.apiClient);

  TaskEither<Exception, ListenerNotificationPreferencesResponseModel>
  getPreferences() => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/me/notification-preferences'),
    fromJson: ListenerNotificationPreferencesResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerNotificationPreferencesResponseModel>
  updatePreferences({required Map<String, dynamic> body}) => executeRequest(
    request: apiClient.put<Object?>(
      'v1/listeners/me/notification-preferences',
      data: body,
    ),
    fromJson: ListenerNotificationPreferencesResponseModel.fromJson,
  );
}
