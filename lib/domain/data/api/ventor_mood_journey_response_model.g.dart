// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ventor_mood_journey_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VentorMoodJourneyResponseModel _$VentorMoodJourneyResponseModelFromJson(
  Map<String, dynamic> json,
) => _VentorMoodJourneyResponseModel(
  status: json['status'] as String,
  data: VentorMoodJourneyData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VentorMoodJourneyResponseModelToJson(
  _VentorMoodJourneyResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'data': instance.data};

_VentorMoodJourneyData _$VentorMoodJourneyDataFromJson(
  Map<String, dynamic> json,
) => _VentorMoodJourneyData(
  points:
      (json['points'] as List<dynamic>?)
          ?.map(
            (e) =>
                VentorMoodJourneyPointModel.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <VentorMoodJourneyPointModel>[],
);

Map<String, dynamic> _$VentorMoodJourneyDataToJson(
  _VentorMoodJourneyData instance,
) => <String, dynamic>{'points': instance.points};

_VentorMoodJourneyPointModel _$VentorMoodJourneyPointModelFromJson(
  Map<String, dynamic> json,
) => _VentorMoodJourneyPointModel(
  day_index: (json['day_index'] as num?)?.toInt() ?? 0,
  mood: json['mood'] as num? ?? 0,
);

Map<String, dynamic> _$VentorMoodJourneyPointModelToJson(
  _VentorMoodJourneyPointModel instance,
) => <String, dynamic>{'day_index': instance.day_index, 'mood': instance.mood};
