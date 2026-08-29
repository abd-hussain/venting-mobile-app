import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_earnings.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_earnings_repository.dart';

class GetListenerEarningsOverviewUsecase {
  final ListenerEarningsRepository listenerEarningsRepository;

  const GetListenerEarningsOverviewUsecase(this.listenerEarningsRepository);

  TaskEither<Exception, ListenerEarningsOverview> call() {
    final chartRange = _defaultChartRange();

    return TaskEither.tryCatch(
      () async {
        final results = await Future.wait([
          listenerEarningsRepository.getEarnings().run(),
          listenerEarningsRepository
              .getEarningsChart(from: chartRange.from, to: chartRange.to)
              .run(),
          listenerEarningsRepository.getPayoutMethods().run(),
        ]);

        final earnings = _unwrap<ListenerEarningsResponseModel>(
          results[0] as Either<Exception, ListenerEarningsResponseModel>,
        );
        final chart = _unwrap<ListenerEarningsChartResponseModel>(
          results[1] as Either<Exception, ListenerEarningsChartResponseModel>,
        );
        final payoutMethods = _unwrap<ListenerPayoutMethodsResponseModel>(
          results[2] as Either<Exception, ListenerPayoutMethodsResponseModel>,
        );

        return listenerEarningsOverviewFromApi(
          earnings: earnings.data,
          chart: chart.data,
          payoutMethods: payoutMethods.data,
        );
      },
      _mapError,
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

({String from, String to}) _defaultChartRange() {
  final now = DateTime.now().toUtc();
  final from = now.subtract(const Duration(days: 30));
  return (from: _formatDate(from), to: _formatDate(now));
}

String _formatDate(DateTime value) {
  final year = value.year.toString().padLeft(4, '0');
  final month = value.month.toString().padLeft(2, '0');
  final day = value.day.toString().padLeft(2, '0');
  return '$year-$month-$day';
}
