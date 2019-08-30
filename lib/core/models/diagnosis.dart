import 'package:flutter/material.dart';

class Diagnosis extends Iterable<DiagnosisItem> {
  String alert;

  final DiagnosisItem ip = DiagnosisItem(title: "IP");
  final DiagnosisItem ipAddr = DiagnosisItem(title: "ip addr");
  final DiagnosisItem arp =
      DiagnosisItem(title: "Address Resolution Protocol (SU + Busy)");
  final DiagnosisItem tracertGoogle =
      DiagnosisItem(title: "Traceroute Google (Superuser)");
  final DiagnosisItem tracertGoogleDNS =
      DiagnosisItem(title: "Traceroute Google DNS (Superuser)");
  final DiagnosisItem pingLo = DiagnosisItem(title: "Ping Loopback");
  final DiagnosisItem pingLocal = DiagnosisItem(title: "Ping Local");
  final DiagnosisItem pingGate = DiagnosisItem(title: "Ping Gateway");
  final DiagnosisItem pingDNS1 = DiagnosisItem(title: "Ping DNS 1");
  final DiagnosisItem pingDNS2 = DiagnosisItem(title: "Ping DNS 2");
  final DiagnosisItem pingDNS3 = DiagnosisItem(title: "Ping DNS 3");
  final DiagnosisItem pingDNS4 = DiagnosisItem(title: "Ping DNS 4");
  final DiagnosisItem pingDNS5 = DiagnosisItem(title: "Ping DNS 5");
  final DiagnosisItem nsLookupEMSE = DiagnosisItem(title: "NSLookup EMSE");
  final DiagnosisItem nsLookupEMSEBusy =
      DiagnosisItem(title: "NSLookup EMSE (SU + Busy)");
  final DiagnosisItem nsLookupGoogle = DiagnosisItem(title: "NSLookup Google");
  final DiagnosisItem nsLookupGoogleBusy =
      DiagnosisItem(title: "NSLookup Google (SU + Busy)");
  final DiagnosisItem httpPortalPublic =
      DiagnosisItem(title: "HTTP Portal Response Public");
  final DiagnosisItem httpPortalGateway =
      DiagnosisItem(title: "HTTP Portal Response Gateway");

  @override
  Iterator<DiagnosisItem> get iterator => <DiagnosisItem>[
        ip,
        ipAddr,
        arp,
        tracertGoogle,
        tracertGoogleDNS,
        pingLo,
        pingLocal,
        pingGate,
        pingDNS1,
        pingDNS2,
        pingDNS3,
        pingDNS4,
        pingDNS5,
        nsLookupEMSE,
        nsLookupEMSEBusy,
        nsLookupGoogle,
        nsLookupGoogleBusy,
        httpPortalPublic,
        httpPortalGateway,
      ].iterator;

  Future<String> toStringAsync() async {
    final StringBuffer buffer = StringBuffer();
    for (final DiagnosisItem item in this) {
      buffer.write("---${item.title}---\n"
          "${await item.content}\n"
          "---END ${item.title}---\n\n");
    }
    return buffer.toString();
  }

  Future<Map<String, String>> toMapAsync() async {
    final Map<String, String> data = <String, String>{};
    for (final DiagnosisItem item in this) {
      data[item.title] = await item.content;
    }
    return data;
  }
}

/// Content of the report after a diagnosis.
class DiagnosisItem {
  final String title;
  Future<String> content;

  DiagnosisItem({
    @required this.title,
    this.content,
  });
}
