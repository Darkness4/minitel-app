import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
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

@LazySingleton(as: DiagnosisDataSource)
class DiagnosisDataSourceImpl implements DiagnosisDataSource {
  @override
  final Diagnosis diagnosis;
  final ProcessManager processManager;
  final InternetAddressManager internetAddressManager;
  final StormshieldRemoteDataSource stormshieldRemoteDataSource;

  static const String _argsPing = '-c 4 -w 5 -W 5';

  const DiagnosisDataSourceImpl({
    @required this.diagnosis,
    @required this.processManager,
    @required this.internetAddressManager,
    @required this.stormshieldRemoteDataSource,
  });

  @override
  Diagnosis diagnose({Duration timeLimit = const Duration(minutes: 1)}) {
    diagnosis.clear();
    diagnosis[DiagnosisKeys.ipAddr].complete(_run('/system/bin/ip', ['a'])
        .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.arp].complete(
        _run('su', ['-c', '/system/bin/arp -a'])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.tracerouteGoogle].complete(
        _run('su', ['-c', '/system/bin/traceroute', MyIPAdresses.google])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.tracerouteGoogleDNS].complete(
        _run('su', ['-c', '/system/bin/traceroute', MyIPAdresses.googleDNSIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingLo].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.localhostIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingLocal].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.proliantIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingGateway].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.gatewayIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingDNS1].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.emseIsminDNS1IP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingDNS2].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.emseIsminDNS2IP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingDNS3].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.googleDNSIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingDNS4].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.cloudflareDNSIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.pingDNS5].complete(
        _run('/system/bin/ping', [_argsPing, MyIPAdresses.localDNSIP])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.nsLookupEmseSU].complete(
        _run('su', ['-c', '/system/bin/nslookup ${MyIPAdresses.stormshield}'])
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.nsLookupGoogleSU].complete(_run(
            'su', <String>['-c', '/system/bin/nslookup ${MyIPAdresses.google}'])
        .timeout(timeLimit, onTimeout: () => 'Timed out.'));

    diagnosis[DiagnosisKeys.httpResponseStormshieldPublic].complete(
        stormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.stormshield)
            .then((status) => status.isEmpty ? 'Nothing to show' : status)
            .catchError((dynamic e) => e.toString())
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));

    diagnosis[DiagnosisKeys.httpResponseStormshieldLocal].complete(
        stormshieldRemoteDataSource
            .fetchStatus(MyIPAdresses.gatewayIP)
            .then((status) => status.isEmpty ? 'Nothing to show' : status)
            .catchError((dynamic e) => e.toString())
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));

    diagnosis[DiagnosisKeys.nsLookupEmse].complete(
        _lookup(MyIPAdresses.stormshield)
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));
    diagnosis[DiagnosisKeys.nsLookupGoogle].complete(
        _lookup(MyIPAdresses.google)
            .timeout(timeLimit, onTimeout: () => 'Timed out.'));

    return diagnosis;
  }

  Future<String> _lookup(String target) async {
    try {
      final addresses = await internetAddressManager.lookup(target);

      return addresses
          .map((address) =>
              'Host: ${address.host}\nLookup: ${address.address}\n')
          .join();
    } catch (e, s) {
      return '''
Error: $e
Stacktrace: $s
''';
    }
  }

  Future<String> _run(String command, List<String> args) {
    return processManager
        .run(command, args)
        .then((result) => result.stdout.toString())
        .then((stdout) => stdout.isEmpty ? 'Nothing to show' : stdout)
        .catchError((dynamic e) => e.toString());
  }
}
