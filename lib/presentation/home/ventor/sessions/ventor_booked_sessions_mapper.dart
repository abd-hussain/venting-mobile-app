import 'package:venting_mobile_app/domain/data/app/ventor_sessions.dart';
import 'package:venting_mobile_app/presentation/home/ventor/home/ventor_home_mapper.dart';
import 'package:venting_mobile_app/presentation/home/ventor/sessions/ventor_sessions_models.dart';

class VentorBookedSessionListenerSummary {
  const VentorBookedSessionListenerSummary({
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

class VentorBookedSessionPayment {
  const VentorBookedSessionPayment({
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

class VentorBookedSessionDetail {
  const VentorBookedSessionDetail({
    required this.session,
    this.listener,
    this.payment,
  });

  final VentorBookedSession session;
  final VentorBookedSessionListenerSummary? listener;
  final VentorBookedSessionPayment? payment;
}

VentorBookedSessionListenerSummary ventorBookedSessionListenerSummaryFromData(
  VentorBookedSessionListenerSummaryData data,
) {
  return VentorBookedSessionListenerSummary(
    id: data.id,
    name: data.name,
    avatarUrl: data.avatarUrl,
    rating: data.rating,
    isVerified: data.isVerified,
    topics: List<String>.from(data.topics),
    languages: List<String>.from(data.languages),
    country: data.country,
    city: data.city,
    countryIsoCode: data.countryIsoCode,
    ratePerMinute: data.ratePerMinute,
  );
}

VentorBookedSessionPayment ventorBookedSessionPaymentFromData(
  VentorBookedSessionPaymentData data,
) {
  return VentorBookedSessionPayment(
    amountPaid: data.amountPaid,
    currency: data.currency,
    voiceChangeFee: data.voiceChangeFee,
    discountAmount: data.discountAmount,
    sessionPrice: data.sessionPrice,
  );
}

VentorBookedSessionDetail ventorBookedSessionDetailFromDomain(
  VentorBookedSessionDetailData data,
) {
  return VentorBookedSessionDetail(
    session: ventorBookedSessionFromData(data.session),
    listener: data.listener == null
        ? null
        : ventorBookedSessionListenerSummaryFromData(data.listener!),
    payment: data.payment == null
        ? null
        : ventorBookedSessionPaymentFromData(data.payment!),
  );
}
