import 'package:fpdart/fpdart.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:preferences/preferences.dart';
import 'package:venting_mobile_app/domain/data/app/listener_phone.dart';
import 'package:venting_mobile_app/domain/data/exceptions/main_api_exception.dart';
import 'package:venting_mobile_app/domain/repository/api/listener/listener_profile_repository.dart';

class UpdateListenerPhoneUsecase {
  final ListenerProfileRepository listenerProfileRepository;
  final VentingPreferences ventingPreferences;

  const UpdateListenerPhoneUsecase(
    this.listenerProfileRepository,
    this.ventingPreferences,
  );

  TaskEither<Exception, ListenerPhone> call({
    required IsoCode country,
    required String nationalNumber,
  }) {
    final accessToken = ventingPreferences
        .getValue(SavedConstants.accessToken, '')
        .trim();

    if (accessToken.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'auth',
          code: 401,
          message: 'Missing access token',
        ),
      );
    }

    final national = nationalNumber.replaceAll(RegExp(r'\D'), '');
    if (national.isEmpty) {
      return TaskEither.left(
        const MainAPIException(
          status: 'failed',
          type: 'validation',
          code: 422,
          message: 'Phone number is required',
        ),
      );
    }

    final phone = formatPhoneE164(country, national);

    return listenerProfileRepository
        .updatePhone(phone: phone, phoneCountry: country.name)
        .map(
          (response) => ListenerPhone.fromApi(
            phone: response.data.phone,
            phoneCountry: response.data.phone_country,
          ),
        );
  }
}
