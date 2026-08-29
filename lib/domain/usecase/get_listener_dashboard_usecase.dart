import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_dashboard_repository.dart';

class GetListenerDashboardUsecase {
  final ListenerDashboardRepository listenerDashboardRepository;
  final VentingPreferences ventingPreferences;

  const GetListenerDashboardUsecase(
    this.listenerDashboardRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerDashboard> call() {
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

    return listenerDashboardRepository.getDashboard().map(
      (response) => listenerDashboardFromApi(response.data),
    );
  }
}
