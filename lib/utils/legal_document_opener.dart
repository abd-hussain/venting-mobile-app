import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:venting_mobile_app/config/app_config.dart';
import 'package:venting_mobile_app/di/di_container.dart';
import 'package:venting_mobile_app/l10n/venting_mob_localizations_holder.dart';
import 'package:venting_mobile_app/shared_widgets/app_webview_screen.dart';
import 'package:venting_mobile_app/utils/router_config.dart';
import 'package:venting_mobile_app/utils/static_web_content.dart';

/// Opens Terms or Privacy from static web content.
Future<void> openLegalDocument(
  BuildContext context, {
  required LegalDocumentKind kind,
  required String title,
  bool useGoRouter = true,
}) async {
  final page = switch (kind) {
    LegalDocumentKind.terms => StaticWebPage.terms,
    LegalDocumentKind.privacy => StaticWebPage.privacy,
  };
  final url = StaticWebContent.url(
    baseUrl: diContainer<AppConfig>().webContentBaseUrl,
    page: page,
    languageCode: VentingMobLocalizationsHolder.currentLanguageCode,
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
