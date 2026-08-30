import 'package:fpdart/fpdart.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_registration_progress_model.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_register_repository.dart';

class SaveVentorRegistrationStepUsecase {
  const SaveVentorRegistrationStepUsecase(this._repository);

  final VentorRegisterRepository _repository;

  TaskEither<Exception, VentorRegistrationProgressModel> saveProfile({
    required String nickname,
    required String gender,
    int? avatarPresetIndex,
    String? avatarFilePath,
  }) =>
      _repository.saveProfileStep(
        nickname: nickname,
        gender: gender,
        avatarPresetIndex: avatarPresetIndex,
        avatarFilePath: avatarFilePath,
      );

  TaskEither<Exception, VentorRegistrationProgressModel> saveLanguages({
    required List<String> languageIds,
  }) =>
      _repository.saveLanguagesStep(languageIds: languageIds);

  TaskEither<Exception, VentorRegistrationProgressModel> saveInterests({
    required List<String> interestIds,
    String? otherInterestText,
  }) =>
      _repository.saveInterestsStep(
        interestIds: interestIds,
        otherInterestText: otherInterestText,
      );
}
