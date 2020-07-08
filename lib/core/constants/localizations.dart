import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/localizations/portal.dart';
import 'package:minitel_toolbox/core/constants/localizations/reporting.dart';

import 'l10n/messages_all.dart';
import 'localizations/about.dart';
import 'localizations/agenda.dart';
import 'localizations/news.dart';

class AppLoc {
  static const LocalizationsDelegate<AppLoc> delegate = AppLocDelegate();
  final String localeName;
  AppLoc(this.localeName);
  AboutLoc get about => AboutLoc(localeName);
  AgendaLoc get agenda => AgendaLoc(localeName);
  @Deprecated("Not used")
  String get forceDark => Intl.message(
        "Forcer le thème sombre",
        name: 'forceDark',
        locale: localeName,
      );
  NewsLoc get news => NewsLoc(localeName);

  PortalLoc get portal => PortalLoc(localeName);

  ReportingLoc get reporting => ReportingLoc(localeName);

  static Future<AppLoc> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      return AppLoc(localeName);
    });
  }

  static AppLoc of(BuildContext context) {
    return Localizations.of<AppLoc>(context, AppLoc);
  }
}

class AppLocDelegate extends LocalizationsDelegate<AppLoc> {
  const AppLocDelegate();

  @override
  bool isSupported(Locale locale) =>
      <String>['fr', 'en', 'it'].contains(locale.languageCode);

  @override
  Future<AppLoc> load(Locale locale) => AppLoc.load(locale);

  @override
  bool shouldReload(AppLocDelegate old) => false;
}
