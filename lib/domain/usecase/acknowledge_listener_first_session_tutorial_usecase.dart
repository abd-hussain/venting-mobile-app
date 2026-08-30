import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_dashboard_setup.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_setup_repository.dart';

class AcknowledgeListenerFirstSessionTutorialUsecase {
  final ListenerSetupRepository listenerSetupRepository;
  final VentingPreferences ventingPreferences;

  const AcknowledgeListenerFirstSessionTutorialUsecase(
    this.listenerSetupRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerDashboardSetupProgress> call() {
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

    return listenerSetupRepository.acknowledgeFirstSessionTutorial().map(
      (response) => listenerDashboardSetupFromApi(response.data),
    );
  }
}
