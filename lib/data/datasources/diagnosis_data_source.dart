import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/models/diagnosis_model.dart';
import 'package:minitel_toolbox/domain/entities/stormshield.dart';
import 'package:minitel_toolbox/domain/repositories/stormshield_repository.dart';

abstract class DiagnosisDataSource {
  /// Run diagnosis suite
  Future<DiagnosisModel> diagnose();
}

class DiagnosisDataSourceImpl implements DiagnosisDataSource {
  final NetworkInfo networkInfo;
  final StormshieldRepository stormshieldRepository;
  final String _argsPing = "-c 4 -w 5 -W 5";

  const DiagnosisDataSourceImpl({this.networkInfo, this.stormshieldRepository});

  @override
  Future<DiagnosisModel> diagnose() async {
    final Map<String, Future<String>> diagnosis = {
      "IP": Connectivity().getWifiIP(),
      "ip addr": _run(
        "/system/bin/ip",
        <String>['a'],
      ),
      "Address Resolution Protocol (SU + Busy)": _run(
        "su",
        <String>['-c', '/system/bin/arp -a'],
      ),
      "Traceroute Google (Superuser)": _run(
        "su",
        <String>['-c', '/system/bin/traceroute', MyIPAdresses.google],
      ),
      "Traceroute Google DNS (Superuser)": _run(
        "su",
        <String>['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP],
      ),
      "Ping Loopback": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.localhostIP],
      ),
      "Ping Local": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.proliantIP],
      ),
      "Ping Gateway": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.gatewayIP],
      ),
      "Ping DNS 1": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.emseIsminDNS1IP],
      ),
      "Ping DNS 2": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.emseIsminDNS2IP],
      ),
      "Ping DNS 3": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.googleDNSIP],
      ),
      "Ping DNS 4": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.cloudflareDNSIP],
      ),
      "Ping DNS 5": _run(
        "/system/bin/ping",
        <String>[_argsPing, MyIPAdresses.localDNSIP],
      ),
      "NSLookup EMSE": _run(
        "su",
        <String>['-c', "/system/bin/nslookup ${MyIPAdresses.stormshield}"],
      ),
      "NSLookup EMSE (SU + Busy)": _run(
        "su",
        <String>['-c', "/system/bin/nslookup ${MyIPAdresses.google}"],
      ),
      "NSLookup Google": stormshieldRepository
          .fetchStatus(MyIPAdresses.stormshieldIP)
          .then((Stormshield stormshield) => stormshield.status.isEmpty
              ? "Nothing to show"
              : stormshield.status),
      "NSLookup Google (SU + Busy)": stormshieldRepository
          .fetchStatus(MyIPAdresses.gatewayIP)
          .then((Stormshield stormshield) => stormshield.status.isEmpty
              ? "Nothing to show"
              : stormshield.status),
      "HTTP Portal Response Public": _lookup(MyIPAdresses.stormshield),
      "HTTP Portal Response Gateway": _lookup(MyIPAdresses.google),
    };
    // if (await networkInfo.result != ConnectivityResult.none) {
    //   await Future.wait(diagnosis.values).timeout(const Duration(minutes: 1),
    //       onTimeout: () {
    //         // TODO
    //     throw "DIAGNOSIS TIMED OUT"
    //   });
    // } else {
    //   // TODO
    //   throw "NO WIFI";
    // }
    return DiagnosisModel(diagnosis: diagnosis);
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
        .then<String>((ProcessResult result) => result.stdout.toString())
        .then<String>(
            (String stdout) => stdout.isEmpty ? "Nothing to show" : stdout)
        .catchError((dynamic e) => e.toString());
  }
}
