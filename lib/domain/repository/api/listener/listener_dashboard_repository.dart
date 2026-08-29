import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_dashboard_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerDashboardRepository extends BaseRepository {
  const ListenerDashboardRepository(super.apiClient);

  TaskEither<Exception, ListenerDashboardResponseModel> getDashboard() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/dashboard'),
        fromJson: ListenerDashboardResponseModel.fromJson,
      );
}
