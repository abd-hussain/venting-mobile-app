import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_notifications_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerNotificationsRepository extends BaseRepository {
  const ListenerNotificationsRepository(super.apiClient);

  TaskEither<Exception, ListenerNotificationsResponseModel> getNotifications({
    bool unreadOnly = false,
  }) => executeRequest(
    request: apiClient.get<Object?>(
      'v1/listeners/me/notifications',
      queryParams: {'unread_only': unreadOnly},
    ),
    fromJson: ListenerNotificationsResponseModel.fromJson,
  );

  TaskEither<Exception, void> markAllAsRead() => executeVoidRequest(
    request: apiClient.post<Object?>(
      'v1/listeners/me/notifications/read-all',
      data: const <String, dynamic>{},
    ),
  );

  TaskEither<Exception, void> deleteNotification({
    required String notificationId,
  }) => executeVoidRequest(
    request: apiClient.delete<Object?>(
      'v1/listeners/me/notifications/$notificationId',
    ),
  );
}
