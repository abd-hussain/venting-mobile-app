import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_payout_response_model.dart';
import 'package:venting_mobile_app/domain/repository/api/base_repository.dart';

class ListenerPayoutsRepository extends BaseRepository {
  const ListenerPayoutsRepository(super.apiClient);

  TaskEither<Exception, ListenerPayoutBalancesResponseModel>
  getPayoutBalances() => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/me/payout-balances'),
    fromJson: ListenerPayoutBalancesResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerPayoutMethodsResponseModel>
  getPayoutMethods() => executeRequest(
    request: apiClient.get<Object?>('v1/listeners/me/payout-methods'),
    fromJson: ListenerPayoutMethodsResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerPayoutMethodUpdateResponseModel>
  updatePayoutMethod({required Map<String, dynamic> body}) => executeRequest(
    request: apiClient.put<Object?>(
      'v1/listeners/me/payout-methods',
      data: body,
    ),
    fromJson: ListenerPayoutMethodUpdateResponseModel.fromJson,
  );

  TaskEither<Exception, ListenerPayoutsListResponseModel> getPayouts() =>
      executeRequest(
        request: apiClient.get<Object?>('v1/listeners/me/payouts'),
        fromJson: ListenerPayoutsListResponseModel.fromJson,
      );

  TaskEither<Exception, ListenerPayoutMutationResponseModel> requestPayout({
    required Map<String, dynamic> body,
  }) => executeRequest(
    request: apiClient.post<Object?>('v1/listeners/me/payouts', data: body),
    fromJson: ListenerPayoutMutationResponseModel.fromJson,
  );
}
