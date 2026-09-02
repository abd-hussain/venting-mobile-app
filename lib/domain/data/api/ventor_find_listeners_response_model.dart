import 'package:freezed_annotation/freezed_annotation.dart';

part 'ventor_find_listeners_response_model.freezed.dart';
part 'ventor_find_listeners_response_model.g.dart';

@freezed
abstract class VentorFindListenersResponseModel
    with _$VentorFindListenersResponseModel {
  const factory VentorFindListenersResponseModel({
    required String status,
    required VentorFindListenersData data,
  }) = _VentorFindListenersResponseModel;

  factory VentorFindListenersResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorFindListenersResponseModelFromJson(json);
}

@freezed
abstract class VentorFindListenersData with _$VentorFindListenersData {
  const factory VentorFindListenersData({
    @Default(<VentorFindListenerModel>[]) List<VentorFindListenerModel> items,
    @Default(0) int total,
  }) = _VentorFindListenersData;

  factory VentorFindListenersData.fromJson(Map<String, dynamic> json) =>
      _$VentorFindListenersDataFromJson(json);
}

@freezed
abstract class VentorFindListenerResponseModel
    with _$VentorFindListenerResponseModel {
  const factory VentorFindListenerResponseModel({
    required String status,
    required VentorFindListenerModel data,
  }) = _VentorFindListenerResponseModel;

  factory VentorFindListenerResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorFindListenerResponseModelFromJson(json);
}

@freezed
abstract class VentorFindListenerModel with _$VentorFindListenerModel {
  const factory VentorFindListenerModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String avatar_url,
    @Default(0) double rating,
    @Default(0) int review_count,
    @Default(0) int session_count,
    @Default(<String>[]) List<String> topics,
    @Default(<String>[]) List<String> languages,
    @Default('') String gender,
    @Default(0) double rate_per_minute,
    @Default('') String bio,
    @Default(<String>[]) List<String> help_with,
    @Default(0) int voice_preview_seconds,
    @Default(false) bool is_online,
    @Default(false) bool is_verified,
    Map<String, dynamic>? rating_breakdown,
    @Default('') String country,
    @Default('') String city,
    @Default('') String country_iso,
    Object? life_experiences,
    Object? boundaries,
    VentorFindListenerAvailabilityModel? availability,
    @Default(false) bool is_favorite,
  }) = _VentorFindListenerModel;

  factory VentorFindListenerModel.fromJson(Map<String, dynamic> json) =>
      _$VentorFindListenerModelFromJson(_normalizeFindListenerJson(json));
}

@freezed
abstract class VentorFindListenerAvailabilityModel
    with _$VentorFindListenerAvailabilityModel {
  const factory VentorFindListenerAvailabilityModel({
    @Default(<String>[]) List<String> days,
    @Default('') String from_hour,
    @Default('') String to_hour,
    @Default('') String time_zone_id,
    @Default(false) bool accept_instant_call,
    @Default(<int>[]) List<int> session_minutes,
  }) = _VentorFindListenerAvailabilityModel;

  factory VentorFindListenerAvailabilityModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorFindListenerAvailabilityModelFromJson(
    _normalizeFindListenerAvailabilityJson(json),
  );
}

Map<String, dynamic> _normalizeFindListenerJson(Map<String, dynamic> json) {
  final availabilityRaw = json['availability'];
  return <String, dynamic>{
    ...json,
    'id': _asString(json['id']),
    'name': _asString(json['name'] ?? json['full_name']),
    'avatar_url': _asString(json['avatar_url']),
    'topics': _asStringList(json['topics']),
    'languages': _asStringList(json['languages'] ?? json['language_ids']),
    'gender': _asString(json['gender']),
    'bio': _asString(json['bio'] ?? json['about_me']),
    'help_with': _asStringList(json['help_with'] ?? json['comfort_areas']),
    'country': _asString(json['country']),
    'city': _asString(json['city']),
    'country_iso': _asString(json['country_iso']),
    if (availabilityRaw is Map<String, dynamic>)
      'availability': _normalizeFindListenerAvailabilityJson(availabilityRaw),
  };
}

