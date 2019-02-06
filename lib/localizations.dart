import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'l10n/messages_all.dart';

class AppLoc {
  static Future<AppLoc> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLoc();
    });
  }

  static AppLoc of(BuildContext context) {
    return Localizations.of<AppLoc>(context, AppLoc);
  }

  // app and components/drawer
  String get title => Intl.message('Minitel Toolbox',
      name: 'title', desc: 'The application title');

  String get titleLoginPage => Intl.message('Gateway Login',
      name: 'titleLoginPage', desc: 'The LoginPage title');

  String get titleDiagnosePage => Intl.message('Diagnosis',
      name: 'titleDiagnosePage', desc: 'The DiagnosePage title');

  String get titleDocumentationPage => Intl.message('Documentation',
      name: 'titleDocumentationPage', desc: 'The DocumentationPage title');

  String get titleNewsPage =>
      Intl.message('News', name: 'titleNewsPage', desc: 'The NewsPage title');

  String get titleCalendarPage => Intl.message('Calendar',
      name: 'titleCalendarPage', desc: 'The CalendarPage title');

  // pages/diagnose
  String get verbDiagnose => Intl.message('Diagnose', name: 'verbDiagnose');

  String get sentenceNotConnected =>
      Intl.message('Not connected to Wifi nor Mobile.',
          name: 'sentenceNotConnected');

  // pages/login
  String get wordHour => Intl.message('hour', name: 'wordHour');

  String get wordSurnameName =>
      Intl.message('Surname.Name', name: 'wordSurnameName');

  String get wordUsername => Intl.message('Username', name: 'wordUsername');

  String get wordPassword => Intl.message('Password', name: 'wordPassword');

  String get wordsAuthDuration =>
      Intl.message("Authentication duration ", name: 'wordsAuthDuration');

  String get wordDomain => Intl.message("Domain Name", name: 'wordDomain');
}

class AppLocDelegate extends LocalizationsDelegate<AppLoc> {
  const AppLocDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<AppLoc> load(Locale locale) => AppLoc.load(locale);

  @override
  bool shouldReload(AppLocDelegate old) => false;
}
