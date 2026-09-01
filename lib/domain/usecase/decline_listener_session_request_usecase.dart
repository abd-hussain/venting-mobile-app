import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_sessions_repository.dart';

class DeclineListenerSessionRequestUsecase {
  final ListenerSessionsRepository listenerSessionsRepository;

  const DeclineListenerSessionRequestUsecase(this.listenerSessionsRepository);

  TaskEither<Exception, void> call({
    required String requestId,
    String? reason,
  }) {
    return listenerSessionsRepository.declineSessionRequest(
      requestId: requestId,
      reason: reason,
    );
  }
}
