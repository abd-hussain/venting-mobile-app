import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerEarningsRepository extends BaseRepository {
  const ListenerEarningsRepository(super.apiClient);

  TaskEither<Exception, ListenerEarningsResponseModel> getEarnings() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/earnings'),
        fromJson: ListenerEarningsResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerEarningsChartResponseModel> getEarningsChart({
    String? from,
    String? to,
  }) => executeRequest(
    request: apiClient.get<Object?>(
      'v1/listeners/me/earnings/chart',
      queryParams: {
        if (from != null && from.isNotEmpty) 'from': from,
        if (to != null && to.isNotEmpty) 'to': to,
      },
    ),
    fromJson: ListenerEarningsChartResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerPayoutMethodsResponseModel>
  getPayoutMethods() => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/me/payout-methods'),
    fromJson: ListenerPayoutMethodsResponseModel.fromJson,
  );
}
