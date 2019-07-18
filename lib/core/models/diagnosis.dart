import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_gateway.dart';
import 'package:permission_handler/permission_handler.dart';

/// This stores all diagnosis results.
///
/// To obtain the report, simply use:
/// ```
/// Diagnosis diagnosis;
/// diagnosis.report["name"];
/// ```
///
/// By default, everything is [null].
/// All data can be initialized to "" using `diagnosis.onInit()`.
///
/// To generates all the data : `diagnosis.diagnose()`
///
/// The data is generated asynchronously. The process times out after one minute.
class Diagnosis {
  Map<String, String> _report = {
    "alert": "",
    DiagnosisContent.httpPortalPublic: "",
    DiagnosisContent.httpPortalGateway: "",
    DiagnosisContent.ssid: "",
    DiagnosisContent.ip: "",
    DiagnosisContent.ipAddr: "",
    DiagnosisContent.ifconfigAll: "",
    DiagnosisContent.arp: "",
    DiagnosisContent.tracertGoogle: "",
    DiagnosisContent.tracertGoogleDNS: "",
    DiagnosisContent.pingLo: "",
    DiagnosisContent.pingLocal: "",
    DiagnosisContent.pingGate: "",
    DiagnosisContent.pingDNS1: "",
    DiagnosisContent.pingDNS2: "",
    DiagnosisContent.pingDNS3: "",
    DiagnosisContent.pingDNS4: "",
    DiagnosisContent.pingDNS5: "",
    DiagnosisContent.nsLookupEMSE: "",
    DiagnosisContent.nsLookupEMSEBusy: "",
    DiagnosisContent.nsLookupGoogle: "",
    DiagnosisContent.nsLookupGoogleBusy: "",
  };

  Map<String, String> get report => _report;

  /// Run a report suite with a 1 minute time out.
  ///
  /// Run multiples command and store into the [report] Map.
  /// The suite is composed of :
  /// - SSID, IP scan from [Connectivity]
  /// - ip a
  /// - ifconfig -a
  /// - Address Resolution Protocol (Busybox) -a
  /// - su -c tracerout google.com and 8.8.8.8
  /// - ping loopback, 10.163.0.5 (DHCP), 10.163.0.2 (Gateway),
  /// 192.168.130.33 (School DNS), 192.168.130.3 (School DNS),
  /// 1.1.1.1 (Cloudflare DNS), 8.8.8.8 (Google DNS), 10.163.0.6 (Private DNS).
  /// - nslookup google.com and fw-cgcp.emse.fr (with and without Busybox).
  /// If the report takes too much time, the function return any given
  /// informations after one minute.
  Future<String> diagnose(BuildContext context) async {
    var diagnosis = "";
    const argsPing = "-c 4 -w 5 -W 5";

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String ssid;
      PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location)
          .then((answer) {
        if (answer == PermissionStatus.granted)
          Connectivity().getWifiName().then((output) => ssid = output);
        else
          PermissionHandler().requestPermissions([PermissionGroup.location]);
      });
      var ip = await Connectivity().getWifiIP();

      _report[DiagnosisContent.ssid] = ssid;
      _report[DiagnosisContent.ip] = ip;

