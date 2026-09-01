enum VentorMoodKind { great, okay, anxious, sad, angry }

class VentorMoodOption {
  const VentorMoodOption({
    required this.kind,
    required this.emoji,
    required this.color,
  });

  final VentorMoodKind kind;
  final String emoji;
  final int color;

  static const all = <VentorMoodOption>[
    VentorMoodOption(
      kind: VentorMoodKind.great,
      emoji: '😊',
      color: 0xFF4CAF50,
    ),
    VentorMoodOption(kind: VentorMoodKind.okay, emoji: '😐', color: 0xFFF4C430),
    VentorMoodOption(
      kind: VentorMoodKind.anxious,
      emoji: '😟',
      color: 0xFF9B6DFF,
    ),
    VentorMoodOption(kind: VentorMoodKind.sad, emoji: '😢', color: 0xFF5B8DEF),
    VentorMoodOption(
      kind: VentorMoodKind.angry,
      emoji: '😠',
      color: 0xFFE57373,
    ),
  ];
}

class VentorMoodCheckIn {
  const VentorMoodCheckIn({
    required this.mood,
    required this.note,
    required this.at,
  });

  final VentorMoodKind mood;
  final String note;
  final DateTime at;
}

class VentorHomeRecentSession {
  const VentorHomeRecentSession({
    required this.id,
    required this.listenerName,
    required this.listenerAvatarUrl,
    required this.whenLabelKey,
    required this.durationMinutes,
    this.isFavorite = false,
  });

  final String id;
  final String listenerName;
  final String listenerAvatarUrl;
  final String whenLabelKey;
  final int durationMinutes;
  final bool isFavorite;
}

/// Mock home state for the ventor dashboard.
abstract final class VentorHomeCatalog {
  static const mockUserName = 'Alex';

  /// Streak reward when 7 check-ins are completed.
  static const streakDiscountPercent = 20;
  static const streakRewardOfferId = 'off_20_any';

  static const mockRecentSessions = <VentorHomeRecentSession>[
    VentorHomeRecentSession(
      id: 'rs1',
      listenerName: 'Luna',
      listenerAvatarUrl: 'https://i.pravatar.cc/120?u=ventor-home-luna',
      whenLabelKey: 'yesterday',
      durationMinutes: 28,
      isFavorite: true,
    ),
  ];
}
