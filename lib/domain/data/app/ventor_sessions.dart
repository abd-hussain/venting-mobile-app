import 'package:venting_mobile_app/domain/data/api/ventor_home_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_sessions_response_model.dart';
import 'package:venting_mobile_app/domain/data/app/ventor_home.dart';
import 'package:venting_mobile_app/utils/api_asset_url.dart';

class VentorBookedSessionsOverview {
  const VentorBookedSessionsOverview({this.sessions = const []});

  final List<VentorBookedSessionData> sessions;
}

class VentorBookedSessionListenerSummaryData {
  const VentorBookedSessionListenerSummaryData({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.isVerified,
    required this.topics,
    required this.languages,
    required this.country,
    required this.city,
    required this.countryIsoCode,
    required this.ratePerMinute,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final double rating;
  final bool isVerified;
  final List<String> topics;
  final List<String> languages;
  final String country;
  final String city;
  final String countryIsoCode;
  final double ratePerMinute;
}

class VentorBookedSessionPaymentData {
  const VentorBookedSessionPaymentData({
    required this.amountPaid,
    required this.currency,
    required this.voiceChangeFee,
    required this.discountAmount,
    this.sessionPrice,
  });

  final double amountPaid;
  final String currency;
  final double voiceChangeFee;
  final double discountAmount;
  final double? sessionPrice;
}

class VentorBookedSessionDetailData {
  const VentorBookedSessionDetailData({
    required this.session,
    this.listener,
    this.payment,
  });

  final VentorBookedSessionData session;
  final VentorBookedSessionListenerSummaryData? listener;
  final VentorBookedSessionPaymentData? payment;
}

VentorBookedSessionsOverview ventorBookedSessionsOverviewFromApi({
  required List<VentorHomeBookedSessionModel> items,
  required String apiBaseUrl,
}) {
  final byId = <String, VentorBookedSessionData>{};
  for (final item in items) {
    final mapped = ventorBookedSessionFromApiResolved(
      item,
      apiBaseUrl: apiBaseUrl,
    );
    if (mapped.id.isEmpty) continue;
    byId[mapped.id] = mapped;
  }
  return VentorBookedSessionsOverview(sessions: byId.values.toList());
}

VentorBookedSessionDetailData ventorBookedSessionDetailFromApi(
  VentorBookedSessionDetailDataModel model, {
  required String apiBaseUrl,
}) {
  return VentorBookedSessionDetailData(
    session: ventorBookedSessionFromApiResolved(
      model.session,
      apiBaseUrl: apiBaseUrl,
    ),
    listener: model.listener == null
        ? null
        : ventorBookedSessionListenerSummaryFromApi(
            model.listener!,
            apiBaseUrl: apiBaseUrl,
          ),
    payment: model.payment == null
        ? null
        : ventorBookedSessionPaymentFromApi(model.payment!),
  );
}

VentorBookedSessionData ventorBookedSessionFromApiResolved(
  VentorHomeBookedSessionModel model, {
  required String apiBaseUrl,
}) {
  final base = ventorBookedSessionFromApi(model);
  return VentorBookedSessionData(
    id: base.id,
    listenerId: base.listenerId,
    listenerName: base.listenerName,
    listenerAvatarUrl: resolveApiAssetUrl(
      base.listenerAvatarUrl,
      baseUrl: apiBaseUrl,
    ),
    durationMinutes: base.durationMinutes,
    status: base.status,
    callMode: base.callMode,
    speechLanguage: base.speechLanguage,
    amountPaid: base.amountPaid,
    voiceChangeEnabled: base.voiceChangeEnabled,
    scheduledAt: base.scheduledAt,
    isInstant: base.isInstant,
    refundedToBalance: base.refundedToBalance,
  );
}

VentorBookedSessionListenerSummaryData
ventorBookedSessionListenerSummaryFromApi(
  VentorBookedSessionListenerSummaryModel model, {
  required String apiBaseUrl,
}) {
  return VentorBookedSessionListenerSummaryData(
    id: model.id.trim(),
    name: model.name.trim(),
    avatarUrl: resolveApiAssetUrl(model.avatar_url, baseUrl: apiBaseUrl),
    rating: model.rating,
    isVerified: model.is_verified,
    topics: List<String>.from(model.topics),
    languages: List<String>.from(model.languages),
    country: model.country.trim(),
    city: model.city.trim(),
    countryIsoCode: model.country_iso.trim().toUpperCase(),
    ratePerMinute: model.rate_per_minute,
  );
}

VentorBookedSessionPaymentData ventorBookedSessionPaymentFromApi(
  VentorBookedSessionPaymentModel model,
) {
  return VentorBookedSessionPaymentData(
    amountPaid: model.amount_paid.toDouble(),
    currency: model.currency.trim().isEmpty ? 'USD' : model.currency.trim(),
    voiceChangeFee: model.voice_change_fee.toDouble(),
    discountAmount: model.discount_amount.toDouble(),
    sessionPrice: model.session_price?.toDouble(),
  );
}

VentorBookedSessionData ventorCancelledSessionFromApi(
  VentorCancelSessionData data, {
  required String apiBaseUrl,
}) {
  final session = ventorBookedSessionFromApiResolved(
    data.session,
    apiBaseUrl: apiBaseUrl,
  );
  final refund =
      data.refunded_to_balance?.toDouble() ??
      session.refundedToBalance ??
      session.amountPaid;
  return session.copyWith(
    status: VentorBookedSessionStatusData.cancelled,
    refundedToBalance: refund,
  );
}
