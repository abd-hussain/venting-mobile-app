enum StaticWebPage { terms, privacy, help }

/// Maps help UI tiles / about links to anchors on the static help page.
enum HelpTopicKind {
  gettingStarted('getting-started'),
  managingSessions('managing-sessions'),
  earningsPayouts('earnings-payouts'),
  accountProfile('account-profile'),
  safetyBoundaries('safety-boundaries'),
  communityGuidelines('community-guidelines'),
  faqs('faqs'),
  appTechnical('app-technical'),
  licenses('licenses');

  const HelpTopicKind(this.fragment);
  final String fragment;
}

enum LegalDocumentKind { terms, privacy }

abstract final class StaticWebContent {
  static String url({
    required String baseUrl,
    required StaticWebPage page,
    required String languageCode,
    String? fragment,
  }) {
    final locale = languageCode.toLowerCase().startsWith('ar') ? 'ar' : 'en';
    final base = baseUrl.replaceAll(RegExp(r'/+$'), '');
    final path = switch (page) {
      StaticWebPage.terms => 'legal/$locale/terms.html',
      StaticWebPage.privacy => 'legal/$locale/privacy.html',
      StaticWebPage.help => 'help/$locale/index.html',
    };
    final url = '$base/$path';
    if (fragment == null || fragment.isEmpty) return url;
    return '$url#$fragment';
  }
}
