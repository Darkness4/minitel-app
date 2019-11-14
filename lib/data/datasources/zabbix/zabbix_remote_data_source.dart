import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/zabbix/zabbix_host_model.dart';

abstract class ZabbixRemoteDataSource {
  /// Fetch Zabbix Hosts
  Future<List<ZabbixHostModel>> fetchZabbixHosts(
    int groupids, {
    String token = "",
  });
}

class ZabbixRemoteDataSourceImpl implements ZabbixRemoteDataSource {
  final http.Client clientNoCheck;

  const ZabbixRemoteDataSourceImpl({@required this.clientNoCheck});

  @override
  Future<List<ZabbixHostModel>> fetchZabbixHosts(
    int groupids, {
    String token = "",
  }) async {
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
      final response = await clientNoCheck.post(
        '${ApiKeys.zabbixPath}/api_jsonrpc.php',
        headers: {"Content-Type": "application/json-rpc"},
        body: dataEncoded,
      );

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        final List<Map<String, dynamic>> result =
            List<Map<String, dynamic>>.from(body["result"] as List<dynamic>);
        final List<ZabbixHostModel> output = result
            .map<ZabbixHostModel>(
                (Map<String, dynamic> host) => ZabbixHostModel.fromJson(host))
            .toList();
        return output;
      } else {
        throw ServerException('Failed to load User : ${response.statusCode}');
      }
    } on SocketException catch (e) {
      if (e.toString().contains('timed out')) {
        throw ClientException(
            "N'est pas connecté au réseau WiFi Minitel. Connection timed out.");
      } else if (e.toString().contains('No route to host')) {
        throw ClientException(
            "Le server de monitoring semble être éteint. No route to host.");
      } else {
        throw ClientException(e);
      }
    }
  }
}
