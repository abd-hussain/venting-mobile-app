import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_register_repository.dart';

class GetVentorRegistrationProgressUsecase {
  const GetVentorRegistrationProgressUsecase(this._repository);

  final VentorRegisterRepository _repository;

  TaskEither<Exception, VentorRegistrationProgressModel> call() =>
      _repository.getProgress();
}
