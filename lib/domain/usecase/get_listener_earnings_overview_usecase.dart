import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_earnings.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_earnings_repository.dart';

class GetListenerEarningsOverviewUsecase {
  final ListenerEarningsRepository listenerEarningsRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerEarningsOverviewUsecase(
    this.listenerEarningsRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerEarningsOverview> call() {
    final accessToken = ventingPreferences
        .getValue(SavedConstants.accessToken, '')
        .trim();

    if (accessToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Missing access token',
        ),
      );
    }

    final chartRange = _defaultChartRange();

    return listenerEarningsRepository.getEarnings().flatMap((earnings) {
      return listenerEarningsRepository
          .getEarningsChart(from: chartRange.from, to: chartRange.to)
          .flatMap((chart) {
            return listenerEarningsRepository.getPayoutMethods().map((
              payoutMethods,
            ) {
              return listenerEarningsOverviewFromApi(
                earnings: earnings.data,
                chart: chart.data,
                payoutMethods: payoutMethods.data,
              );
            });
          });
    });
  }
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
