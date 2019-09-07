import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';

class ZabbixAPI {
  final HttpClient _client = HttpClient()
    ..badCertificateCallback = (_, __, ___) => true;

  Future<String> getToken(
      String user, String password, String zabbixPath) async {
    final Map<String, dynamic> authentication = <String, dynamic>{
      "jsonrpc": "2.0",
      "method": "user.login",
      "id": 1,
      "params": <String, String>{
        "user": user,
        "password": password,
      },
      "auth": null,
    };

    final String dataEncoded = json.encode(authentication);

    final HttpClientRequest request =
        await _client.postUrl(Uri.parse('$zabbixPath/api_jsonrpc.php'))
          ..contentLength = dataEncoded.length
          ..headers.set(HttpHeaders.contentTypeHeader, 'application/json-rpc')
          ..write(dataEncoded);
    final HttpClientResponse response = await request.close();
    final String output = await response.transform(utf8.decoder).join();
    final dynamic jsonData = json.decode(output);
    return jsonData["result"];
  }

  Future<List<ZabbixHost>> getZabbixHosts(int groupids, String zabbixPath,
      {String token = ""}) async {
    final Map<String, Object> data = <String, dynamic>{
      "jsonrpc": "2.0",
      "method": "host.get",
      "params": <String, dynamic>{
        "groupids": groupids,
        "output": <String>[
          "host",
        ],
        "selectItems": <String>[
          'type',
          'value_type',
          'name',
          'lastvalue',
          'units',
          'snmp_oid',
        ],
      },
      "id": 2,
      "auth": token,
    };

    final String dataEncoded = json.encode(data);

    try {
      final HttpClientRequest request =
          await _client.postUrl(Uri.parse('$zabbixPath/api_jsonrpc.php'))
            ..contentLength = dataEncoded.length
            ..headers.set(HttpHeaders.contentTypeHeader, 'application/json-rpc')
            ..write(dataEncoded);
      final HttpClientResponse response = await request.close();

      final String output = await response.transform(utf8.decoder).join();

      final Map<String, dynamic> jsonData = json.decode(output);

      final List<Map<String, dynamic>> hosts =
          List<Map<String, dynamic>>.from(jsonData["result"]);

      final List<ZabbixHost> zabbixHosts = hosts
          .map((Map<String, dynamic> host) => ZabbixHost.fromJson(host))
          .toList();

      return zabbixHosts;
    } on SocketException catch (e) {
      if (e.toString().contains('timed out')) {
        throw Exception(
            "N'est pas connecté au réseau WiFi Minitel. Connection timed out.");
      } else if (e.toString().contains('No route to host')) {
        throw Exception(
            "Le server de monitoring semble être éteint. No route to host.");
      } else {
        rethrow;
      }
    }
  }
}
