// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "sentenceDocDiagnoseARP" : MessageLookupByLibrary.simpleMessage("    Displays the MAC addresses of all devices that have connected to the phone."),
    "sentenceDocDiagnoseHTTP1" : MessageLookupByLibrary.simpleMessage("HTTP GET https://172.17.0.1/auth/\nIt should display the same result as \"Gateway Login Status\".\n\n    OS Error are mostly caused if the phone cannot connect to the gateway 172.17.0.1."),
    "sentenceDocDiagnoseHTTP2" : MessageLookupByLibrary.simpleMessage("    If a 4xx error occurs, please report it to the developers."),
    "sentenceDocDiagnoseHTTP3" : MessageLookupByLibrary.simpleMessage("    If you have an OS error, the Gateway has a problem and you should report it to the DSI."),
    "sentenceDocDiagnoseHTTP4" : MessageLookupByLibrary.simpleMessage("    If you have a 4xx HTTP error, the diagnostic tool has a problem and you should report it to the developpers."),
    "sentenceDocDiagnoseHTTP5" : MessageLookupByLibrary.simpleMessage("    If you have a 5xx HTTP error, the Gateway has a problem  and you should report it to the DSI."),
    "sentenceDocDiagnoseHTTP6" : MessageLookupByLibrary.simpleMessage("    A share button exists to send 90% of the needed informations for a full repair.\n    On 172.17.0.10, you can report to the admins."),
    "sentenceDocDiagnoseNSLookup1" : MessageLookupByLibrary.simpleMessage("    If there is no answer in one of them, but the DNS ping worked, your computer probably has a DNS cache problem."),
    "sentenceDocDiagnoseNSLookup2" : MessageLookupByLibrary.simpleMessage("    These are the best fixes:"),
    "sentenceDocDiagnoseNSLookup3" : MessageLookupByLibrary.simpleMessage("    For portable devices, restart the Wifi."),
    "sentenceDocDiagnoseNetstat" : MessageLookupByLibrary.simpleMessage("    Shows statistics about TCP connections."),
    "sentenceDocDiagnosePerm" : MessageLookupByLibrary.simpleMessage("    Indicates whether you have authorized GPS to determine the SSID."),
    "sentenceDocDiagnosePingDNS" : MessageLookupByLibrary.simpleMessage("    If one of the DNS (besides 172.17.0.6) responds, you are connected to the internet."),
    "sentenceDocDiagnosePingGateway" : MessageLookupByLibrary.simpleMessage("    This information does nothing. The gateway ignores pings. However, if a ping is received, someone is probably taking his IP. But none of this is certain."),
    "sentenceDocDiagnosePingLo" : MessageLookupByLibrary.simpleMessage("    Verify if the TCP/IP software works. Should be always positive."),
    "sentenceDocDiagnosePingLocal1" : MessageLookupByLibrary.simpleMessage("    Ping to a local computer (172.17.0.5, which is the Minitel Server and should be always on).\n\n    If the packets are lost, these are the most possible scenarios:\n"),
    "sentenceDocDiagnosePingLocal2" : MessageLookupByLibrary.simpleMessage("    1.  You have no IP."),
    "sentenceDocDiagnosePingLocal3" : MessageLookupByLibrary.simpleMessage(" (Report this immediatly to Minitel)\n"),
    "sentenceDocDiagnosePingLocal4" : MessageLookupByLibrary.simpleMessage("    2.  You are not connected to the local Network.\n    3.  The server (172.17.0.5) has been shutdown. (you can ping 172.17.0.1, 172.17.0.10)\n"),
    "sentenceDocDiagnoseTraceroute" : MessageLookupByLibrary.simpleMessage("    Show the path and the delays of packets to a Google server."),
    "sentenceDocDiagnoseifconfig" : MessageLookupByLibrary.simpleMessage("    Gives useful information about the hardware.\n\n    Useful informations:\n      - Status\n      - IP Address\n      - MAC Address\n"),
    "sentenceDocLogin1" : MessageLookupByLibrary.simpleMessage("Choose between fw-cgcp.emse.fr and 172.17.0.1\n"),
    "sentenceDocLogin2" : MessageLookupByLibrary.simpleMessage("If your local network is WiFi MINITEL, use 172.17.0.1.\nOtherwise, you can try fw-cgcp.emse.fr."),
    "sentenceNotConnected" : MessageLookupByLibrary.simpleMessage("Not connected to Wifi nor Mobile."),
    "title" : MessageLookupByLibrary.simpleMessage("Minitel Toolbox"),
    "titleCalendarPage" : MessageLookupByLibrary.simpleMessage("Calendar"),
    "titleDiagnosePage" : MessageLookupByLibrary.simpleMessage("Diagnosis"),
    "titleDocumentationPage" : MessageLookupByLibrary.simpleMessage("Documentation"),
    "titleHowShouldIReact" : MessageLookupByLibrary.simpleMessage("How should i react?"),
    "titleLoginPage" : MessageLookupByLibrary.simpleMessage("Gateway Login"),
    "titleNewsPage" : MessageLookupByLibrary.simpleMessage("News"),
    "verbDiagnose" : MessageLookupByLibrary.simpleMessage("Diagnose"),
    "wordDomain" : MessageLookupByLibrary.simpleMessage("Domain Name"),
    "wordHour" : MessageLookupByLibrary.simpleMessage("hour"),
    "wordPassword" : MessageLookupByLibrary.simpleMessage("Password"),
    "wordSurnameName" : MessageLookupByLibrary.simpleMessage("Surname.Name"),
    "wordUsername" : MessageLookupByLibrary.simpleMessage("Username"),
    "wordsAuthDuration" : MessageLookupByLibrary.simpleMessage("Authentication duration ")
  };
}
