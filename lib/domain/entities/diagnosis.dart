import 'dart:async';
import 'dart:collection';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';

@injectable
class Diagnosis extends UnmodifiableMapBase<String, Completer<String>> {
  final _internal = <String, Completer<String>>{
    DiagnosisKeys.ip: Completer<String>(),
    DiagnosisKeys.ipAddr: Completer<String>(),
    DiagnosisKeys.arp: Completer<String>(),
    DiagnosisKeys.tracerouteGoogle: Completer<String>(),
    DiagnosisKeys.tracerouteGoogleDNS: Completer<String>(),
    DiagnosisKeys.pingLo: Completer<String>(),
    DiagnosisKeys.pingLocal: Completer<String>(),
    DiagnosisKeys.pingGateway: Completer<String>(),
    DiagnosisKeys.pingDNS1: Completer<String>(),
    DiagnosisKeys.pingDNS2: Completer<String>(),
    DiagnosisKeys.pingDNS3: Completer<String>(),
    DiagnosisKeys.pingDNS4: Completer<String>(),
    DiagnosisKeys.pingDNS5: Completer<String>(),
    DiagnosisKeys.nsLookupEmse: Completer<String>(),
    DiagnosisKeys.nsLookupEmseSU: Completer<String>(),
    DiagnosisKeys.nsLookupGoogle: Completer<String>(),
    DiagnosisKeys.nsLookupGoogleSU: Completer<String>(),
    DiagnosisKeys.httpResponseStormshieldPublic: Completer<String>(),
    DiagnosisKeys.httpResponseStormshieldLocal: Completer<String>(),
  };

  @override
  Iterable<String> get keys => _internal.keys;

  @override
  Completer<String> operator [](Object key) => _internal[key];

  @override
  void clear() {
    _internal.clear();
    _internal.addAll({
      DiagnosisKeys.ip: Completer<String>(),
      DiagnosisKeys.ipAddr: Completer<String>(),
      DiagnosisKeys.arp: Completer<String>(),
      DiagnosisKeys.tracerouteGoogle: Completer<String>(),
      DiagnosisKeys.tracerouteGoogleDNS: Completer<String>(),
      DiagnosisKeys.pingLo: Completer<String>(),
      DiagnosisKeys.pingLocal: Completer<String>(),
      DiagnosisKeys.pingGateway: Completer<String>(),
      DiagnosisKeys.pingDNS1: Completer<String>(),
      DiagnosisKeys.pingDNS2: Completer<String>(),
      DiagnosisKeys.pingDNS3: Completer<String>(),
      DiagnosisKeys.pingDNS4: Completer<String>(),
      DiagnosisKeys.pingDNS5: Completer<String>(),
      DiagnosisKeys.nsLookupEmse: Completer<String>(),
      DiagnosisKeys.nsLookupEmseSU: Completer<String>(),
      DiagnosisKeys.nsLookupGoogle: Completer<String>(),
      DiagnosisKeys.nsLookupGoogleSU: Completer<String>(),
      DiagnosisKeys.httpResponseStormshieldPublic: Completer<String>(),
      DiagnosisKeys.httpResponseStormshieldLocal: Completer<String>(),
    });
  }

  Future<String> getReport() async {
    final buffer = StringBuffer();

    for (final entry in _internal.entries) {
      buffer.writeln('---${entry.key}---');
      if (entry.value.isCompleted) {
        buffer.writeln('${await entry.value.future}');
      }
      buffer.writeln('---END ${entry.key}---\n');
    }
    return buffer.toString();
  }

  Future<Map<String, String>> waitAll() async {
    final map = <String, String>{};
    for (final entry in entries) {
      map[entry.key] = await entry.value.future;
    }
    return map;
  }
}
