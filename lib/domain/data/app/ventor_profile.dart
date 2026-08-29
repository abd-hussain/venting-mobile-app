import 'package:venting_mobile_app/domain/data/api/ventor_favorites_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_mood_journey_response_model.dart';
import 'package:venting_mobile_app/domain/data/api/ventor_profile_response_model.dart';
import 'package:venting_mobile_app/utils/api_asset_url.dart';

class VentorProfileMoodPoint {
  const VentorProfileMoodPoint({required this.dayIndex, required this.mood});

  final int dayIndex;
  final double mood;
}

class VentorProfileFavoriteListener {
  const VentorProfileFavoriteListener({
    required this.id,
    required this.name,
    required this.rating,
    this.avatarUrl,
  });

  final String id;
  final String name;
  final double rating;
  final String? avatarUrl;
}

class VentorProfileSummary {
  const VentorProfileSummary({
    required this.id,
    required this.nickname,
    this.avatarUrl,
    required this.isAnonymous,
    required this.sessionsCount,
    required this.streakDays,
  });

  final String id;
  final String nickname;
  final String? avatarUrl;
  final bool isAnonymous;
  final int sessionsCount;
  final int streakDays;
}

class VentorProfileOverview {
  const VentorProfileOverview({
    required this.profile,
    required this.moodPoints,
    required this.favoriteListeners,
  });

  final VentorProfileSummary profile;
  final List<VentorProfileMoodPoint> moodPoints;
  final List<VentorProfileFavoriteListener> favoriteListeners;
}

VentorProfileSummary ventorProfileSummaryFromApi(
  VentorProfileData data, {
  required String apiBaseUrl,
}) {
  final stats = data.stats;
  return VentorProfileSummary(
    id: data.id,
    nickname: data.nickname.trim(),
    avatarUrl: _resolvedMediaUrl(data.avatar_url, apiBaseUrl: apiBaseUrl),
    isAnonymous: data.is_anonymous,
    sessionsCount: stats?.sessions_count ?? 0,
    streakDays: stats?.streak_days ?? 0,
  );
}

VentorProfileOverview ventorProfileOverviewFromApi({
  required VentorProfileData profile,
  required VentorMoodJourneyData moodJourney,
  required VentorFavoritesData favorites,
  required String apiBaseUrl,
}) {
  return VentorProfileOverview(
    profile: ventorProfileSummaryFromApi(profile, apiBaseUrl: apiBaseUrl),
    moodPoints: [
      for (final point in moodJourney.points)
        VentorProfileMoodPoint(
          dayIndex: point.day_index,
          mood: point.mood.toDouble().clamp(0, 1),
        ),
    ],
    favoriteListeners: [
      for (final listener in favorites.items)
        VentorProfileFavoriteListener(
          id: listener.id,
          name: listener.name.trim(),
          rating: listener.rating.toDouble(),
          avatarUrl: _resolvedMediaUrl(
            listener.avatar_url,
            apiBaseUrl: apiBaseUrl,
          ),
        ),
    ],
  );
}

String? _resolvedMediaUrl(String? url, {required String apiBaseUrl}) {
  final resolved = resolveApiAssetUrl(url, baseUrl: apiBaseUrl);
  return resolved.isEmpty ? null : resolved;
}
