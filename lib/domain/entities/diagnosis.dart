import 'dart:collection';

import 'package:minitel_toolbox/core/constants/diagnosis_keys.dart';

class Diagnosis with MapMixin<String, Future<String>> {
  final _internal = <String, Future<String>>{
    DiagnosisKeys.ip: Future<String>.value(""),
    DiagnosisKeys.ipAddr: Future<String>.value(""),
    DiagnosisKeys.arp: Future<String>.value(""),
    DiagnosisKeys.tracerouteGoogle: Future<String>.value(""),
    DiagnosisKeys.tracerouteGoogleDNS: Future<String>.value(""),
    DiagnosisKeys.pingLo: Future<String>.value(""),
    DiagnosisKeys.pingLocal: Future<String>.value(""),
    DiagnosisKeys.pingGateway: Future<String>.value(""),
    DiagnosisKeys.pingDNS1: Future<String>.value(""),
    DiagnosisKeys.pingDNS2: Future<String>.value(""),
    DiagnosisKeys.pingDNS3: Future<String>.value(""),
    DiagnosisKeys.pingDNS4: Future<String>.value(""),
    DiagnosisKeys.pingDNS5: Future<String>.value(""),
    DiagnosisKeys.nsLookupEmse: Future<String>.value(""),
    DiagnosisKeys.nsLookupEmseSU: Future<String>.value(""),
    DiagnosisKeys.nsLookupGoogle: Future<String>.value(""),
    DiagnosisKeys.nsLookupGoogleSU: Future<String>.value(""),
    DiagnosisKeys.httpResponseStormshieldPublic: Future<String>.value(""),
    DiagnosisKeys.httpResponseStormshieldLocal: Future<String>.value(""),
  };

  Future<String> getReport() async {
    final StringBuffer buffer = StringBuffer();

    for (final entry in _internal.entries) {
      buffer.write("---${entry.key}---\n"
          "${await entry.value}\n"
          "---END ${entry.key}---\n\n");
    }
    return buffer.toString();
  }

  @override
  Future<String> operator [](Object key) => _internal[key];

  @override
  void operator []=(String key, Future<String> value) {
    if (_internal.containsKey(key)) {
      _internal[key] = value;
    } else {
      throw ArgumentError.value(key, 'key', 'Cannot set value.');
    }
  }

  @override
  void clear() {
    throw UnimplementedError();
  }

  @override
  Iterable<String> get keys => _internal.keys;

  @override
  Future<String> remove(Object key) => throw UnimplementedError();

  Future<Map<String, String>> waitAll() async {
    final Map<String, String> map = {};
    for (final entry in entries) {
      map[entry.key] = await entry.value;
    }
    return map;
  }
}
