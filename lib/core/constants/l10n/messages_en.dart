// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(enabled) => "${Intl.select(enabled, {'true': 'enabled.', 'false': 'disabled.', })}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "DiagnoseLoc_arpContent1" : MessageLookupByLibrary.simpleMessage("Displays the MAC addresses of all devices connected to the phone. The Gateway should be displayed and the MAC address should be 00-0d-b4-10-99-e1. If the MAC address of the gateway does not match that of the gateway, we are dealing with a fisonning ARP: \n"),
    "DiagnoseLoc_arpContent2" : MessageLookupByLibrary.simpleMessage("The gateway\'s IP thief responds to the ARP response sent by the victim on broadcast, faster than the gateway.\n\n"),
    "DiagnoseLoc_arpContent3" : MessageLookupByLibrary.simpleMessage("A temporary solution (only when WiFi is on) is:"),
    "DiagnoseLoc_header" : MessageLookupByLibrary.simpleMessage("Diagnosis"),
    "DiagnoseLoc_httpContent" : MessageLookupByLibrary.simpleMessage("If a 4xx or 5xx error appears, please report it to Minitel."),
    "DiagnoseLoc_ipaContent" : MessageLookupByLibrary.simpleMessage("Gives useful information about the hardware.\n\nUseful information:\n- Status\n- IP Address\n- MAC Address"),
    "DiagnoseLoc_nsLookupContent1" : MessageLookupByLibrary.simpleMessage("If there is no answer, but the DNS ping works, your device has a DNS cache problem.\n"),
    "DiagnoseLoc_nsLookupContent2" : MessageLookupByLibrary.simpleMessage("For portable devices, restart Wi-Fi.\nHere are some solutions:"),
    "DiagnoseLoc_pingDNSContent" : MessageLookupByLibrary.simpleMessage("If one of the DNS (except 10.163.0.6) answers, you are connected to the Internet."),
    "DiagnoseLoc_pingGatewayContent" : MessageLookupByLibrary.simpleMessage("The gateway normally ignores pings. However, if a ping is received, someone probably took his IP. But, nothing is certain."),
    "DiagnoseLoc_pingLoContent1" : MessageLookupByLibrary.simpleMessage("Vérifie si le logiciel TCP/IP fonctionne.\n"),
    "DiagnoseLoc_pingLoContent2" : MessageLookupByLibrary.simpleMessage("Should always be positive."),
    "DiagnoseLoc_pingLocalContent1" : MessageLookupByLibrary.simpleMessage("Ping to a local computer (10.163.0.5, which is the Minitel server and should always be on).\n\nIf the packets are lost, these are the most likely scenarios:\n    1.  You don\'t have an IP."),
    "DiagnoseLoc_pingLocalContent2" : MessageLookupByLibrary.simpleMessage(" (See ip a, and alert Minitel immediately)\n"),
    "DiagnoseLoc_pingLocalContent3" : MessageLookupByLibrary.simpleMessage("    2.  You are not connected to the local network.\n    3.  The server (10.163.0.5) is disconnected. (you can ping 10.163.0.10)\n    4.  A switch from the Student House is disconnected.\n    5.  A switch from the residence is disconnected."),
    "DiagnoseLoc_reactionContent" : MessageLookupByLibrary.simpleMessage("If there is no longer a network, contact Minitel and use the diagnostic suite on the \"Report to Minitel\" page"),
    "DiagnoseLoc_reactionHeader" : MessageLookupByLibrary.simpleMessage("How should I react?"),
    "DiagnoseLoc_tracerouteContent" : MessageLookupByLibrary.simpleMessage("Displays the path and delays of packets to a Google server.\nUseful to see the causes of lag."),
    "NotificationSettingsLoc_early1" : MessageLookupByLibrary.simpleMessage("Notify "),
    "NotificationSettingsLoc_early2" : MessageLookupByLibrary.simpleMessage(" minutes before the course."),
    "NotificationSettingsLoc_enabled1" : MessageLookupByLibrary.simpleMessage("The notifications are "),
    "NotificationSettingsLoc_enabled2" : m0,
    "NotificationSettingsLoc_range1" : MessageLookupByLibrary.simpleMessage("Notify the courses for the next "),
    "NotificationSettingsLoc_range2" : MessageLookupByLibrary.simpleMessage(" days."),
    "NotificationSettingsLoc_save" : MessageLookupByLibrary.simpleMessage("Save"),
    "NotificationSettingsLoc_title" : MessageLookupByLibrary.simpleMessage("Notification settings")
  };
}
