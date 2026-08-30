import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/shared_widgets/app_webview_screen.dart';
import 'package:venting_mobile_app/utils/router_config.dart';
import 'package:venting_mobile_app/utils/static_web_content.dart';

/// Opens a Help Center topic from static web content.
Future<void> openHelpTopic(
  BuildContext context, {
  required HelpTopicKind topic,
  required String title,
  bool useGoRouter = true,
}) async {
  final url = StaticWebContent.url(
    baseUrl: diContainer<AppConfig>().webContentBaseUrl,
    page: StaticWebPage.help,
    languageCode: VentingMobLocalizationsHolder.currentLanguageCode,
    fragment: topic.fragment,
  );
  if (!context.mounted) return;

  if (useGoRouter) {
    await context.push(
      AppRoutes.webView,
      extra: AppWebViewArgs(title: title, url: url),
    );
    return;
  }

  await Navigator.of(context).push<void>(
    MaterialPageRoute(
      builder: (_) => AppWebViewScreen(title: title, url: url),
    ),
  );
}
