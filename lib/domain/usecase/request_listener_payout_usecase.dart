import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_payout_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_payouts_repository.dart';

class RequestListenerPayoutUsecase {
  final ListenerPayoutsRepository listenerPayoutsRepository;

  const RequestListenerPayoutUsecase(this.listenerPayoutsRepository);

  TaskEither<Exception, ListenerPaymentPayoutsOverview> call({
    required double amount,
    required String payoutMethodId,
  }) {
    if (amount <= 0) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Payout amount must be greater than zero',
        ),
      );
    }

    if (payoutMethodId.trim().isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Payout method is required',
        ),
      );
    }

    return listenerPayoutsRepository
        .requestPayout(
          body: {'amount': amount, 'payout_method_id': payoutMethodId.trim()},
        )
        .flatMap(
          (_) => TaskEither.tryCatch(() async {
            final results = await Future.wait([
              listenerPayoutsRepository.getPayoutBalances().run(),
              listenerPayoutsRepository.getPayoutMethods().run(),
            ]);

            final balances = _unwrap<ListenerPayoutBalancesResponseModel>(
              results[0]
                  as Either<Exception, ListenerPayoutBalancesResponseModel>,
            );
            final methods = _unwrap<ListenerPayoutMethodsResponseModel>(
              results[1]
                  as Either<Exception, ListenerPayoutMethodsResponseModel>,
            );

            return listenerPaymentPayoutsOverviewFromApi(
              balances: balances.data,
              methods: methods.data,
            );
          }, _mapError),
        );
  }
}

T _unwrap<T>(Either<Exception, T> either) {
  return either.match((error) => throw error, (value) => value);
}

MainAPIException _mapError(Object error, StackTrace stackTrace) {
  if (error is MainAPIException) return error;
  return MainAPIException(
    status: 'failed',
    type: 'unknown',
    code: -1,
    message: error.toString(),
    stackTrace: stackTrace,
  );
}
