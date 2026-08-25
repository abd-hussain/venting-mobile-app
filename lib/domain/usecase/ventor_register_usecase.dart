import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/ventor/ventor_register_repository.dart';

class VentorRegisterUsecase {
  const VentorRegisterUsecase(
    this._ventorRegisterRepository,
    this._ventingPreferences,
  );

  final VentorRegisterRepository _ventorRegisterRepository;
  final VentingPreferences _ventingPreferences;

  TaskEither<Exception, VentorProfileResponseModel> call({
    required String nickname,
    required String gender,
    required List<String> languageIds,
    required List<String> interestIds,
    String? otherInterestText,
    int? avatarPresetIndex,
    String? avatarFilePath,
  }) {
    return TaskEither(() async {
      final result = await _ventorRegisterRepository
          .call(
            nickname: nickname,
            gender: gender,
            languageIds: languageIds,
            interestIds: interestIds,
            otherInterestText: otherInterestText,
            avatarPresetIndex: avatarPresetIndex,
            avatarFilePath: avatarFilePath,
          )
          .run();

      if (result.isLeft()) {
        return Left(result.getLeft().toNullable()!);
      }

      final response = result.getOrElse(
        (_) => throw StateError('Expected register success'),
      );

      try {
        await _ventingPreferences.setValue(
          SavedConstants.compleateRegistration,
          'true',
        );
        await _ventingPreferences.setValue(SavedConstants.userType, 'ventor');
        return Right(response);
      } on Object catch (error, stackTrace) {
        return Left(
          MainAPIException(
            status: 'failed',
            type: 'unknown',
            code: -1,
            message: error.toString(),
            stackTrace: stackTrace,
          ),
        );
      }
    });
  }
}
