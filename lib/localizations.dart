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

  String get titleReportingPage => Intl.message('Report to Minitel',
      name: 'titleReportingPage', desc: 'The ReportingPage title');

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

  String get titleMapsPage =>  Intl.message('Map',
      name: 'titleMapsPage', desc: 'The MapsPage title');

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

// Documentation
  String get sentenceDocLogin1 =>
      Intl.message("Choose between fw-cgcp.emse.fr and 172.17.0.1\n",
          name: 'sentenceDocLogin1');

  String get sentenceDocLogin2 =>
      Intl.message(
          "If your local network is WiFi MINITEL, use 172.17.0.1.\n"
              "Otherwise, you can try fw-cgcp.emse.fr.",
          name: 'sentenceDocLogin2');

  String get sentenceDocDiagnosePerm =>
      Intl.message(
          "    Indicates whether you have authorized GPS to determine the SSID.",
          name: 'sentenceDocDiagnosePerm');

  String get sentenceDocDiagnosePingLo =>
      Intl.message(
          "    Verify if the TCP/IP software works. Should be always positive.",
          name: 'sentenceDocDiagnosePingLo');

  String get sentenceDocDiagnosePingLocal1 =>
      Intl.message(
          "    Ping to a local computer (172.17.0.5, which is the Minitel Server and should be always on).\n\n"
              "    If the packets are lost, these are the most possible scenarios:\n",
          name: 'sentenceDocDiagnosePingLocal1');

  String get sentenceDocDiagnosePingLocal2 =>
      Intl.message("    1.  You have no IP.",
          name: 'sentenceDocDiagnosePingLocal2');

  String get sentenceDocDiagnosePingLocal3 =>
      Intl.message(" (Report this immediatly to Minitel)\n",
          name: 'sentenceDocDiagnosePingLocal3');

  String get sentenceDocDiagnosePingLocal4 =>
      Intl.message(
          "    2.  You are not connected to the local Network.\n"
              "    3.  The server (172.17.0.5) has been shutdown. (you can ping 172.17.0.1, 172.17.0.10)\n",
          name: 'sentenceDocDiagnosePingLocal4');

  String get sentenceDocDiagnoseHTTP1 =>
      Intl.message(
          "HTTP GET https://172.17.0.1/auth/\nIt should display the same result as \"Gateway Login Status\".\n\n"
              "    OS Error are mostly caused if the phone cannot connect to the gateway 172.17.0.1.",
          name: 'sentenceDocDiagnoseHTTP1');

  String get sentenceDocDiagnoseHTTP2 =>
      Intl.message(
          "    If a 4xx error occurs, please report it to the developers.",
          name: 'sentenceDocDiagnoseHTTP2');

  String get sentenceDocDiagnoseHTTP3 =>
      Intl.message(
          "    If you have an OS error, the Gateway has a problem and you should report it to the DSI.",
          name: 'sentenceDocDiagnoseHTTP3');

  String get sentenceDocDiagnoseHTTP4 =>
      Intl.message(
          "    If you have a 4xx HTTP error, the diagnostic tool has a problem and you should report it to the developpers.",
          name: 'sentenceDocDiagnoseHTTP4');

  String get sentenceDocDiagnoseHTTP5 =>
      Intl.message(
          "    If you have a 5xx HTTP error, the Gateway has a problem  and you should report it to the DSI.",
          name: 'sentenceDocDiagnoseHTTP5');

  String get sentenceDocDiagnoseHTTP6 =>
      Intl.message(
          "    A share button exists to send 90% of the needed informations for a full repair.\n"
              "    On 172.17.0.10, you can report to the admins.",
          name: 'sentenceDocDiagnoseHTTP6');

  String get titleHowShouldIReact =>
      Intl.message("How should i react?", name: 'titleHowShouldIReact');

  String get sentenceDocDiagnosePingGateway =>
      Intl.message(
          "    This information does nothing. The gateway ignores pings. However, if a ping is received, someone is probably taking his IP. But none of this is certain.",
          name: 'sentenceDocDiagnosePingGateway');

  String get sentenceDocDiagnosePingDNS =>
      Intl.message(
          "    If one of the DNS (besides 172.17.0.6) responds, you are connected to the internet.",
          name: 'sentenceDocDiagnosePingDNS');

  String get sentenceDocDiagnoseNSLookup1 =>
      Intl.message(
          "    If there is no answer in one of them, but the DNS ping worked, your computer probably has a DNS cache problem.",
          name: 'sentenceDocDiagnoseNSLookup1');

  String get sentenceDocDiagnoseNSLookup2 =>
      Intl.message("    These are the best fixes:",
          name: 'sentenceDocDiagnoseNSLookup2');

  String get sentenceDocDiagnoseNSLookup3 =>
      Intl.message("    For portable devices, restart the Wifi.",
          name: 'sentenceDocDiagnoseNSLookup3');

  String get sentenceDocDiagnoseifconfig =>
      Intl.message(
          "    Gives useful information about the hardware.\n\n"
              "    Useful informations:\n"
              "      - Status\n"
              "      - IP Address\n"
              "      - MAC Address\n",
          name: 'sentenceDocDiagnoseifconfig');

  String get sentenceDocDiagnoseARP =>
      Intl.message(
          "    Displays the MAC addresses of all devices that have connected to the phone.",
          name: 'sentenceDocDiagnoseARP');

  String get sentenceDocDiagnoseTraceroute =>
      Intl.message(
          "    Show the path and the delays of packets to a Google server.",
          name: 'sentenceDocDiagnoseTraceroute');

  String get sentenceDocDiagnoseNetstat =>
      Intl.message("    Shows statistics about TCP connections.",
          name: 'sentenceDocDiagnoseNetstat');
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
