import 'dart:collection';

import 'package:equatable/equatable.dart';

class Diagnosis extends Equatable with MapMixin<String, Future<String>> {
  final _internal = <String, Future<String>>{};

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
  List<Object> get props => _internal.entries.toList();

  @override
  void operator []=(String key, Future<String> value) {
    _internal[key] = value;
  }

  @override
  void clear() {
    _internal.clear();
  }

  @override
  Iterable<String> get keys => _internal.keys;

  @override
  Future<String> remove(Object key) => _internal.remove(key);

  Future<Map<String, String>> waitAll() async {
    final Map<String, String> map = {};
    for (final entry in _internal.entries) {
      map[entry.key] = await entry.value;
    }
    return map;
  }
}
