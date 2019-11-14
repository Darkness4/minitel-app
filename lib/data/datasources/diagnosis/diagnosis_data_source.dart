import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/core/internet_address/internet_address_manager.dart';
import 'package:minitel_toolbox/core/process/process_manager.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/data/models/diagnosis_model.dart';

abstract class DiagnosisDataSource {
  /// Run diagnosis suite
  DiagnosisModel diagnose();
}

class DiagnosisDataSourceImpl implements DiagnosisDataSource {
  final ProcessManager processManager;
  final InternetAddressManager internetAddressManager;
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;
  final Connectivity connectivity;
  final String _argsPing = "-c 4 -w 5 -W 5";

  const DiagnosisDataSourceImpl({
    @required this.processManager,
    @required this.connectivity,
    @required this.internetAddressManager,
    @required this.stormshieldRemoteDataSource,
  });

  @override
  DiagnosisModel diagnose() {
    final DiagnosisModel diagnosis = DiagnosisModel();

    diagnosis[DiagnosisKeys.ip] = connectivity.getWifiIP();
    diagnosis[DiagnosisKeys.ipAddr] = _run("/system/bin/ip", ['a']);
    diagnosis[DiagnosisKeys.arp] = _run("su", ['-c', '/system/bin/arp -a']);
    diagnosis[DiagnosisKeys.tracerouteGoogle] =
        _run("su", ['-c', '/system/bin/traceroute', MyIPAdresses.google]);
    diagnosis[DiagnosisKeys.tracerouteGoogleDNS] =
        _run("su", ['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP]);
    diagnosis[DiagnosisKeys.pingLo] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.localhostIP]);
    diagnosis[DiagnosisKeys.pingLocal] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.proliantIP]);
    diagnosis[DiagnosisKeys.pingGateway] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.gatewayIP]);
    diagnosis[DiagnosisKeys.pingDNS1] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.emseIsminDNS1IP]);
    diagnosis[DiagnosisKeys.pingDNS2] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.emseIsminDNS2IP]);
    diagnosis[DiagnosisKeys.pingDNS3] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.googleDNSIP]);
    diagnosis[DiagnosisKeys.pingDNS4] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.cloudflareDNSIP]);
    diagnosis[DiagnosisKeys.pingDNS5] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.localDNSIP]);
    diagnosis[DiagnosisKeys.nsLookupEmseSU] =
        _run("su", ['-c', "/system/bin/nslookup ${MyIPAdresses.stormshield}"]);
    diagnosis[DiagnosisKeys.nsLookupGoogleSU] = _run(
        "su", <String>['-c', "/system/bin/nslookup ${MyIPAdresses.google}"]);

    diagnosis[DiagnosisKeys.httpResponseStormshieldPublic] =
        stormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshieldIP)
            .then((status) => status.isEmpty ? "Nothing to show" : status)
            .catchError((dynamic e) => e.toString());

    diagnosis[DiagnosisKeys.httpResponseStormshieldLocal] =
        stormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP)
            .then((status) => status.isEmpty ? "Nothing to show" : status)
            .catchError((dynamic e) => e.toString());

    diagnosis[DiagnosisKeys.nsLookupEmse] = _lookup(MyIPAdresses.stormshield);
    diagnosis[DiagnosisKeys.nsLookupGoogle] = _lookup(MyIPAdresses.google);

    return diagnosis;
  }

  Future<String> _lookup(String target) async {
    try {
      final List<InternetAddress> addresses =
          await internetAddressManager.lookup(target);
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
    return processManager
        .run(command, args)
        .then<String>((ProcessResult result) => result.stdout.toString())
        .then<String>(
            (String stdout) => stdout.isEmpty ? "Nothing to show" : stdout)
        .catchError((dynamic e) => e.toString());
  }
}
