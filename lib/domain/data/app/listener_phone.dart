import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class ListenerPhone {
  const ListenerPhone({
    required this.countryIso,
    required this.nationalNumber,
    required this.e164,
  });

  final String countryIso;
  final String nationalNumber;
  final String e164;

  IsoCode get country {
    try {
      return IsoCode.values.byName(countryIso);
    } catch (_) {
      return IsoCode.US;
    }
  }

  String get displayLabel {
    try {
      final parsed = PhoneNumber.parse(e164);
      return '+${parsed.countryCode} ${parsed.nsn}';
    } catch (_) {
      return e164;
    }
  }

  factory ListenerPhone.fromApi({
    required String phone,
    required String phoneCountry,
  }) {
    final iso = _parseCountryIso(phoneCountry);
    try {
      final parsed = PhoneNumber.parse(phone);
      return ListenerPhone(
        countryIso: parsed.isoCode.name,
        nationalNumber: parsed.nsn,
        e164: phone.replaceAll(' ', ''),
      );
    } catch (_) {
      return ListenerPhone(
        countryIso: iso.name,
        nationalNumber: phone.replaceAll(RegExp(r'\D'), ''),
        e164: phone,
      );
    }
  }

  factory ListenerPhone.fromInput({
    required IsoCode country,
    required String nationalNumber,
  }) {
    final national = nationalNumber.replaceAll(RegExp(r'\D'), '');
    return ListenerPhone(
      countryIso: country.name,
      nationalNumber: national,
      e164: formatPhoneE164(country, national),
    );
  }

  static IsoCode _parseCountryIso(String phoneCountry) {
    try {
      return IsoCode.values.byName(phoneCountry.trim().toUpperCase());
    } catch (_) {
      return IsoCode.US;
    }
  }
}

String formatPhoneE164(IsoCode country, String nationalNumber) {
  final national = nationalNumber.replaceAll(RegExp(r'\D'), '');
  try {
    final phone = PhoneNumber.parse(
      national,
      callerCountry: country,
      destinationCountry: country,
    );
    return phone.international.replaceAll(' ', '');
  } catch (_) {
    final dial = PhoneNumber(isoCode: country, nsn: national).countryCode;
    return '$dial$national';
  }
}
