import 'package:venting_mobile_app/domain/data/api/listener_earnings_response_model.dart';

enum ListenerEarningsTierId { starter, rising, trusted, expert, elite }

class ListenerEarningsTier {
  const ListenerEarningsTier({
    required this.id,
    required this.minSessions,
    required this.minRating,
    required this.hourlyRate,
  });

  final ListenerEarningsTierId id;
  final int minSessions;
  final double minRating;
  final double hourlyRate;

  bool isUnlocked({required int sessions, required double rating}) {
    return sessions >= minSessions && rating >= minRating;
  }
}

class ListenerEarningsChartPoint {
  const ListenerEarningsChartPoint({required this.label, required this.amount});

  final String label;
  final double amount;
}

/// Ordered lowest → highest. Highest matching tier wins.
const listenerEarningsTiers = <ListenerEarningsTier>[
  ListenerEarningsTier(
    id: ListenerEarningsTierId.starter,
    minSessions: 0,
    minRating: 0,
    hourlyRate: 15,
  ),
  ListenerEarningsTier(
    id: ListenerEarningsTierId.rising,
    minSessions: 10,
    minRating: 4,
    hourlyRate: 20,
  ),
  ListenerEarningsTier(
    id: ListenerEarningsTierId.trusted,
    minSessions: 25,
    minRating: 4.3,
    hourlyRate: 25,
  ),
  ListenerEarningsTier(
    id: ListenerEarningsTierId.expert,
    minSessions: 50,
    minRating: 4.5,
    hourlyRate: 32,
  ),
  ListenerEarningsTier(
    id: ListenerEarningsTierId.elite,
    minSessions: 100,
    minRating: 4.7,
    hourlyRate: 40,
  ),
];

ListenerEarningsTier resolveListenerEarningsTier({
  required int sessions,
  required double rating,
}) {
  ListenerEarningsTier current = listenerEarningsTiers.first;
  for (final tier in listenerEarningsTiers) {
    if (tier.isUnlocked(sessions: sessions, rating: rating)) {
      current = tier;
    }
  }
  return current;
}

class ListenerEarningsOverview {
  const ListenerEarningsOverview({
    required this.totalEarnings,
    required this.trendPercent,
    required this.sessions,
    required this.hours,
    required this.rating,
    required this.currentTierId,
    required this.currentTierHourlyRate,
    required this.tiers,
    required this.chartPoints,
    this.defaultPayoutMethod,
  });

  final double totalEarnings;
  final int trendPercent;
  final int sessions;
  final double hours;
  final double rating;
  final ListenerEarningsTierId currentTierId;
  final double currentTierHourlyRate;
  final List<ListenerEarningsTier> tiers;
  final List<ListenerEarningsChartPoint> chartPoints;
  final ListenerPayoutMethodPreview? defaultPayoutMethod;
}

class ListenerPayoutMethodPreview {
  const ListenerPayoutMethodPreview({
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
}

ListenerEarningsOverview listenerEarningsOverviewFromApi({
  required ListenerEarningsData earnings,
  required ListenerEarningsChartData chart,
  required ListenerPayoutMethodsData payoutMethods,
}) {
  final apiTiers = earnings.tiers
      .map(_tierFromApi)
      .whereType<ListenerEarningsTier>()
      .toList();

  final tiers = apiTiers.isNotEmpty ? apiTiers : listenerEarningsTiers;

  final currentTierFromApi = earnings.current_tier == null
      ? null
      : _tierFromApi(earnings.current_tier!);

  final currentTierId =
      currentTierFromApi?.id ??
      resolveListenerEarningsTier(
        sessions: earnings.sessions,
        rating: earnings.rating.toDouble(),
      ).id;

  final currentTierHourlyRate =
      earnings.current_tier?.hourly_rate.toDouble() ??
      tiers
          .firstWhere(
            (tier) => tier.id == currentTierId,
            orElse: () => tiers.first,
          )
          .hourlyRate;

  return ListenerEarningsOverview(
    totalEarnings: earnings.total_earnings.toDouble(),
    trendPercent: earnings.trend_percent,
    sessions: earnings.sessions,
    hours: earnings.hours.toDouble(),
    rating: earnings.rating.toDouble(),
    currentTierId: currentTierId,
    currentTierHourlyRate: currentTierHourlyRate,
    tiers: tiers,
    chartPoints: [
      for (final point in chart.points)
        ListenerEarningsChartPoint(
          label: point.label,
          amount: point.amount.toDouble(),
        ),
    ],
    defaultPayoutMethod: _defaultPayoutMethodFromApi(payoutMethods),
  );
}

ListenerEarningsTier? _tierFromApi(ListenerEarningsTierModel model) {
  final id = _tierIdFromApi(model.id);
  if (id == null) return null;

  return ListenerEarningsTier(
    id: id,
    minSessions: model.min_sessions,
    minRating: model.min_rating.toDouble(),
    hourlyRate: model.hourly_rate.toDouble(),
  );
}

ListenerEarningsTierId? _tierIdFromApi(String raw) {
  return switch (raw.trim().toLowerCase()) {
    'starter' => ListenerEarningsTierId.starter,
    'rising' => ListenerEarningsTierId.rising,
    'trusted' => ListenerEarningsTierId.trusted,
    'expert' => ListenerEarningsTierId.expert,
    'elite' => ListenerEarningsTierId.elite,
    _ => null,
  };
}

ListenerPayoutMethodPreview? _defaultPayoutMethodFromApi(
  ListenerPayoutMethodsData data,
) {
  if (data.methods.isEmpty) return null;

  final defaultId = data.default_method?.trim();
  ListenerPayoutMethodModel? method;

  if (defaultId != null && defaultId.isNotEmpty) {
    for (final item in data.methods) {
      if (item.id == defaultId) {
        method = item;
        break;
      }
    }
  }

  method ??= data.methods.first;
  return _payoutMethodPreview(method);
}

ListenerPayoutMethodPreview _payoutMethodPreview(
  ListenerPayoutMethodModel method,
) {
  final label = method.label.trim();
  if (label.isNotEmpty) {
    return ListenerPayoutMethodPreview(
      title: label,
      subtitle: _payoutMethodSubtitle(method),
    );
  }

  return switch (method.type.trim().toLowerCase()) {
    'paypal' => ListenerPayoutMethodPreview(
      title: 'PayPal',
      subtitle: method.paypal_email?.trim() ?? '',
    ),
    'bank' => ListenerPayoutMethodPreview(
      title: method.bank_name?.trim().isNotEmpty == true
          ? method.bank_name!.trim()
          : 'Bank account',
      subtitle: method.iban_or_account?.trim() ?? '',
    ),
    _ => ListenerPayoutMethodPreview(
      title: method.type.trim().isNotEmpty ? method.type.trim() : 'Payout',
      subtitle: _payoutMethodSubtitle(method),
    ),
  };
}

String _payoutMethodSubtitle(ListenerPayoutMethodModel method) {
  final paypal = method.paypal_email?.trim();
  if (paypal != null && paypal.isNotEmpty) return paypal;

  final iban = method.iban_or_account?.trim();
  if (iban != null && iban.isNotEmpty) return iban;

  final holder = method.account_holder_name?.trim();
  if (holder != null && holder.isNotEmpty) return holder;

  return '';
}