      await Future.wait([
        exec("ip", ['a']).runGetOutput().then((out) =>
            _report[DiagnosisContent.ipAddr] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ifconfig", ['-a']).runGetOutput().then((out) =>
            _report[DiagnosisContent.ifconfigAll] =
                out.isEmpty ? "Nothing to show" : out),
        exec("arp", ['-a'])
            .runGetOutput()
            .then((out) => _report[DiagnosisContent.arp] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError(
                (out) => _report[DiagnosisContent.arp] = out.toString()),
        exec("su", [
          '-c',
          'traceroute',
          'google.com',
        ])
            .runGetOutput()
            .then((out) => _report[DiagnosisContent.tracertGoogle] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError((out) =>
                _report[DiagnosisContent.tracertGoogle] = out.toString()),
        exec("su", [
          '-c',
          'traceroute',
          '8.8.8.8',
        ])
            .runGetOutput()
            .then((out) => _report[DiagnosisContent.tracertGoogleDNS] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError((out) =>
                _report[DiagnosisContent.tracertGoogleDNS] = out.toString()),
        exec("ping", [argsPing, "127.0.0.1"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingLo] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.5"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingLocal] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.2"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingGate] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "192.168.130.33"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingDNS1] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "192.168.130.3"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingDNS2] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "8.8.8.8"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingDNS3] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "1.1.1.1"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingDNS4] =
                out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.6"]).runGetOutput().then((out) =>
            _report[DiagnosisContent.pingDNS5] =
                out.isEmpty ? "Nothing to show" : out),
        exec("nslookup", ["fw-cgcp.emse.fr"])
            .runGetOutput()
            .then((out) => _report[DiagnosisContent.nsLookupEMSEBusy] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError((out) =>
                _report[DiagnosisContent.nsLookupEMSEBusy] = out.toString()),
        exec("nslookup", ["google.com"])
            .runGetOutput()
            .then((out) => _report[DiagnosisContent.nsLookupGoogleBusy] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError((out) =>
                _report[DiagnosisContent.nsLookupGoogleBusy] = out.toString()),
        getStatus("195.83.139.7").then((status) =>
            _report[DiagnosisContent.httpPortalPublic] =
                status.isEmpty ? "Nothing to show" : status),
        getStatus("10.163.0.2").then((status) =>
            _report[DiagnosisContent.httpPortalGateway] =
                status.isEmpty ? "Nothing to show" : status),
        InternetAddress.lookup("fw-cgcp.emse.fr")
            .then((addresses) => addresses.forEach((address) =>
                _report[DiagnosisContent.nsLookupEMSE] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError(
                (e) => _report[DiagnosisContent.nsLookupEMSE] = e.toString()),
        InternetAddress.lookup("google.com")
            .then((addresses) => addresses.forEach((address) =>
                _report[DiagnosisContent.nsLookupGoogle] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError(
                (e) => _report[DiagnosisContent.nsLookupGoogle] = e.toString()),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        _report["alert"] = "Diagnosis has timed out !";
      });

      diagnosis = "\n";
      for (String item in DiagnosisContent().all)
        diagnosis += "*$item: ${_report[item]}\n\n";
    } else
      _report["alert"] = "Pas de Wifi";

    return diagnosis;
  }
}

class DiagnosisContent {
  static const String ssid = "SSID";
  static const String ip = "IP";
  static const String ipAddr = "ip addr";
  static const String ifconfigAll = "ifconfig all";
  static const String arp = "Address Resolution Protocol (Busybox)";
  static const String tracertGoogle = "Traceroute Google (Superuser)";
  static const String tracertGoogleDNS = "Traceroute Google DNS (Superuser)";
  static const String pingLo = "Ping Loopback";
  static const String pingLocal = "Ping Local";
  static const String pingGate = "Ping Gateway";
  static const String pingDNS1 = "Ping DNS 1";
  static const String pingDNS2 = "Ping DNS 2";
  static const String pingDNS3 = "Ping DNS 3";
  static const String pingDNS4 = "Ping DNS 4";
  static const String pingDNS5 = "Ping DNS 5";
  static const String nsLookupEMSE = "NSLookup EMSE";
  static const String nsLookupEMSEBusy = "NSLookup EMSE (Busybox)";
  static const String nsLookupGoogle = "NSLookup Google";
  static const String nsLookupGoogleBusy = "NSLookup Google (Busybox)";
  static const String httpPortalPublic = "HTTP Portal Response Public";
  static const String httpPortalGateway = "HTTP Portal Response Gateway";

  List<String> get all {
    return [
      ssid,
      ip,
      ipAddr,
      ifconfigAll,
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
    ];
  }
}
