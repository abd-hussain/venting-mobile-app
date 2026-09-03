// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listener_availability_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ListenerAvailabilityResponseModel _$ListenerAvailabilityResponseModelFromJson(
  Map<String, dynamic> json,
) => _ListenerAvailabilityResponseModel(
  status: json['status'] as String,
  data: ListenerAvailabilityData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ListenerAvailabilityResponseModelToJson(
  _ListenerAvailabilityResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_ListenerAvailabilityData _$ListenerAvailabilityDataFromJson(
  Map<String, dynamic> json,
) => _ListenerAvailabilityData(
  break_length_minutes: (json['break_length_minutes'] as num?)?.toInt() ?? 30,
  time_zone_id: json['time_zone_id'] as String? ?? '',
  language_ids:
      (json['language_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const <String>[],
  days:
      (json['days'] as List<dynamic>?)
          ?.map(
            (e) =>
                ListenerAvailabilityDayData.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <ListenerAvailabilityDayData>[],
  session_minutes: json['session_minutes'],
  session_length_minutes: (json['session_length_minutes'] as num?)?.toInt(),
);

Map<String, dynamic> _$ListenerAvailabilityDataToJson(
  _ListenerAvailabilityData instance,
) => <String, dynamic>{
  'break_length_minutes': instance.break_length_minutes,
  'time_zone_id': instance.time_zone_id,
  'language_ids': instance.language_ids,
  'days': instance.days,
  'session_minutes': instance.session_minutes,
  'session_length_minutes': instance.session_length_minutes,
};

_ListenerAvailabilityDayData _$ListenerAvailabilityDayDataFromJson(
  Map<String, dynamic> json,
) => _ListenerAvailabilityDayData(
  day: json['day'] as String? ?? '',
  slots:
      (json['slots'] as List<dynamic>?)
          ?.map(
            (e) => ListenerAvailabilitySlotData.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <ListenerAvailabilitySlotData>[],
);

Map<String, dynamic> _$ListenerAvailabilityDayDataToJson(
  _ListenerAvailabilityDayData instance,
) => <String, dynamic>{'day': instance.day, 'slots': instance.slots};

_ListenerAvailabilitySlotData _$ListenerAvailabilitySlotDataFromJson(
  Map<String, dynamic> json,
) => _ListenerAvailabilitySlotData(
  start: json['start'] as String? ?? '',
  end: json['end'] as String? ?? '',
);

Map<String, dynamic> _$ListenerAvailabilitySlotDataToJson(
  _ListenerAvailabilitySlotData instance,
) => <String, dynamic>{'start': instance.start, 'end': instance.end};
