import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:venting_mobile_app/domain/data/api/listener_privacy_response_model.dart';

class ListenerPrivacyVisibilitySettings {
  const ListenerPrivacyVisibilitySettings({
    this.profileVisible = true,
    this.showOnlineStatus = true,
    this.visibleInAllCountries = true,
    this.visibleCountries = const {},
    this.allowSearchIndexing = true,
  });

  final bool profileVisible;
  final bool showOnlineStatus;
  final bool visibleInAllCountries;
  final Set<IsoCode> visibleCountries;
  final bool allowSearchIndexing;

  ListenerPrivacyVisibilitySettings copyWith({
    bool? profileVisible,
    bool? showOnlineStatus,
    bool? visibleInAllCountries,
    Set<IsoCode>? visibleCountries,
    bool? allowSearchIndexing,
  }) {
    return ListenerPrivacyVisibilitySettings(
      profileVisible: profileVisible ?? this.profileVisible,
      showOnlineStatus: showOnlineStatus ?? this.showOnlineStatus,
      visibleInAllCountries:
          visibleInAllCountries ?? this.visibleInAllCountries,
      visibleCountries: visibleCountries ?? this.visibleCountries,
      allowSearchIndexing: allowSearchIndexing ?? this.allowSearchIndexing,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ListenerPrivacyVisibilitySettings &&
        other.profileVisible == profileVisible &&
        other.showOnlineStatus == showOnlineStatus &&
        other.visibleInAllCountries == visibleInAllCountries &&
        _sameCountries(other.visibleCountries, visibleCountries) &&
        other.allowSearchIndexing == allowSearchIndexing;
  }

  static bool _sameCountries(Set<IsoCode> a, Set<IsoCode> b) {
    if (a.length != b.length) return false;
    return a.containsAll(b);
  }

  @override
  int get hashCode => Object.hash(
    profileVisible,
    showOnlineStatus,
    visibleInAllCountries,
    Object.hashAllUnordered(visibleCountries),
    allowSearchIndexing,
  );
}

ListenerPrivacyVisibilitySettings listenerPrivacySettingsFromApi(
  ListenerPrivacyData data,
) {
  final countries = <IsoCode>{};
  for (final code in data.visible_countries) {
    final parsed = _parseIsoCode(code);
    if (parsed != null) countries.add(parsed);
  }

  return ListenerPrivacyVisibilitySettings(
    profileVisible: data.profile_visible,
    showOnlineStatus: data.show_online_status,
    visibleInAllCountries: data.visible_in_all_countries,
    visibleCountries: countries,
    allowSearchIndexing: data.allow_search_indexing,
  );
}

Map<String, dynamic> listenerPrivacySettingsToApiBody(
  ListenerPrivacyVisibilitySettings settings,
) {
  return {
    'profile_visible': settings.profileVisible,
    'show_online_status': settings.showOnlineStatus,
    'visible_in_all_countries': settings.visibleInAllCountries,
    'visible_countries': settings.visibleCountries
        .map((code) => code.name)
        .toList()
      ..sort(),
    'allow_search_indexing': settings.allowSearchIndexing,
  };
}

IsoCode? _parseIsoCode(String raw) {
  final normalized = raw.trim().toUpperCase();
  if (normalized.isEmpty) return null;
  try {
    return IsoCode.values.byName(normalized);
  } on Object {
    return null;
  }
}
