import 'dart:io';

import 'package:connectivity/connectivity.dart';
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

  /// Ping arguments
  static const String _argsPing = "-c 4 -w 5 -W 5";

  final GatewayAPI _gateway;

  Map<String, Future<String>> _report = <String, Future<String>>{};

  Diagnosis({@required GatewayAPI gatewayAPI}) : _gateway = gatewayAPI;

  /// Get the warnings from functions
  String get alert => _alert;

  /// Report created through [diagnose] function following [DiagnosisContent]
  Map<String, Future<String>> get report => _report;

  Future<Map<String, String>> get reportAll async {
    final Map<String, String> data = <String, String>{};
    for (final String key in DiagnosisContent()) {
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
  Future<void> diagnose() async {
    // Destroy existing report
    _report = <String, Future<String>>{};

    // Check if connected
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Fill the report
      _report[DiagnosisContent.ip] = Connectivity().getWifiIP();

      await Future.wait(<Future<dynamic>>[
        _report[DiagnosisContent.ipAddr] = _terminalCommand(
          "/system/bin/ip",
          <String>['a'],
        ),
        _report[DiagnosisContent.arp] = _terminalCommand(
          "su",
          <String>['-c', '/system/bin/arp -a'],
        ),
        _report[DiagnosisContent.tracertGoogle] = _terminalCommand(
          "su",
          <String>['-c', '/system/bin/traceroute', MyIPAdresses.google],
        ),
        _report[DiagnosisContent.tracertGoogleDNS] = _terminalCommand(
          "su",
          <String>['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP],
        ),
        _report[DiagnosisContent.pingLo] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.localhostIP],
        ),
        _report[DiagnosisContent.pingLocal] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.proliantIP],
        ),
        _report[DiagnosisContent.pingGate] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.gatewayIP],
        ),
        _report[DiagnosisContent.pingDNS1] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.emseIsminDNS1IP],
        ),
        _report[DiagnosisContent.pingDNS2] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.emseIsminDNS2IP],
        ),
        _report[DiagnosisContent.pingDNS3] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.googleDNSIP],
        ),
        _report[DiagnosisContent.pingDNS4] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.cloudflareDNSIP],
        ),
        _report[DiagnosisContent.pingDNS5] = _terminalCommand(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.localDNSIP],
        ),
        _report[DiagnosisContent.nsLookupEMSEBusy] = _terminalCommand(
          "su",
          <String>['-c', "/system/bin/nslookup ${MyIPAdresses.stormshield}"],
        ),
        _report[DiagnosisContent.nsLookupGoogleBusy] = _terminalCommand(
          "su",
          <String>['-c', "/system/bin/nslookup ${MyIPAdresses.google}"],
        ),
        _report[DiagnosisContent.httpPortalPublic] = _gateway
            .getStatus(MyIPAdresses.stormshieldIP, cookie: _gateway.cookie)
            .then(
                (String status) => status.isEmpty ? "Nothing to show" : status),
        _report[DiagnosisContent.httpPortalGateway] = _gateway
            .getStatus(MyIPAdresses.gatewayIP, cookie: _gateway.cookie)
            .then(
                (String status) => status.isEmpty ? "Nothing to show" : status),
        _report[DiagnosisContent.nsLookupEMSE] =
            _lookup(MyIPAdresses.stormshield),
        _report[DiagnosisContent.nsLookupGoogle] = _lookup(MyIPAdresses.google),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        // Timeout warning
        _alert = "Diagnosis has timed out !";
        return <dynamic>[];
      });
    } else {
      _alert = "Pas de Wifi";
    }
  }

  Future<String> _lookup(String target) async {
    try {
      final List<InternetAddress> addresses =
          await InternetAddress.lookup(target);
      final StringBuffer output = StringBuffer();
      for (final InternetAddress address in addresses) {
        output.write("Host: ${address.host}\nLookup: ${address.address}\n");
      }
      return output.toString();
    } catch (e, s) {
      return "Error: $e\n" "Stacktrace: $s";
    }
  }

  Future<String> _terminalCommand(String command, List<String> args) async {
    try {
      final ProcessResult result = await Process.run(command, args);
      final String stdout = result.stdout;
      return stdout.isEmpty ? "Nothing to show" : stdout;
    } catch (e) {
      return "Error: $e";
    }
  }
}
