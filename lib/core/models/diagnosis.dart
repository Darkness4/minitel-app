import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
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
  static String _alert;
  final GatewayAPI _gateway = GatewayAPI();
  Map<String, String> _report = {};

  final _argsPing = "-c 4 -w 5 -W 5";

  String get alert => _alert;

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
    _report = {};
    var diagnosis = "";

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String ssid;
      PermissionStatus permStatus = await PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location);

      if (permStatus == PermissionStatus.granted)
        Connectivity().getWifiName().then((output) => ssid = output);
      else
        PermissionHandler().requestPermissions([PermissionGroup.location]);

      var ip = await Connectivity().getWifiIP();

      _report[DiagnosisContent.ssid] = ssid;
      _report[DiagnosisContent.ip] = ip;

      await Future.wait([
        _terminalCommand("ip", ['a'], DiagnosisContent.ipAddr),
        _terminalCommand("ifconfig", ['-a'], DiagnosisContent.ifconfigAll),
        _terminalCommand("arp", ['-a'], DiagnosisContent.arp),
        _terminalCommand(
          "su",
          [
            '-c',
            'traceroute',
            MyIPAdresses.google,
          ],
          DiagnosisContent.tracertGoogle,
        ),
        _terminalCommand(
          "su",
          [
            '-c',
            'traceroute',
            MyIPAdresses.googleDNSIP,
          ],
          DiagnosisContent.tracertGoogleDNS,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.localhostIP,
          ],
          DiagnosisContent.pingLo,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.proliantIP,
          ],
          DiagnosisContent.pingLocal,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.gatewayIP,
          ],
          DiagnosisContent.pingGate,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.emseIsminDNS1IP,
          ],
          DiagnosisContent.pingDNS1,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.emseIsminDNS2IP,
          ],
          DiagnosisContent.pingDNS2,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.googleDNSIP,
          ],
          DiagnosisContent.pingDNS3,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.cloudflareDNSIP,
          ],
          DiagnosisContent.pingDNS4,
        ),
        _terminalCommand(
          "ping",
          [
            _argsPing,
            MyIPAdresses.localDNSIP,
          ],
          DiagnosisContent.pingDNS5,
        ),
        _terminalCommand(
          "nslookup",
          [MyIPAdresses.stormshield],
          DiagnosisContent.nsLookupEMSEBusy,
        ),
        _terminalCommand(
          "nslookup",
          [MyIPAdresses.google],
          DiagnosisContent.nsLookupGoogleBusy,
        ),
        _gateway.getStatus(MyIPAdresses.stormshieldIP).then((status) =>
            _report[DiagnosisContent.httpPortalPublic] =
                status.isEmpty ? "Nothing to show" : status),
        _gateway.getStatus(MyIPAdresses.gatewayIP).then((status) =>
            _report[DiagnosisContent.httpPortalGateway] =
                status.isEmpty ? "Nothing to show" : status),
        InternetAddress.lookup(MyIPAdresses.stormshield)
            .then((addresses) => addresses.forEach((address) =>
                _report[DiagnosisContent.nsLookupEMSE] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError(
                (e) => _report[DiagnosisContent.nsLookupEMSE] = e.toString()),
        InternetAddress.lookup(MyIPAdresses.google)
            .then((addresses) => addresses.forEach((address) =>
                _report[DiagnosisContent.nsLookupGoogle] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError(
                (e) => _report[DiagnosisContent.nsLookupGoogle] = e.toString()),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        _alert = "Diagnosis has timed out !";
      });

      diagnosis = "\n";
      for (String item in DiagnosisContent())
        diagnosis += "*$item: ${_report[item]}\n\n";
    } else
      _alert = "Pas de Wifi";

    return diagnosis;
  }

  Future<void> _terminalCommand(
      String command, List<String> args, String output) async {
    String stdout;
    try {
      stdout = await exec(command, args).runGetOutput();
      _report[output] = stdout.isEmpty ? "Nothing to show" : stdout;
    } catch (e) {
      _report[output] = e.toString();
    }
  }
}

/// Content of the report after a diagnosis.
class DiagnosisContent extends Iterable<String> {
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

  Iterator<String> get iterator => [
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
      ].iterator;
}

/// All used IP during the diagnosis.
class MyIPAdresses {
  /// Google named address
  static const String google = "google.com";

  /// Google DNS IP
  static const String googleDNSIP = "8.8.8.8";

  /// Localhost IP for Internet Protocal v4 test
  static const String localhostIP = "127.0.0.1";

  /// Local Server IP for local ping
  static const String proliantIP = "10.163.0.5";

  /// Main Gateway IP
  static const String gatewayIP = "10.163.0.2";

  /// EMSE ISMIN DNS 1 IP
  static const String emseIsminDNS1IP = "192.168.130.3";

  /// EMSE ISMIN DNS 2 IP
  static const String emseIsminDNS2IP = "192.168.130.33";

  /// Cloudflare DNS IP
  static const String cloudflareDNSIP = "1.1.1.1";

  /// Local DNS IP
  static const String localDNSIP = "192.168.0.6";

  /// Stormshield IP
  static const String stormshieldIP = "195.83.139.7";

  /// Stormshield named address
  static const String stormshield = "fw-cgcp.emse.fr";
}