Map<String, dynamic> _normalizeFindListenerAvailabilityJson(
  Map<String, dynamic> json,
) {
  final days = _availabilityDayIds(json['days']);
  final fromHour = _asString(
    json['from_hour'] ?? json['fromHour'] ?? json['from'],
  );
  final toHour = _asString(json['to_hour'] ?? json['toHour'] ?? json['to']);
  final derivedWindow = _availabilityWindowFromDays(json['days']);

  return <String, dynamic>{
    ...json,
    'days': days,
    'from_hour': fromHour.isNotEmpty ? fromHour : (derivedWindow.$1 ?? ''),
    'to_hour': toHour.isNotEmpty ? toHour : (derivedWindow.$2 ?? ''),
    'time_zone_id': _asString(
      json['time_zone_id'] ?? json['timeZoneId'] ?? json['timezone'],
    ),
    'accept_instant_call':
        json['accept_instant_call'] ?? json['accept_instant_calls'] ?? false,
    'session_minutes': _asIntList(
      json['session_minutes'] ?? json['sessionMinutes'],
    ),
  };
}

List<String> _asStringList(Object? raw) {
  if (raw is! List) return const <String>[];
  final out = <String>[];
  for (final entry in raw) {
    final value = _labelFromDynamic(entry);
    if (value.isNotEmpty) out.add(value);
  }
  return out;
}

List<int> _asIntList(Object? raw) {
  if (raw is! List) return const <int>[];
  final out = <int>[];
  for (final entry in raw) {
    if (entry is num) {
      out.add(entry.toInt());
      continue;
    }
    final parsed = int.tryParse(entry?.toString() ?? '');
    if (parsed != null) out.add(parsed);
  }
  return out;
}

List<String> _availabilityDayIds(Object? raw) {
  if (raw is! List) return const <String>[];
  final out = <String>[];
  for (final entry in raw) {
    if (entry is String) {
      final trimmed = entry.trim();
      if (trimmed.isNotEmpty) out.add(trimmed);
      continue;
    }
    if (entry is Map) {
      final day =
          entry['day']?.toString().trim() ??
          entry['id']?.toString().trim() ??
          '';
      if (day.isNotEmpty) out.add(day);
    }
  }
  return out;
}

(String?, String?) _availabilityWindowFromDays(Object? raw) {
  if (raw is! List) return (null, null);
  String? earliest;
  String? latest;
  int? earliestMinutes;
  int? latestMinutes;

  for (final entry in raw) {
    if (entry is! Map) continue;
    final slots = entry['slots'];
    if (slots is! List) continue;
    for (final slot in slots) {
      if (slot is! Map) continue;
      final start = slot['start']?.toString().trim() ?? '';
      final end = slot['end']?.toString().trim() ?? '';
      final startMinutes = _clockToMinutes(start);
      final endMinutes = _clockToMinutes(end);
      if (start.isNotEmpty &&
          startMinutes != null &&
          (earliestMinutes == null || startMinutes < earliestMinutes)) {
        earliestMinutes = startMinutes;
        earliest = start;
      }
      if (end.isNotEmpty &&
          endMinutes != null &&
          (latestMinutes == null || endMinutes > latestMinutes)) {
        latestMinutes = endMinutes;
        latest = end;
      }
    }
  }
  return (earliest, latest);
}

int? _clockToMinutes(String value) {
  final trimmed = value.trim();
  if (trimmed.isEmpty) return null;

  final twelveHour = RegExp(
    r'^(\d{1,2}):(\d{2})\s*([AaPp][Mm])$',
  ).firstMatch(trimmed);
  if (twelveHour != null) {
    var hour = int.tryParse(twelveHour.group(1)!) ?? 0;
    final minute = int.tryParse(twelveHour.group(2)!) ?? 0;
    final meridiem = twelveHour.group(3)!.toUpperCase();
    hour = hour % 12;
    if (meridiem == 'PM') hour += 12;
    return hour * 60 + minute;
  }

  final twentyFour = RegExp(r'^(\d{1,2}):(\d{2})$').firstMatch(trimmed);
  if (twentyFour != null) {
    final hour = int.tryParse(twentyFour.group(1)!) ?? 0;
    final minute = int.tryParse(twentyFour.group(2)!) ?? 0;
    return hour * 60 + minute;
  }
  return null;
}

String _asString(Object? raw) {
  if (raw == null) return '';
  if (raw is String) return raw.trim();
  if (raw is num || raw is bool) return raw.toString();
  if (raw is Map) return _labelFromDynamic(raw);
  return raw.toString().trim();
}

String _labelFromDynamic(Object? raw) {
  if (raw == null) return '';
  if (raw is String) return raw.trim();
  if (raw is num || raw is bool) return raw.toString();
  if (raw is Map) {
    final map = raw;
    final candidates = <Object?>[
      map['name_en'],
      map['name'],
      map['label'],
      map['title'],
      map['id'],
      map['name_native'],
      map['name_ar'],
    ];
    for (final candidate in candidates) {
      final text = candidate?.toString().trim() ?? '';
      if (text.isNotEmpty) return text;
    }
  }
  return raw.toString().trim();
}
