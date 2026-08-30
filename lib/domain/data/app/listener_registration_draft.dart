import 'package:venting_mobile_app/domain/data/app/registration_notifications_data.dart';

/// Aggregated listener registration data collected across steps 1–9.
class ListenerRegistrationDraft {
  ListenerRegistrationDraft({this.email = ''});

  String email;

  // Step 1 — Create account
  String? profilePhotoPath;
  String fullName = '';
  String phoneNational = '';
  String phoneCountryIso = 'JO';
  bool agreedToTerms = false;

  // Step 2 — Identity
  String? idImagePath;
  String? selfieImagePath;

  // Step 3 — About you
  DateTime? dateOfBirth;
  String? countryIso;
  String city = '';
  List<String> languageIds = const [];

  // Step 4 — Life experience
  String? relationshipId;
  List<String> familyIds = const [];
  List<String> experienceIds = const [];
  List<String> customExperiences = const [];

  // Step 5 — Comfort areas
  List<String> comfortAreaIds = const [];
  String? comfortAreaOtherText;

  // Step 6 — Boundaries
  List<String> boundaryIds = const [];
  String? boundaryOtherText;

  // Step 7 — Voice intro
  String? voiceIntroPath;
  int voiceIntroSeconds = 0;

  // Step 8 — Availability
  String timeZoneId = 'America/Chicago';
  List<String> availabilityDays = const ['mon', 'tue', 'wed', 'thu', 'fri'];
  String availabilityFrom = '09:00 AM';
  String availabilityTo = '11:00 PM';
  bool acceptInstantCalls = true;
  List<int> sessionMinutes = const [30, 60];

  // Step 9 — Notifications (FCM token only; optional if permission denied)
  String? fcmToken;

  List<String> get lifeExperienceIds {
    return [
      if (relationshipId != null) relationshipId!,
      ...familyIds,
      ...experienceIds,
    ];
  }

  bool get isCompleteForSubmit =>
      profilePhotoPath != null &&
      fullName.trim().isNotEmpty &&
      phoneNational.trim().isNotEmpty &&
      idImagePath != null &&
      selfieImagePath != null &&
      dateOfBirth != null &&
      countryIso != null &&
      city.trim().isNotEmpty &&
      languageIds.isNotEmpty &&
      lifeExperienceIds.isNotEmpty &&
      comfortAreaIds.isNotEmpty &&
      boundaryIds.isNotEmpty &&
      voiceIntroPath != null &&
      voiceIntroSeconds > 0 &&
      timeZoneId.trim().isNotEmpty &&
      availabilityDays.isNotEmpty &&
      sessionMinutes.isNotEmpty &&
      _isAvailabilityWindowValid;

  bool get _isAvailabilityWindowValid {
    final fromIndex = _hourIndex(availabilityFrom);
    final toIndex = _hourIndex(availabilityTo);
    if (fromIndex < 0 || toIndex < 0) return false;
    return fromIndex < toIndex;
  }

  static int _hourIndex(String label) {
    const hours = [
      '12:00 AM',
      '01:00 AM',
      '02:00 AM',
      '03:00 AM',
      '04:00 AM',
      '05:00 AM',
      '06:00 AM',
      '07:00 AM',
      '08:00 AM',
      '09:00 AM',
      '10:00 AM',
      '11:00 AM',
      '12:00 PM',
      '01:00 PM',
      '02:00 PM',
      '03:00 PM',
      '04:00 PM',
      '05:00 PM',
      '06:00 PM',
      '07:00 PM',
      '08:00 PM',
      '09:00 PM',
      '10:00 PM',
      '11:00 PM',
    ];
    return hours.indexOf(label);
  }
}

/// Step 1 payload passed back to the parent wizard.
class ListenerRegistrationStep1Data {
  const ListenerRegistrationStep1Data({
    required this.profilePhotoPath,
    required this.fullName,
    required this.phoneNational,
    required this.phoneCountryIso,
    required this.agreedToTerms,
  });

  final String profilePhotoPath;
  final String fullName;
  final String phoneNational;
  final String phoneCountryIso;
  final bool agreedToTerms;
}

class ListenerRegistrationStep2Data {
  const ListenerRegistrationStep2Data({
    required this.idImagePath,
    required this.selfieImagePath,
  });

  final String idImagePath;
  final String selfieImagePath;
}

class ListenerRegistrationStep3Data {
  const ListenerRegistrationStep3Data({
    required this.dateOfBirth,
    required this.countryIso,
    required this.city,
    required this.languageIds,
  });

