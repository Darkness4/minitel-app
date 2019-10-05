import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';

class DiagnosisAPI {
  /// Ping arguments
  static const String _argsPing = "-c 4 -w 5 -W 5";
  final StormshieldAPI _stormshieldAPI;

  Diagnosis _diagnosis = Diagnosis();

  DiagnosisAPI({@required StormshieldAPI stormshieldAPI})
      : _stormshieldAPI = stormshieldAPI;

  Diagnosis get diagnosis => _diagnosis;

  /// Run a report suite with a 1 minute time out.
  ///
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
  Future<Diagnosis> diagnose() async {
    _diagnosis = Diagnosis();

    // Check if connected
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // Fill the report
      await Future.wait(<Future<String>>[
        _diagnosis.ip.content = Connectivity().getWifiIP(),
        _diagnosis.ipAddr.content = _run(
          "/system/bin/ip",
          <String>['a'],
        ),
        _diagnosis.arp.content = _run(
          "su",
          <String>['-c', '/system/bin/arp -a'],
        ),
        _diagnosis.tracertGoogle.content = _run(
          "su",
          <String>['-c', '/system/bin/traceroute', MyIPAdresses.google],
        ),
        _diagnosis.tracertGoogleDNS.content = _run(
          "su",
          <String>['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP],
        ),
        _diagnosis.pingLo.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.localhostIP],
        ),
        _diagnosis.pingLocal.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.proliantIP],
        ),
        _diagnosis.pingGate.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.gatewayIP],
        ),
        _diagnosis.pingDNS1.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.emseIsminDNS1IP],
        ),
        _diagnosis.pingDNS2.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.emseIsminDNS2IP],
        ),
        _diagnosis.pingDNS3.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.googleDNSIP],
        ),
        _diagnosis.pingDNS4.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.cloudflareDNSIP],
        ),
        _diagnosis.pingDNS5.content = _run(
          "/system/bin/ping",
          <String>[_argsPing, MyIPAdresses.localDNSIP],
        ),
        _diagnosis.nsLookupEMSEBusy.content = _run(
          "su",
          <String>['-c', "/system/bin/nslookup ${MyIPAdresses.stormshield}"],
        ),
        _diagnosis.nsLookupGoogleBusy.content = _run(
          "su",
          <String>['-c', "/system/bin/nslookup ${MyIPAdresses.google}"],
        ),
        _diagnosis.httpPortalPublic.content = _stormshieldAPI
            .fetchStatus(MyIPAdresses.stormshieldIP,
                cookie: _stormshieldAPI.cookie)
            .then(
                (String status) => status.isEmpty ? "Nothing to show" : status),
        _diagnosis.httpPortalGateway.content = _stormshieldAPI
            .fetchStatus(MyIPAdresses.gatewayIP, cookie: _stormshieldAPI.cookie)
            .then(
                (String status) => status.isEmpty ? "Nothing to show" : status),
        _diagnosis.nsLookupEMSE.content = _lookup(MyIPAdresses.stormshield),
        _diagnosis.nsLookupGoogle.content = _lookup(MyIPAdresses.google),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        _diagnosis.alert = "Diagnose has timed out!";
        return <String>[];
      });
    } else {
      _diagnosis.alert = "No Wi-Fi";
    }
    return _diagnosis;
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

  Future<String> _run(String command, List<String> args) {
    return Process.run(command, args)
        .then((ProcessResult result) => result.stdout)
        .then((dynamic stdout) =>
            stdout.isEmpty ? "Nothing to show" : stdout.toString())
        .catchError((dynamic e) => e.toString());
  }
}
