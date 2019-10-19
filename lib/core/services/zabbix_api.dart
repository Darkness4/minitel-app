import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';

class ZabbixAPI {
  final HttpClient _client = HttpClient()
    ..badCertificateCallback = (_, __, ___) => true;

  Future<String> fetchToken(
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
    final dynamic output =
        await response.transform(utf8.decoder).transform(json.decoder).first;
    return output["result"] as String;
  }

  Future<List<ZabbixHost>> fetchZabbixHosts(int groupids, String zabbixPath,
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
        "selectInterfaces": <String>[
          "ip",
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

      final Future<List<ZabbixHost>> output = response
          .transform(utf8.decoder)
          .transform(json.decoder)
          .expand((dynamic jsonData) => List<Map<String, dynamic>>.from(
              jsonData["result"] as List<dynamic>))
          .map((Map<String, dynamic> host) => ZabbixHost.fromJson(host))
          .toList();

      return output;
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
