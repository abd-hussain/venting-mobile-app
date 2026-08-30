import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_register_repository.dart';

class GetListenerRegistrationProgressUsecase {
  const GetListenerRegistrationProgressUsecase(this._repository);

  final ListenerRegisterRepository _repository;

  TaskEither<Exception, ListenerRegistrationProgressModel> call() =>
      _repository.getProgress();
}
