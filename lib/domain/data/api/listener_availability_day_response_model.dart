import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/domain/data/api/listener_availability_response_model.dart';

part 'listener_availability_day_response_model.freezed.dart';
part 'listener_availability_day_response_model.g.dart';

@freezed
abstract class ListenerAvailabilityDayResponseModel
    with _$ListenerAvailabilityDayResponseModel {
  const factory ListenerAvailabilityDayResponseModel({
    required String status,
    required ListenerAvailabilityDayData data,
  }) = _ListenerAvailabilityDayResponseModel;

  factory ListenerAvailabilityDayResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerAvailabilityDayResponseModelFromJson(json);
}
