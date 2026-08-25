import 'package:fpdart/fpdart.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/api/listener_register_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/listener_registration_draft.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_register_repository.dart';

class ListenerRegisterUsecase {
  const ListenerRegisterUsecase(
    this._listenerRegisterRepository,
    this._ventingPreferences,
  );

  final ListenerRegisterRepository _listenerRegisterRepository;
  final VentingPreferences _ventingPreferences;

  TaskEither<Exception, ListenerRegisterResponseModel> call({
    required ListenerRegistrationDraft draft,
  }) {
    return TaskEither(() async {
      if (!draft.isCompleteForSubmit) {
        return const Left(
          MainAPIException(
            status: 'failed',
            type: 'validation',
            code: -2,
            message: 'Registration draft is incomplete.',
          ),
        );
      }

      final result = await _listenerRegisterRepository.call(draft: draft).run();

      if (result.isLeft()) {
        return Left(result.getLeft().toNullable()!);
      }

      final response = result.getOrElse(
        (_) => throw StateError('Expected listener register success'),
      );

      try {
        await _ventingPreferences.setValue(
          SavedConstants.compleateRegistration,
          'true',
        );
        await _ventingPreferences.setValue(SavedConstants.userType, 'lissener');
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
