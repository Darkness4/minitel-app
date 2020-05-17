import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';
import 'package:minitel_toolbox/core/internet_address/internet_address_manager.dart';
import 'package:minitel_toolbox/core/process/process_manager.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/diagnosis.dart';

abstract class DiagnosisDataSource {
  Diagnosis get diagnosis;
  Diagnosis diagnose({Duration timeLimit = const Duration(minutes: 1)});
}

class DiagnosisDataSourceImpl implements DiagnosisDataSource {
  @override
  final Diagnosis diagnosis;
  final ProcessManager processManager;
  final InternetAddressManager internetAddressManager;
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;
  final Connectivity connectivity;
  final String _argsPing = "-c 4 -w 5 -W 5";

  const DiagnosisDataSourceImpl({
    @required this.diagnosis,
    @required this.processManager,
    @required this.connectivity,
    @required this.internetAddressManager,
    @required this.stormshieldRemoteDataSource,
  });

  @override
  Diagnosis diagnose({Duration timeLimit = const Duration(minutes: 1)}) {
    diagnosis[DiagnosisKeys.ip] = connectivity
        .getWifiIP()
        .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.ipAddr] = _run("/system/bin/ip", ['a'])
        .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.arp] = _run("su", ['-c', '/system/bin/arp -a'])
        .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.tracerouteGoogle] =
        _run("su", ['-c', '/system/bin/traceroute', MyIPAdresses.google])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.tracerouteGoogleDNS] =
        _run("su", ['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingLo] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.localhostIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingLocal] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.proliantIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingGateway] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.gatewayIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingDNS1] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.emseIsminDNS1IP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingDNS2] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.emseIsminDNS2IP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingDNS3] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.googleDNSIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingDNS4] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.cloudflareDNSIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.pingDNS5] =
        _run("/system/bin/ping", [_argsPing, MyIPAdresses.localDNSIP])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.nsLookupEmseSU] =
        _run("su", ['-c', "/system/bin/nslookup ${MyIPAdresses.stormshield}"])
            .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.nsLookupGoogleSU] = _run(
            "su", <String>['-c', "/system/bin/nslookup ${MyIPAdresses.google}"])
        .timeout(timeLimit, onTimeout: () => "Timed out.");

    diagnosis[DiagnosisKeys.httpResponseStormshieldPublic] =
        stormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshieldIP)
            .then((status) => status.isEmpty ? "Nothing to show" : status)
            .catchError((dynamic e) => e.toString())
            .timeout(timeLimit, onTimeout: () => "Timed out.");

    diagnosis[DiagnosisKeys.httpResponseStormshieldLocal] =
        stormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP)
            .then((status) => status.isEmpty ? "Nothing to show" : status)
            .catchError((dynamic e) => e.toString())
            .timeout(timeLimit, onTimeout: () => "Timed out.");

    diagnosis[DiagnosisKeys.nsLookupEmse] = _lookup(MyIPAdresses.stormshield)
        .timeout(timeLimit, onTimeout: () => "Timed out.");
    diagnosis[DiagnosisKeys.nsLookupGoogle] = _lookup(MyIPAdresses.google)
        .timeout(timeLimit, onTimeout: () => "Timed out.");

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

  Future<String> _run(String command, List<String> args) async {
    return processManager
        .run(command, args)
        .then<String>((ProcessResult result) => result.stdout.toString())
        .then<String>(
            (String stdout) => stdout.isEmpty ? "Nothing to show" : stdout)
        .catchError((dynamic e) => e.toString());
  }
}
