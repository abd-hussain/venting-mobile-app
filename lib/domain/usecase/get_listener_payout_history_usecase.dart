import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/app/listener_payouts.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_payouts_repository.dart';

class GetListenerPayoutHistoryUsecase {
  final ListenerPayoutsRepository listenerPayoutsRepository;

  const GetListenerPayoutHistoryUsecase(this.listenerPayoutsRepository);

  TaskEither<Exception, List<ListenerPayoutHistoryEntry>> call() {
    return listenerPayoutsRepository.getPayouts().map(
      (response) => listenerPayoutHistoryFromApi(response.data),
    );
  }
}
