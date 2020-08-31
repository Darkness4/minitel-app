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

  static m0(enabled) => "${Intl.select(enabled, {
        'true': 'enabled.',
        'false': 'disabled.',
      })}";

  static m1(hours, minutes) => "${hours} hours and ${minutes} minutes left";

  static m2(minutes) => "${minutes} minutes left";

  static m3(seconds) => "${seconds} seconds left";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "AboutLoc_description": MessageLookupByLibrary.simpleMessage(
            "Minitel Toolbox includes the most useful tools to have a trouble-free WiFi."),
        "AboutLoc_developper":
            MessageLookupByLibrary.simpleMessage("Developer"),
        "AboutLoc_lastVestion":
            MessageLookupByLibrary.simpleMessage("Lastest version"),
        "AboutLoc_license": MessageLookupByLibrary.simpleMessage("License"),
        "AboutLoc_privacyPolicySubtitle": MessageLookupByLibrary.simpleMessage(
            "No data is shared and stored without your knowledge. The data collected is the data you provide us (diagnostic) and is never saved."),
        "AboutLoc_privacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "AboutLoc_title":
            MessageLookupByLibrary.simpleMessage("About Minitel Toolbox"),
        "AboutLoc_website": MessageLookupByLibrary.simpleMessage("Website"),
        "AgendaLoc_emptyAgenda0":
            MessageLookupByLibrary.simpleMessage("Well ? No class ?"),
        "AgendaLoc_emptyAgenda1":
            MessageLookupByLibrary.simpleMessage("\'smells like a barbecue..."),
        "AgendaLoc_emptyAgenda2":
            MessageLookupByLibrary.simpleMessage("Freeedom !"),
        "AgendaLoc_emptyAgenda3":
            MessageLookupByLibrary.simpleMessage("Lucky m8 !"),
        "AgendaLoc_emptyAgenda4": MessageLookupByLibrary.simpleMessage(
            "Spend more time with the family!\n(instead of watching the next classes)"),
        "AgendaLoc_emptyAgenda5": MessageLookupByLibrary.simpleMessage(
            "The application has more than 10,000 lines of code...\n\n(with 40,000 additions and 30,000 deletions)"),
        "AgendaLoc_emptyAgenda6": MessageLookupByLibrary.simpleMessage(
            "The application is developed with Flutter and ❤️"),
        "AgendaLoc_emptyAgenda7":
            MessageLookupByLibrary.simpleMessage("Minitel is the best!"),
        "AgendaLoc_emptyAgenda8":
            MessageLookupByLibrary.simpleMessage("Freeeeeeedom !"),
        "AgendaLoc_emptyAgenda9":
            MessageLookupByLibrary.simpleMessage("The sad panda sit alone."),
        "AgendaLoc_title": MessageLookupByLibrary.simpleMessage("Calendar"),
        "AppListLoc_portal": MessageLookupByLibrary.simpleMessage("Portal"),
        "AppListLoc_printer": MessageLookupByLibrary.simpleMessage("Printer"),
        "NewsLoc_seeTwitter":
            MessageLookupByLibrary.simpleMessage("See on Twitter ..."),
        "NewsLoc_title": MessageLookupByLibrary.simpleMessage("News"),
        "NotificationSettingsLoc_early1":
            MessageLookupByLibrary.simpleMessage("Notify "),
        "NotificationSettingsLoc_early2":
            MessageLookupByLibrary.simpleMessage(" minutes before the course."),
        "NotificationSettingsLoc_enabled1":
            MessageLookupByLibrary.simpleMessage("The notifications are "),
        "NotificationSettingsLoc_enabled2": m0,
        "NotificationSettingsLoc_range1": MessageLookupByLibrary.simpleMessage(
            "Notify the courses for the next "),
        "NotificationSettingsLoc_range2":
            MessageLookupByLibrary.simpleMessage(" days."),
        "NotificationSettingsLoc_save":
            MessageLookupByLibrary.simpleMessage("Save"),
        "NotificationSettingsLoc_title":
            MessageLookupByLibrary.simpleMessage("Notification settings"),
        "PortalLoc_authTime":
            MessageLookupByLibrary.simpleMessage("Authentication time "),
        "PortalLoc_autoLogin":
            MessageLookupByLibrary.simpleMessage("Login automatically"),
        "PortalLoc_domainNameHeader":
            MessageLookupByLibrary.simpleMessage("Domain name / IP "),
        "PortalLoc_login": MessageLookupByLibrary.simpleMessage("Login"),
        "PortalLoc_password": MessageLookupByLibrary.simpleMessage("Password"),
        "PortalLoc_rememberMe":
            MessageLookupByLibrary.simpleMessage("Remember me "),
        "PortalLoc_statusInHM": m1,
        "PortalLoc_statusInMinutes": m2,
        "PortalLoc_statusInSeconds": m3,
        "PortalLoc_title":
            MessageLookupByLibrary.simpleMessage("Authentication"),
        "PortalLoc_usernameHint":
            MessageLookupByLibrary.simpleMessage("firstname.lastname"),
        "PortalLoc_usernameLabel":
            MessageLookupByLibrary.simpleMessage("Username"),
        "ReportingLoc_chamberHint":
            MessageLookupByLibrary.simpleMessage("Room number"),
        "ReportingLoc_chamberLabel":
            MessageLookupByLibrary.simpleMessage("Room"),
        "ReportingLoc_idHint":
            MessageLookupByLibrary.simpleMessage("Last name First name"),
        "ReportingLoc_idLabel":
            MessageLookupByLibrary.simpleMessage("Identity"),
        "ReportingLoc_isNotValidUid": MessageLookupByLibrary.simpleMessage(
            "The username must be in the format \'firstname.lastname\'."),
        "ReportingLoc_mustOnlyBeNumbers":
            MessageLookupByLibrary.simpleMessage("Must only contain numbers."),
        "ReportingLoc_notEmpty":
            MessageLookupByLibrary.simpleMessage("Must not be empty"),
        "ReportingLoc_share": MessageLookupByLibrary.simpleMessage("Share"),
        "ReportingLoc_slack":
            MessageLookupByLibrary.simpleMessage("Notify on Slack"),
        "ReportingLoc_title":
            MessageLookupByLibrary.simpleMessage("Report to Minitel"),
        "ReportingLoc_titleHint": MessageLookupByLibrary.simpleMessage(
            "I don\'t have internet anymore!"),
        "ReportingLoc_titleLabel":
            MessageLookupByLibrary.simpleMessage("Title"),
        "TutorialLoc_content1": MessageLookupByLibrary.simpleMessage(
            "1. Log in to \'WiFi Minitel\'."),
        "TutorialLoc_content2": MessageLookupByLibrary.simpleMessage(
            "2. Start the diagnostic sequence by pressing the button, and wait 1 minute."),
        "TutorialLoc_content3": MessageLookupByLibrary.simpleMessage(
            "3. Fill out your report. Do not forget a means of communication (room, mail, messenger...)"),
        "TutorialLoc_content4": MessageLookupByLibrary.simpleMessage(
            "4. Connect to a network where there is Internet."),
        "TutorialLoc_content5":
            MessageLookupByLibrary.simpleMessage("5. Send the report."),
        "TutorialLoc_example": MessageLookupByLibrary.simpleMessage(
            "Example: \nTitle: Not Internet since Monday. \nDescription: I frequently lose the connection when I\'m on Ethernet. Wifi is okay."),
        "TutorialLoc_header": MessageLookupByLibrary.simpleMessage(
            "How to report without the Internet?"),
        "TutorialLoc_notice": MessageLookupByLibrary.simpleMessage(
            "NOTE: It is recommended to install the Root and Busybox."),
        "forceDark": MessageLookupByLibrary.simpleMessage("Force Dark Theme")
      };
}
