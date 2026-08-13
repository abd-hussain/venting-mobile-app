enum VentorListenerGender { female, male, preferNotToSay }

class VentorListenerTopic {
  const VentorListenerTopic(this.id, this.labelKey);

  final String id;
  final String labelKey;
}

class VentorListenerAvailability {
  const VentorListenerAvailability({
    required this.days,
    required this.fromHour,
    required this.toHour,
    required this.timeZoneId,
    required this.acceptInstantCall,
    required this.sessionMinutes,
  });

  /// Day ids from listener registration: mon, tue, wed, thu, fri, sat, sun.
  final List<String> days;
  final String fromHour;
  final String toHour;
  final String timeZoneId;
  final bool acceptInstantCall;
  final List<int> sessionMinutes;
}

class VentorFindListener {
  const VentorFindListener({
    required this.id,
    required this.name,
    required this.avatarUrl,
    required this.rating,
    required this.reviewCount,
    required this.sessionCount,
    required this.topics,
    required this.languages,
    required this.gender,
    required this.ratePerMinute,
    required this.bio,
    required this.helpWith,
    required this.voicePreviewSeconds,
    required this.isOnline,
    required this.isVerified,
    required this.ratingBreakdown,
    required this.country,
    required this.city,
    required this.countryIsoCode,
    required this.lifeExperiences,
    required this.boundaries,
    required this.availability,
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String avatarUrl;
  final double rating;
  final int reviewCount;
  final int sessionCount;
  final List<String> topics;
  final List<String> languages;
  final VentorListenerGender gender;
  final double ratePerMinute;
  final String bio;
  final List<String> helpWith;
  final int voicePreviewSeconds;
  final bool isOnline;
  final bool isVerified;
  final Map<int, int> ratingBreakdown;
  final String country;
  final String city;

  /// ISO 3166-1 alpha-2 country code (e.g. LB, EG) for flag display.
  final String countryIsoCode;

  /// Life experience tags from listener registration (ids or custom text).
  final List<String> lifeExperiences;

  /// Boundary topic ids from listener registration.
  final List<String> boundaries;
  final VentorListenerAvailability availability;
  final bool isFavorite;

  double priceForMinutes(int minutes) => ratePerMinute * minutes;

  VentorFindListener copyWith({bool? isFavorite}) {
    return VentorFindListener(
      id: id,
      name: name,
      avatarUrl: avatarUrl,
      rating: rating,
      reviewCount: reviewCount,
      sessionCount: sessionCount,
      topics: topics,
      languages: languages,
      gender: gender,
      ratePerMinute: ratePerMinute,
      bio: bio,
      helpWith: helpWith,
      voicePreviewSeconds: voicePreviewSeconds,
      isOnline: isOnline,
      isVerified: isVerified,
      ratingBreakdown: ratingBreakdown,
      country: country,
      city: city,
      countryIsoCode: countryIsoCode,
      lifeExperiences: lifeExperiences,
      boundaries: boundaries,
      availability: availability,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

enum VentorFavoriteFilter { any, favoritesOnly, notFavorites }

class VentorSessionFilters {
  const VentorSessionFilters({
    this.minPricePerMinute = 0,
    this.maxPricePerMinute = 3,
    this.languages = const {},
    this.genders = const {},
    this.minRating = 0,
    this.favoriteFilter = VentorFavoriteFilter.any,
  });

  final double minPricePerMinute;
  final double maxPricePerMinute;
  final Set<String> languages;
  final Set<VentorListenerGender> genders;
  final double minRating;
  final VentorFavoriteFilter favoriteFilter;

  static const priceFloor = 0.0;
  static const priceCeil = 3.0;
  static const ratingFloor = 0.0;
  static const ratingCeil = 5.0;
  static const filterGenders = <VentorListenerGender>[
    VentorListenerGender.male,
    VentorListenerGender.female,
  ];

  bool get isDefault =>
      minPricePerMinute <= priceFloor &&
      maxPricePerMinute >= priceCeil &&
      languages.isEmpty &&
      genders.isEmpty &&
      minRating <= 0 &&
      favoriteFilter == VentorFavoriteFilter.any;

  VentorSessionFilters copyWith({
    double? minPricePerMinute,
    double? maxPricePerMinute,
    Set<String>? languages,
    Set<VentorListenerGender>? genders,
    double? minRating,
    VentorFavoriteFilter? favoriteFilter,
  }) {
    return VentorSessionFilters(
      minPricePerMinute: minPricePerMinute ?? this.minPricePerMinute,
      maxPricePerMinute: maxPricePerMinute ?? this.maxPricePerMinute,
      languages: languages ?? this.languages,
      genders: genders ?? this.genders,
      minRating: minRating ?? this.minRating,
      favoriteFilter: favoriteFilter ?? this.favoriteFilter,
    );
  }
}

class VentorSessionDurationOption {
  const VentorSessionDurationOption({
    required this.minutes,
    required this.isPopular,
  });

  final int minutes;
  final bool isPopular;
}

enum VentorSessionTimeMode { instant, nearest, scheduled }

class VentorSessionTimeChoice {
  const VentorSessionTimeChoice.instant()
    : mode = VentorSessionTimeMode.instant,
      scheduledAt = null;

  const VentorSessionTimeChoice.nearest(this.scheduledAt)
    : mode = VentorSessionTimeMode.nearest;

  const VentorSessionTimeChoice.scheduled(this.scheduledAt)
    : mode = VentorSessionTimeMode.scheduled;

  final VentorSessionTimeMode mode;
  final DateTime? scheduledAt;
}

enum VentorBookedSessionStatus { upcoming, live, completed, cancelled }

enum VentorBookedCallMode { voice, video }

class VentorBookedSession {
  const VentorBookedSession({
    required this.id,
    required this.listenerId,
    required this.listenerName,
    required this.listenerAvatarUrl,
    required this.durationMinutes,
    required this.status,
    required this.callMode,
    required this.speechLanguage,
    required this.amountPaid,
    required this.voiceChangeEnabled,
    this.scheduledAt,
    this.isInstant = false,
    this.refundedToBalance,
  });

  final String id;
  final String listenerId;
  final String listenerName;
  final String listenerAvatarUrl;
  final int durationMinutes;
  final VentorBookedSessionStatus status;
  final VentorBookedCallMode callMode;
  final String speechLanguage;
  final double amountPaid;
  final bool voiceChangeEnabled;
  final DateTime? scheduledAt;
  final bool isInstant;
  final double? refundedToBalance;

  /// Full paid amount credited back to the ventor balance when cancelled.
  double get cancelRefundAmount => amountPaid;

  VentorBookedSession copyWith({
    VentorBookedSessionStatus? status,
    double? refundedToBalance,
  }) {
    return VentorBookedSession(
      id: id,
      listenerId: listenerId,
      listenerName: listenerName,
      listenerAvatarUrl: listenerAvatarUrl,
      durationMinutes: durationMinutes,
      status: status ?? this.status,
      callMode: callMode,
      speechLanguage: speechLanguage,
      amountPaid: amountPaid,
      voiceChangeEnabled: voiceChangeEnabled,
      scheduledAt: scheduledAt,
      isInstant: isInstant,
      refundedToBalance: refundedToBalance ?? this.refundedToBalance,
    );
  }
}

abstract final class VentorSessionsCatalog {
  static const topicIds = <String>[
    'all',
    'anxiety',
    'sadness',
    'relationships',
    'stress',
  ];

  static const durationOptions = <VentorSessionDurationOption>[
    VentorSessionDurationOption(minutes: 15, isPopular: false),
    VentorSessionDurationOption(minutes: 30, isPopular: true),
    VentorSessionDurationOption(minutes: 45, isPopular: false),
    VentorSessionDurationOption(minutes: 60, isPopular: false),
  ];

  static const availableLanguages = <String>['English', 'Arabic', 'French'];

  // TODO: Replace with listeners discovery API.
  static const mockListeners = <VentorFindListener>[
    VentorFindListener(
      id: 'lina',
      name: 'Lina',
      avatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-lina',
      rating: 4.9,
      reviewCount: 128,
      sessionCount: 420,
      topics: ['Anxiety', 'Overthinking'],
      languages: ['English', 'Arabic'],
      gender: VentorListenerGender.female,
      ratePerMinute: 1.20,
      bio:
          'I create a calm space for you to feel heard without judgment. '
          'Whether you are anxious, stuck in your thoughts, or just need '
          'someone present — I am here.',
      helpWith: ['Anxiety & overthinking', 'Emotional overwhelm', 'Self-doubt'],
      voicePreviewSeconds: 30,
      isOnline: true,
      isVerified: true,
      ratingBreakdown: {5: 86, 4: 10, 3: 3, 2: 1, 1: 0},
      country: 'Lebanon',
      city: 'Beirut',
      countryIsoCode: 'LB',
      lifeExperiences: ['anxiety_stress', 'life_stages', 'in_relationship'],
      boundaries: ['politics', 'illegal_activities'],
      availability: VentorListenerAvailability(
        days: ['sun', 'mon', 'tue', 'wed', 'thu'],
        fromHour: '10:00 AM',
        toHour: '10:00 PM',
        timeZoneId: 'Asia/Beirut',
        acceptInstantCall: true,
        sessionMinutes: [30, 45, 60],
      ),
      isFavorite: true,
    ),
    VentorFindListener(
      id: 'omar',
      name: 'Omar',
      avatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-omar',
      rating: 4.8,
      reviewCount: 96,
      sessionCount: 310,
      topics: ['Stress', 'Work'],
      languages: ['English', 'Arabic'],
      gender: VentorListenerGender.male,
      ratePerMinute: 1.05,
      bio:
          'I help you unpack work pressure and daily stress with practical '
          'listening and grounding presence.',
      helpWith: ['Burnout', 'Work stress', 'Boundaries'],
      voicePreviewSeconds: 28,
      isOnline: true,
      isVerified: true,
      ratingBreakdown: {5: 78, 4: 16, 3: 4, 2: 1, 1: 1},
      country: 'Egypt',
      city: 'Cairo',
      countryIsoCode: 'EG',
      lifeExperiences: ['career_change', 'job_loss', 'married'],
      boundaries: ['sexual_topics', 'religion'],
      availability: VentorListenerAvailability(
        days: ['sat', 'sun', 'mon', 'tue', 'wed', 'thu'],
        fromHour: '06:00 PM',
        toHour: '11:00 PM',
        timeZoneId: 'Africa/Cairo',
        acceptInstantCall: true,
        sessionMinutes: [30, 60],
      ),
    ),
    VentorFindListener(
      id: 'sara',
      name: 'Sara',
      avatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-sara',
      rating: 5,
      reviewCount: 64,
      sessionCount: 180,
      topics: ['Relationships', 'Sadness'],
      languages: ['English'],
      gender: VentorListenerGender.female,
      ratePerMinute: 0.95,
      bio:
          'Warm, patient listening for relationship hurt and heavy feelings. '
          'You do not have to hold it alone.',
      helpWith: ['Heartbreak', 'Loneliness', 'Family tension'],
      voicePreviewSeconds: 32,
      isOnline: false,
      isVerified: true,
      ratingBreakdown: {5: 92, 4: 6, 3: 2, 2: 0, 1: 0},
      country: 'United States',
      city: 'Austin',
      countryIsoCode: 'US',
      lifeExperiences: ['divorced', 'grief_loss', 'single_parent'],
      boundaries: ['suicide_self_harm', 'domestic_violence'],
      availability: VentorListenerAvailability(
        days: ['mon', 'tue', 'wed', 'thu', 'fri'],
        fromHour: '09:00 AM',
        toHour: '05:00 PM',
        timeZoneId: 'America/Chicago',
        acceptInstantCall: false,
        sessionMinutes: [45, 60],
      ),
    ),
    VentorFindListener(
      id: 'nour',
      name: 'Nour',
      avatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-nour',
      rating: 4.7,
      reviewCount: 54,
      sessionCount: 150,
      topics: ['Anxiety', 'Stress'],
      languages: ['Arabic'],
      gender: VentorListenerGender.female,
      ratePerMinute: 0.85,
      bio: 'Arabic-first support for anxiety spikes and quiet overwhelm.',
      helpWith: ['Panic moments', 'Sleep worries', 'Daily anxiety'],
      voicePreviewSeconds: 25,
      isOnline: true,
      isVerified: false,
      ratingBreakdown: {5: 70, 4: 20, 3: 7, 2: 2, 1: 1},
      country: 'Jordan',
      city: 'Amman',
      countryIsoCode: 'JO',
      lifeExperiences: ['anxiety_stress', 'health_challenge', 'single'],
      boundaries: ['addiction', 'politics'],
      availability: VentorListenerAvailability(
        days: ['fri', 'sat', 'sun'],
        fromHour: '04:00 PM',
        toHour: '11:00 PM',
        timeZoneId: 'Asia/Amman',
        acceptInstantCall: true,
        sessionMinutes: [15, 30, 60],
      ),
    ),
    VentorFindListener(
      id: 'karim',
      name: 'Karim',
      avatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-karim',
      rating: 4.6,
      reviewCount: 41,
      sessionCount: 98,
      topics: ['Relationships', 'Stress'],
      languages: ['English', 'French'],
      gender: VentorListenerGender.male,
      ratePerMinute: 1.35,
      bio: 'Steady presence for relationship conflict and high-stress seasons.',
      helpWith: ['Conflict', 'Communication', 'Pressure'],
      voicePreviewSeconds: 35,
      isOnline: true,
      isVerified: true,
      ratingBreakdown: {5: 65, 4: 24, 3: 8, 2: 2, 1: 1},
      country: 'France',
      city: 'Lyon',
      countryIsoCode: 'FR',
      lifeExperiences: ['startup_founder', 'financial_struggle', 'married'],
      boundaries: ['religion', 'illegal_activities'],
      availability: VentorListenerAvailability(
        days: ['mon', 'tue', 'wed', 'thu', 'fri', 'sat'],
        fromHour: '08:00 AM',
        toHour: '08:00 PM',
        timeZoneId: 'Europe/Paris',
        acceptInstantCall: true,
        sessionMinutes: [30, 45],
      ),
    ),
    VentorFindListener(
      id: 'maya',
      name: 'Maya',
      avatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-maya',
      rating: 4.4,
      reviewCount: 22,
      sessionCount: 60,
      topics: ['Sadness', 'Anxiety'],
      languages: ['English', 'Arabic'],
      gender: VentorListenerGender.female,
      ratePerMinute: 0.70,
      bio: 'Gentle space for sadness, low energy days, and soft restarts.',
      helpWith: ['Grief', 'Low mood', 'Motivation'],
      voicePreviewSeconds: 22,
      isOnline: false,
      isVerified: true,
      ratingBreakdown: {5: 55, 4: 30, 3: 10, 2: 3, 1: 2},
      country: 'Morocco',
      city: 'Casablanca',
      countryIsoCode: 'MA',
      lifeExperiences: ['grief_loss', 'life_stages', 'caregiver'],
      boundaries: [],
      availability: VentorListenerAvailability(
        days: ['wed', 'thu', 'fri', 'sat', 'sun'],
        fromHour: '02:00 PM',
        toHour: '09:00 PM',
        timeZoneId: 'Africa/Casablanca',
        acceptInstantCall: false,
        sessionMinutes: [30, 60],
      ),
    ),
  ];

  static List<VentorFindListener> filterListeners({
    required List<VentorFindListener> source,
    required String query,
    required String topicId,
    required VentorSessionFilters filters,
  }) {
    final q = query.trim().toLowerCase();
    return source.where((listener) {
      if (topicId != 'all') {
        final matchTopic = listener.topics.any(
          (t) =>
              t.toLowerCase() == topicId || t.toLowerCase().contains(topicId),
        );
        if (!matchTopic) return false;
      }
      if (q.isNotEmpty) {
        final haystack = [
          listener.name,
          listener.country,
          listener.city,
          ...listener.topics,
          ...listener.languages,
          ...listener.helpWith,
          ...listener.lifeExperiences.map((e) => e.replaceAll('_', ' ')),
          ...listener.boundaries.map((e) => e.replaceAll('_', ' ')),
          listener.bio,
        ].join(' ').toLowerCase();
        if (!haystack.contains(q)) return false;
      }
      if (listener.ratePerMinute < filters.minPricePerMinute ||
          listener.ratePerMinute > filters.maxPricePerMinute) {
        return false;
      }
      if (filters.languages.isNotEmpty &&
          !listener.languages.any(filters.languages.contains)) {
        return false;
      }
      if (filters.genders.isNotEmpty &&
          !filters.genders.contains(listener.gender)) {
        return false;
      }
      if (listener.rating < filters.minRating) return false;
      switch (filters.favoriteFilter) {
        case VentorFavoriteFilter.any:
          break;
        case VentorFavoriteFilter.favoritesOnly:
          if (!listener.isFavorite) return false;
        case VentorFavoriteFilter.notFavorites:
          if (listener.isFavorite) return false;
      }
      return true;
    }).toList();
  }

  static List<VentorSessionDurationOption> durationOptionsFor(
    VentorFindListener listener,
  ) {
    final allowed = listener.availability.sessionMinutes.toSet();
    final filtered = [
      for (final option in durationOptions)
        if (allowed.contains(option.minutes)) option,
    ];
    return filtered.isEmpty ? durationOptions : filtered;
  }

  static String dayIdForWeekday(int weekday) {
    return switch (weekday) {
      DateTime.monday => 'mon',
      DateTime.tuesday => 'tue',
      DateTime.wednesday => 'wed',
      DateTime.thursday => 'thu',
      DateTime.friday => 'fri',
      DateTime.saturday => 'sat',
      _ => 'sun',
    };
  }

  static int? parseHourLabelToMinutes(String label) {
    final parts = label.trim().split(RegExp(r'\s+'));
    if (parts.length < 2) return null;
    final clock = parts[0].split(':');
    if (clock.length < 2) return null;
    final hourRaw = int.tryParse(clock[0]);
    final minute = int.tryParse(clock[1]);
    if (hourRaw == null || minute == null) return null;
    final meridiem = parts[1].toUpperCase();
    var hour = hourRaw % 12;
    if (meridiem == 'PM') hour += 12;
    return hour * 60 + minute;
  }

  /// Upcoming start times inside the listener weekly availability window.
  static List<DateTime> availableSlots({
    required VentorListenerAvailability availability,
    required int durationMinutes,
    DateTime? from,
    int daysAhead = 14,
    int stepMinutes = 30,
  }) {
    final startMinutes = parseHourLabelToMinutes(availability.fromHour);
    final endMinutes = parseHourLabelToMinutes(availability.toHour);
    if (startMinutes == null || endMinutes == null) return const [];
    if (endMinutes - startMinutes < durationMinutes) return const [];

    final now = from ?? DateTime.now();
    final dayIds = availability.days.toSet();
    final slots = <DateTime>[];

    for (var dayOffset = 0; dayOffset < daysAhead; dayOffset++) {
      final day = DateTime(
        now.year,
        now.month,
        now.day,
      ).add(Duration(days: dayOffset));
      if (!dayIds.contains(dayIdForWeekday(day.weekday))) continue;

      for (
        var minuteOfDay = startMinutes;
        minuteOfDay + durationMinutes <= endMinutes;
        minuteOfDay += stepMinutes
      ) {
        final slot = DateTime(
          day.year,
          day.month,
          day.day,
          minuteOfDay ~/ 60,
          minuteOfDay % 60,
        );
        if (slot.isBefore(now.add(const Duration(minutes: 5)))) continue;
        slots.add(slot);
      }
    }
    return slots;
  }

  static DateTime? nearestSlot({
    required VentorListenerAvailability availability,
    required int durationMinutes,
  }) {
    final slots = availableSlots(
      availability: availability,
      durationMinutes: durationMinutes,
    );
    return slots.isEmpty ? null : slots.first;
  }

  static VentorFindListener? listenerById(String id) {
    for (final listener in mockListeners) {
      if (listener.id == id) return listener;
    }
    return null;
  }

  /// Best available listener for an instant match (online + accepts instant).
  static VentorFindListener? bestInstantListener() {
    final pool = mockListeners
        .where((l) => l.isOnline && l.availability.acceptInstantCall)
        .toList();
    if (pool.isEmpty) return null;

    pool.sort((a, b) {
      final byRating = b.rating.compareTo(a.rating);
      if (byRating != 0) return byRating;
      return b.sessionCount.compareTo(a.sessionCount);
    });
    return pool.first;
  }

  /// Nearest actionable session: live first, else soonest upcoming.
  static VentorBookedSession? nearestUpcomingSession({DateTime? now}) {
    final base = now ?? DateTime.now();
    final candidates = mockBookedSessions(now: base).where((s) {
      return s.status == VentorBookedSessionStatus.live ||
          s.status == VentorBookedSessionStatus.upcoming;
    }).toList();
    if (candidates.isEmpty) return null;

    candidates.sort((a, b) {
      int rank(VentorBookedSessionStatus status) => switch (status) {
        VentorBookedSessionStatus.live => 0,
        VentorBookedSessionStatus.upcoming => 1,
        _ => 2,
      };
      final byStatus = rank(a.status).compareTo(rank(b.status));
      if (byStatus != 0) return byStatus;
      final aTime = a.scheduledAt ?? base;
      final bTime = b.scheduledAt ?? base;
      return aTime.compareTo(bTime);
    });
    return candidates.first;
  }

  // TODO: Replace with booked sessions API.
  static List<VentorBookedSession> mockBookedSessions({DateTime? now}) {
    final base = now ?? DateTime.now();
    return [
      VentorBookedSession(
        id: 'b1',
        listenerId: 'lina',
        listenerName: 'Lina',
        listenerAvatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-lina',
        durationMinutes: 30,
        status: VentorBookedSessionStatus.upcoming,
        callMode: VentorBookedCallMode.voice,
        speechLanguage: 'English',
        amountPaid: 39,
        voiceChangeEnabled: true,
        scheduledAt: base.add(const Duration(hours: 2, minutes: 15)),
      ),
      VentorBookedSession(
        id: 'b2',
        listenerId: 'omar',
        listenerName: 'Omar',
        listenerAvatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-omar',
        durationMinutes: 45,
        status: VentorBookedSessionStatus.live,
        callMode: VentorBookedCallMode.video,
        speechLanguage: 'Arabic',
        amountPaid: 47.25,
        voiceChangeEnabled: false,
        isInstant: true,
        scheduledAt: base.subtract(const Duration(minutes: 5)),
      ),
      VentorBookedSession(
        id: 'b3',
        listenerId: 'sara',
        listenerName: 'Sara',
        listenerAvatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-sara',
        durationMinutes: 60,
        status: VentorBookedSessionStatus.upcoming,
        callMode: VentorBookedCallMode.voice,
        speechLanguage: 'English',
        amountPaid: 57,
        voiceChangeEnabled: false,
        scheduledAt: base.add(const Duration(days: 1, hours: 4)),
      ),
      VentorBookedSession(
        id: 'b4',
        listenerId: 'karim',
        listenerName: 'Karim',
        listenerAvatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-karim',
        durationMinutes: 30,
        status: VentorBookedSessionStatus.completed,
        callMode: VentorBookedCallMode.video,
        speechLanguage: 'French',
        amountPaid: 40.5,
        voiceChangeEnabled: false,
        scheduledAt: base.subtract(const Duration(days: 2, hours: 3)),
      ),
      VentorBookedSession(
        id: 'b5',
        listenerId: 'nour',
        listenerName: 'Nour',
        listenerAvatarUrl: 'https://i.pravatar.cc/240?u=ventor-find-nour',
        durationMinutes: 15,
        status: VentorBookedSessionStatus.cancelled,
        callMode: VentorBookedCallMode.voice,
        speechLanguage: 'Arabic',
        amountPaid: 12.75,
        voiceChangeEnabled: true,
        scheduledAt: base.subtract(const Duration(days: 1)),
        refundedToBalance: 12.75,
      ),
    ];
  }
}