  final DateTime dateOfBirth;
  final String countryIso;
  final String city;
  final List<String> languageIds;
}

class ListenerRegistrationStep4Data {
  const ListenerRegistrationStep4Data({
    required this.relationshipId,
    required this.familyIds,
    required this.experienceIds,
    required this.customExperiences,
  });

  final String? relationshipId;
  final List<String> familyIds;
  final List<String> experienceIds;
  final List<String> customExperiences;
}

class ListenerRegistrationStep5Data {
  const ListenerRegistrationStep5Data({
    required this.comfortAreaIds,
    this.comfortAreaOtherText,
  });

  final List<String> comfortAreaIds;
  final String? comfortAreaOtherText;
}

class ListenerRegistrationStep6Data {
  const ListenerRegistrationStep6Data({
    required this.boundaryIds,
    this.boundaryOtherText,
  });

  final List<String> boundaryIds;
  final String? boundaryOtherText;
}

class ListenerRegistrationStep7Data {
  const ListenerRegistrationStep7Data({
    required this.voiceIntroPath,
    required this.voiceIntroSeconds,
  });

  final String voiceIntroPath;
  final int voiceIntroSeconds;
}

class ListenerRegistrationStep8Data {
  const ListenerRegistrationStep8Data({
    required this.timeZoneId,
    required this.availabilityDays,
    required this.availabilityFrom,
    required this.availabilityTo,
    required this.acceptInstantCalls,
    required this.sessionMinutes,
  });

  final String timeZoneId;
  final List<String> availabilityDays;
  final String availabilityFrom;
  final String availabilityTo;
  final bool acceptInstantCalls;
  final List<int> sessionMinutes;
}

extension ListenerRegistrationDraftMerge on ListenerRegistrationDraft {
  void applyStep1(ListenerRegistrationStep1Data data) {
    profilePhotoPath = data.profilePhotoPath;
    fullName = data.fullName;
    phoneNational = data.phoneNational;
    phoneCountryIso = data.phoneCountryIso;
    agreedToTerms = data.agreedToTerms;
  }

  void applyStep2(ListenerRegistrationStep2Data data) {
    idImagePath = data.idImagePath;
    selfieImagePath = data.selfieImagePath;
  }

  void applyStep3(ListenerRegistrationStep3Data data) {
    dateOfBirth = data.dateOfBirth;
    countryIso = data.countryIso;
    city = data.city;
    languageIds = List<String>.from(data.languageIds);
  }

  void applyStep4(ListenerRegistrationStep4Data data) {
    relationshipId = data.relationshipId;
    familyIds = List<String>.from(data.familyIds);
    experienceIds = List<String>.from(data.experienceIds);
    customExperiences = List<String>.from(data.customExperiences);
  }

  void applyStep5(ListenerRegistrationStep5Data data) {
    comfortAreaIds = List<String>.from(data.comfortAreaIds);
    comfortAreaOtherText = data.comfortAreaOtherText;
  }

  void applyStep6(ListenerRegistrationStep6Data data) {
    boundaryIds = List<String>.from(data.boundaryIds);
    boundaryOtherText = data.boundaryOtherText;
  }

  void applyStep7(ListenerRegistrationStep7Data data) {
    voiceIntroPath = data.voiceIntroPath;
    voiceIntroSeconds = data.voiceIntroSeconds;
  }

  void applyStep8(ListenerRegistrationStep8Data data) {
    timeZoneId = data.timeZoneId;
    availabilityDays = List<String>.from(data.availabilityDays);
    availabilityFrom = data.availabilityFrom;
    availabilityTo = data.availabilityTo;
    acceptInstantCalls = data.acceptInstantCalls;
    sessionMinutes = List<int>.from(data.sessionMinutes);
  }

  void applyStep9(RegistrationNotificationsData data) {
    fcmToken = data.fcmToken;
  }
}

/// Converts 12-hour labels such as `09:00 AM` to 24-hour `09:00`.
String listenerRegistrationTimeTo24Hour(String label) {
  final parts = label.trim().split(RegExp(r'\s+'));
  if (parts.length != 2) return label;

  final timeParts = parts[0].split(':');
  if (timeParts.length != 2) return label;

  var hour = int.tryParse(timeParts[0]) ?? 0;
  final minute = timeParts[1].padLeft(2, '0');
  final meridiem = parts[1].toUpperCase();

  if (meridiem == 'PM' && hour != 12) hour += 12;
  if (meridiem == 'AM' && hour == 12) hour = 0;

  return '${hour.toString().padLeft(2, '0')}:$minute';
}
