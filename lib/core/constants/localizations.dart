import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';
import 'localizations/agenda.dart';
import 'localizations/docs.dart';

class AppLoc {
  static const LocalizationsDelegate<AppLoc> delegate = AppLocDelegate();
  final String localeName;
  final AgendaLoc agenda;

  final DocsLoc docs;

  AppLoc(this.localeName)
      : agenda = AgendaLoc(localeName),
        docs = DocsLoc(localeName);

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
      <String>['fr', 'en'].contains(locale.languageCode);

  @override
  Future<AppLoc> load(Locale locale) => AppLoc.load(locale);

  @override
  bool shouldReload(AppLocDelegate old) => false;
}
