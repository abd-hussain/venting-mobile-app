import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/app/listener_sessions.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_sessions_repository.dart';

class AcceptListenerSessionRequestUsecase {
  final ListenerSessionsRepository listenerSessionsRepository;

  const AcceptListenerSessionRequestUsecase(this.listenerSessionsRepository);

  TaskEither<Exception, AcceptListenerSessionRequestResult> call({
    required String requestId,
  }) {
    return listenerSessionsRepository
        .acceptSessionRequest(requestId: requestId)
        .map((response) => acceptListenerSessionRequestFromApi(response.data));
  }
}
