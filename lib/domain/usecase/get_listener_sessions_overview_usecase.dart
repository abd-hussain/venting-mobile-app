import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_sessions_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_sessions.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_sessions_repository.dart';

class GetListenerSessionsOverviewUsecase {
  final ListenerSessionsRepository listenerSessionsRepository;

  const GetListenerSessionsOverviewUsecase(this.listenerSessionsRepository);

  TaskEither<Exception, ListenerSessionsOverview> call() {
    return TaskEither.tryCatch(() async {
      final results = await Future.wait([
        listenerSessionsRepository.getSessionStats().run(),
        listenerSessionsRepository.getSessionRequests().run(),
        listenerSessionsRepository.getSessions(filter: 'upcoming').run(),
        listenerSessionsRepository.getSessions(filter: 'missed').run(),
        listenerSessionsRepository.getSessions(filter: 'history').run(),
      ]);

      final stats = _unwrap<ListenerSessionStatsResponseModel>(
        results[0] as Either<Exception, ListenerSessionStatsResponseModel>,
      );
      final requests = _unwrap<ListenerSessionRequestsResponseModel>(
        results[1] as Either<Exception, ListenerSessionRequestsResponseModel>,
      );
      final upcoming = _unwrap<ListenerSessionsListResponseModel>(
        results[2] as Either<Exception, ListenerSessionsListResponseModel>,
      );
      final missed = _unwrap<ListenerSessionsListResponseModel>(
        results[3] as Either<Exception, ListenerSessionsListResponseModel>,
      );
      final history = _unwrap<ListenerSessionsListResponseModel>(
        results[4] as Either<Exception, ListenerSessionsListResponseModel>,
      );

      return listenerSessionsOverviewFromApi(
        stats: stats.data,
        requests: requests.data,
        upcoming: upcoming.data,
        missed: missed.data,
        history: history.data,
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
