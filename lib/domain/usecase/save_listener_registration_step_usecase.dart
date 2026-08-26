import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/listener_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_register_repository.dart';

class SaveListenerRegistrationStepUsecase {
  const SaveListenerRegistrationStepUsecase(this._repository);

  final ListenerRegisterRepository _repository;

  TaskEither<Exception, ListenerRegistrationProgressModel> saveProfile(
    ListenerRegistrationStep1Data data,
  ) => _repository.saveProfileStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveIdentity(
    ListenerRegistrationStep2Data data,
  ) => _repository.saveIdentityStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveAbout(
    ListenerRegistrationStep3Data data,
  ) => _repository.saveAboutStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveExperiences(
    ListenerRegistrationStep4Data data,
  ) => _repository.saveExperiencesStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveComfortAreas(
    ListenerRegistrationStep5Data data,
  ) => _repository.saveComfortAreasStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveBoundaries(
    ListenerRegistrationStep6Data data,
  ) => _repository.saveBoundariesStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveVoiceIntro(
    ListenerRegistrationStep7Data data,
  ) => _repository.saveVoiceIntroStep(data: data);

  TaskEither<Exception, ListenerRegistrationProgressModel> saveAvailability(
    ListenerRegistrationStep8Data data,
  ) => _repository.saveAvailabilityStep(data: data);
}
