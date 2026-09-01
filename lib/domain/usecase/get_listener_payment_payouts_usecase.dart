import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/listener_payout_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_payouts_repository.dart';

class GetListenerPaymentPayoutsUsecase {
  final ListenerPayoutsRepository listenerPayoutsRepository;

  const GetListenerPaymentPayoutsUsecase(this.listenerPayoutsRepository);

  TaskEither<Exception, ListenerPaymentPayoutsOverview> call() {
    return TaskEither.tryCatch(() async {
      final results = await Future.wait([
        listenerPayoutsRepository.getPayoutBalances().run(),
        listenerPayoutsRepository.getPayoutMethods().run(),
      ]);

      final balances = _unwrap<ListenerPayoutBalancesResponseModel>(
        results[0] as Either<Exception, ListenerPayoutBalancesResponseModel>,
      );
      final methods = _unwrap<ListenerPayoutMethodsResponseModel>(
        results[1] as Either<Exception, ListenerPayoutMethodsResponseModel>,
      );

      return listenerPaymentPayoutsOverviewFromApi(
        balances: balances.data,
        methods: methods.data,
      );
    }, _mapError);
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
