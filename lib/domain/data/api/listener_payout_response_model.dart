import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';

part 'listener_payout_response_model.freezed.dart';
part 'listener_payout_response_model.g.dart';

@freezed
abstract class ListenerPayoutBalancesResponseModel
    with _$ListenerPayoutBalancesResponseModel {
  const factory ListenerPayoutBalancesResponseModel({
    required String status,
    required ListenerPayoutBalancesData data,
  }) = _ListenerPayoutBalancesResponseModel;

  factory ListenerPayoutBalancesResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerPayoutBalancesResponseModelFromJson(json);
}

@freezed
abstract class ListenerPayoutBalancesData with _$ListenerPayoutBalancesData {
  const factory ListenerPayoutBalancesData({
    @Default(0) num available,
    @Default(0) num pending,
    @Default(0) num lifetime,
  }) = _ListenerPayoutBalancesData;

  factory ListenerPayoutBalancesData.fromJson(Map<String, dynamic> json) =>
      _$ListenerPayoutBalancesDataFromJson(json);
}

@freezed
abstract class ListenerPayoutsListResponseModel
    with _$ListenerPayoutsListResponseModel {
  const factory ListenerPayoutsListResponseModel({
    required String status,
    required ListenerPayoutsListData data,
  }) = _ListenerPayoutsListResponseModel;

  factory ListenerPayoutsListResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerPayoutsListResponseModelFromJson(json);
}

@freezed
abstract class ListenerPayoutsListData with _$ListenerPayoutsListData {
  const factory ListenerPayoutsListData({
    @Default(<ListenerPayoutItemModel>[]) List<ListenerPayoutItemModel> items,
  }) = _ListenerPayoutsListData;

  factory ListenerPayoutsListData.fromJson(Map<String, dynamic> json) =>
      _$ListenerPayoutsListDataFromJson(json);
}

@freezed
abstract class ListenerPayoutItemModel with _$ListenerPayoutItemModel {
  const factory ListenerPayoutItemModel({
    @Default('') String id,
    @Default(0) num amount,
    @Default('') String date,
    @Default('') String status,
    @Default('') String method_label,
    String? reference,
  }) = _ListenerPayoutItemModel;

  factory ListenerPayoutItemModel.fromJson(Map<String, dynamic> json) =>
      _$ListenerPayoutItemModelFromJson(json);
}

@freezed
abstract class ListenerPayoutMethodUpdateResponseModel
    with _$ListenerPayoutMethodUpdateResponseModel {
  const factory ListenerPayoutMethodUpdateResponseModel({
    required String status,
    required ListenerPayoutMethodModel data,
  }) = _ListenerPayoutMethodUpdateResponseModel;

  factory ListenerPayoutMethodUpdateResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerPayoutMethodUpdateResponseModelFromJson(json);
}

@freezed
abstract class ListenerPayoutMutationResponseModel
    with _$ListenerPayoutMutationResponseModel {
  const factory ListenerPayoutMutationResponseModel({
    required String status,
    required ListenerPayoutItemModel data,
  }) = _ListenerPayoutMutationResponseModel;

  factory ListenerPayoutMutationResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$ListenerPayoutMutationResponseModelFromJson(json);
}
