/// Hourly pay tiers for listeners, unlocked by completed sessions + average rating.
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
