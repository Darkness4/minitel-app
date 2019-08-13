import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';

/// This stores all diagnosis results.
///
/// To obtain the report, simply use:
///
/// ```
/// Diagnosis diagnosis;
/// diagnosis.report["name"];
/// ```
///
/// By default, everything is [null].
///
/// To generates all the data : `diagnosis.diagnose()`
/// The generated content follow [DiagnosisContent] pattern.
///
/// The data is generated asynchronously. The process times out after one minute.
class Diagnosis {
  static String _alert;
  final GatewayAPI _gateway;

  var _report = Map<String, Future<String>>();

  /// Ping arguments
  static const _argsPing = "-c 4 -w 5 -W 5";

  Diagnosis({@required GatewayAPI gatewayAPI}) : _gateway = gatewayAPI;

  /// Get the warnings from functions
  String get alert => _alert;

  /// Report created through [diagnose] function following [DiagnosisContent]
  Map<String, Future<String>> get report => _report;

  Future<Map<String, String>> get reportAll async {
    var data = Map<String, String>();
    for (var key in DiagnosisContent()) {
      data[key] = await _report[key];
    }
    return data;
  }

  /// Run a report suite with a 1 minute time out.
  ///
  /// Run multiples command and store into the [report] Map.
  /// The suite is composed of :
  /// - IP scan from [Connectivity]
  /// - ip a
  /// - Address Resolution Protocol (Busybox) -a
  /// - su -c tracerout google.com and 8.8.8.8
  /// - ping loopback, 10.163.0.5 (DHCP), 10.163.0.2 (Gateway),
  /// 192.168.130.33 (School DNS), 192.168.130.3 (School DNS),
  /// 1.1.1.1 (Cloudflare DNS), 8.8.8.8 (Google DNS), 10.163.0.6 (Private DNS).
  /// - nslookup google.com and fw-cgcp.emse.fr (with and without Busybox).
  /// If the report takes too much time, the function return any given
  /// informations after one minute.
  void diagnose() async {
    // Destroy existing report
    _report = Map();

    // Check if connected
    var connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Fill the report
      _report[DiagnosisContent.ip] = Connectivity().getWifiIP();

      await Future.wait([
        _report[DiagnosisContent.ipAddr] = _terminalCommand(
          "/system/bin/ip",
          ['a'],
        ),
        _report[DiagnosisContent.arp] = _terminalCommand(
          "su",
          ['-c', '/system/bin/arp -a'],
        ),
        _report[DiagnosisContent.tracertGoogle] = _terminalCommand(
          "su",
          ['-c', '/system/bin/traceroute', MyIPAdresses.google],
        ),
        _report[DiagnosisContent.tracertGoogleDNS] = _terminalCommand(
          "su",
          ['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP],
        ),
        _report[DiagnosisContent.pingLo] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.localhostIP],
        ),
        _report[DiagnosisContent.pingLocal] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.proliantIP],
        ),
        _report[DiagnosisContent.pingGate] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.gatewayIP],
        ),
        _report[DiagnosisContent.pingDNS1] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.emseIsminDNS1IP],
        ),
        _report[DiagnosisContent.pingDNS2] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.emseIsminDNS2IP],
        ),
        _report[DiagnosisContent.pingDNS3] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.googleDNSIP],
        ),
        _report[DiagnosisContent.pingDNS4] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.cloudflareDNSIP],
        ),
        _report[DiagnosisContent.pingDNS5] = _terminalCommand(
          "/system/bin/ping",
          [_argsPing, MyIPAdresses.localDNSIP],
        ),
        _report[DiagnosisContent.nsLookupEMSEBusy] = _terminalCommand(
          "su",
          ['-c', "/system/bin/nslookup ${MyIPAdresses.stormshield}"],
        ),
        _report[DiagnosisContent.nsLookupGoogleBusy] = _terminalCommand(
          "su",
          ['-c', "/system/bin/nslookup ${MyIPAdresses.google}"],
        ),
        _report[DiagnosisContent.httpPortalPublic] = _gateway
            .getStatus(MyIPAdresses.stormshieldIP, cookie: _gateway.cookie)
            .then((status) => status.isEmpty ? "Nothing to show" : status),
        _report[DiagnosisContent.httpPortalGateway] = _gateway
            .getStatus(MyIPAdresses.gatewayIP, cookie: _gateway.cookie)
            .then((status) => status.isEmpty ? "Nothing to show" : status),
        _report[DiagnosisContent.nsLookupEMSE] =
            _lookup(MyIPAdresses.stormshield),
        _report[DiagnosisContent.nsLookupGoogle] = _lookup(MyIPAdresses.google),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        // Timeout warning
        _alert = "Diagnosis has timed out !";
        return [];
      });
    } else {
      _alert = "Pas de Wifi";
    }
  }

  Future<String> _lookup(String address) async {
    try {
      var addresses = await InternetAddress.lookup(MyIPAdresses.stormshield);
      String output = "";
      for (var address in addresses) {
        output += "Host: ${address.host}\nLookup: ${address.address}\n";
      }
      return output;
    } catch (e, s) {
      return "Error: $e\n" "Stacktrace: $s";
    }
  }

  Future<String> _terminalCommand(String command, List<String> args) async {
    try {
      String stdout = await exec(command, args).runGetOutput();
      return stdout.isEmpty ? "Nothing to show" : stdout;
    } catch (e, s) {
      return "Error: $e\n" "Stacktrace: $s";
    }
  }
}

/// Content of the report after a diagnosis.
class DiagnosisContent extends Iterable<String> {
  static const String ip = "IP";
  static const String ipAddr = "ip addr";
  static const String arp = "Address Resolution Protocol (SU + Busy)";
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
  static const String nsLookupEMSEBusy = "NSLookup EMSE (SU + Busy)";
  static const String nsLookupGoogle = "NSLookup Google";
  static const String nsLookupGoogleBusy = "NSLookup Google (SU + Busy)";
  static const String httpPortalPublic = "HTTP Portal Response Public";
  static const String httpPortalGateway = "HTTP Portal Response Gateway";

  /// Make able to loop through [DiagnosisContent]
  ///
  /// Exemple:
  /// ```
  /// for (String content in DiagnosisContent())
  /// ```
  Iterator<String> get iterator => [
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
}
