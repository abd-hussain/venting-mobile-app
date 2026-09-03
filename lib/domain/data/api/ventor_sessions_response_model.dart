import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_home_response_model.dart';

part 'ventor_sessions_response_model.freezed.dart';
part 'ventor_sessions_response_model.g.dart';

@freezed
abstract class VentorSessionsListResponseModel
    with _$VentorSessionsListResponseModel {
  const factory VentorSessionsListResponseModel({
    required String status,
    required VentorSessionsListData data,
  }) = _VentorSessionsListResponseModel;

  factory VentorSessionsListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VentorSessionsListResponseModelFromJson(json);
}

@freezed
abstract class VentorSessionsListData with _$VentorSessionsListData {
  const factory VentorSessionsListData({
    @Default(<VentorHomeBookedSessionModel>[])
    List<VentorHomeBookedSessionModel> items,
  }) = _VentorSessionsListData;

  factory VentorSessionsListData.fromJson(Map<String, dynamic> json) =>
      _$VentorSessionsListDataFromJson(json);
}

@freezed
abstract class VentorBookedSessionDetailResponseModel
    with _$VentorBookedSessionDetailResponseModel {
  const factory VentorBookedSessionDetailResponseModel({
    required String status,
    required VentorBookedSessionDetailDataModel data,
  }) = _VentorBookedSessionDetailResponseModel;

  factory VentorBookedSessionDetailResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorBookedSessionDetailResponseModelFromJson(
    _normalizeDetailEnvelope(json),
  );
}

@freezed
abstract class VentorBookedSessionDetailDataModel
    with _$VentorBookedSessionDetailDataModel {
  const factory VentorBookedSessionDetailDataModel({
    required VentorHomeBookedSessionModel session,
    VentorBookedSessionListenerSummaryModel? listener,
    VentorBookedSessionPaymentModel? payment,
  }) = _VentorBookedSessionDetailDataModel;

  factory VentorBookedSessionDetailDataModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorBookedSessionDetailDataModelFromJson(_normalizeDetailData(json));
}

@freezed
abstract class VentorBookedSessionListenerSummaryModel
    with _$VentorBookedSessionListenerSummaryModel {
  const factory VentorBookedSessionListenerSummaryModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String avatar_url,
    @Default(0) double rating,
    @Default(false) bool is_verified,
    @Default(<String>[]) List<String> topics,
    @Default(<String>[]) List<String> languages,
    @Default('') String country,
    @Default('') String city,
    @Default('') String country_iso,
    @Default(0) double rate_per_minute,
  }) = _VentorBookedSessionListenerSummaryModel;

  factory VentorBookedSessionListenerSummaryModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorBookedSessionListenerSummaryModelFromJson(
    _normalizeListenerSummary(json),
  );
}

@freezed
abstract class VentorBookedSessionPaymentModel
    with _$VentorBookedSessionPaymentModel {
  const factory VentorBookedSessionPaymentModel({
    @Default(0) num amount_paid,
    @Default('USD') String currency,
    @Default(0) num voice_change_fee,
    @Default(0) num discount_amount,
    num? session_price,
  }) = _VentorBookedSessionPaymentModel;

  factory VentorBookedSessionPaymentModel.fromJson(Map<String, dynamic> json) =>
      _$VentorBookedSessionPaymentModelFromJson(json);
}

@freezed
abstract class VentorCancelSessionResponseModel
    with _$VentorCancelSessionResponseModel {
  const factory VentorCancelSessionResponseModel({
    required String status,
    required VentorCancelSessionData data,
  }) = _VentorCancelSessionResponseModel;

  factory VentorCancelSessionResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$VentorCancelSessionResponseModelFromJson(
    _normalizeCancelEnvelope(json),
  );
}

@freezed
abstract class VentorCancelSessionData with _$VentorCancelSessionData {
  const factory VentorCancelSessionData({
    required VentorHomeBookedSessionModel session,
    num? refunded_to_balance,
  }) = _VentorCancelSessionData;

  factory VentorCancelSessionData.fromJson(Map<String, dynamic> json) =>
      _$VentorCancelSessionDataFromJson(_normalizeCancelData(json));
}

Map<String, dynamic> _normalizeDetailEnvelope(Map<String, dynamic> json) {
  final data = json['data'];
  if (data is! Map) return json;
  return {
    ...json,
    'data': _normalizeDetailData(Map<String, dynamic>.from(data)),
  };
}

Map<String, dynamic> _normalizeDetailData(Map<String, dynamic> json) {
  final out = Map<String, dynamic>.from(json);

  final nestedSession = json['session'];
  if (nestedSession is Map) {
    out['session'] = Map<String, dynamic>.from(nestedSession);
  } else {
    out['session'] = <String, dynamic>{
      'id': json['id'],
      'listener_id': json['listener_id'],
      'listener_name': json['listener_name'],
      'listener_avatar_url': json['listener_avatar_url'],
      'duration_minutes': json['duration_minutes'],
      'status': json['status'],
      'call_mode': json['call_mode'],
      'speech_language': json['speech_language'],
      'amount_paid': json['amount_paid'],
      'voice_change_enabled': json['voice_change_enabled'],
      'scheduled_at': json['scheduled_at'],
      'refunded_to_balance': json['refunded_to_balance'],
    };
  }

  final listener = json['listener'] ?? json['listener_summary'];
  if (listener is Map) {
    out['listener'] = _normalizeListenerSummary(
      Map<String, dynamic>.from(listener),
    );
  }

  final payment = json['payment'];
  if (payment is Map) {
    out['payment'] = Map<String, dynamic>.from(payment);
  }

  return out;
}

Map<String, dynamic> _normalizeListenerSummary(Map<String, dynamic> json) {
  return {
    ...json,
    'id': json['id'] ?? json['listener_id'] ?? '',
    'name': json['name'] ?? json['listener_name'] ?? '',
    'avatar_url': json['avatar_url'] ?? json['listener_avatar_url'] ?? '',
    'country_iso': json['country_iso'] ?? json['country_iso_code'] ?? '',
    'topics': _asStringList(json['topics']),
    'languages': _asStringList(json['languages']),
  };
}

Map<String, dynamic> _normalizeCancelEnvelope(Map<String, dynamic> json) {
  final data = json['data'];
  if (data is! Map) return json;
  return {
    ...json,
    'data': _normalizeCancelData(Map<String, dynamic>.from(data)),
  };
}

Map<String, dynamic> _normalizeCancelData(Map<String, dynamic> json) {
  final nestedSession = json['session'];
  if (nestedSession is Map) {
    final session = Map<String, dynamic>.from(nestedSession);
    final refund =
        json['refunded_to_balance'] ?? session['refunded_to_balance'];
    if (refund != null) {
      session['refunded_to_balance'] = refund;
    }
    return {'session': session, 'refunded_to_balance': refund};
  }

  return {
    'session': Map<String, dynamic>.from(json),
    'refunded_to_balance': json['refunded_to_balance'],
  };
}

List<String> _asStringList(Object? raw) {
  if (raw is! List) return const <String>[];
  return [
    for (final item in raw)
      if (item is String && item.trim().isNotEmpty)
        item.trim()
      else if (item is Map)
        (item['label'] ?? item['name'] ?? item['id'] ?? '').toString().trim(),
  ].where((e) => e.isNotEmpty).toList();
}
