import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

abstract class ZabbixRemoteDataSource {
  /// Fetch Zabbix Hosts
  Future<List<ZabbixHost>> fetchZabbixHosts(int groupids);
}

@LazySingleton(as: ZabbixRemoteDataSource)
class ZabbixRemoteDataSourceImpl implements ZabbixRemoteDataSource {
  final http.Client clientNoCheck;

  const ZabbixRemoteDataSourceImpl({required this.clientNoCheck});

  @override
  Future<List<ZabbixHost>> fetchZabbixHosts(int groupids) async {
    final data = <String, dynamic>{
      'jsonrpc': '2.0',
      'method': 'host.get',
      'params': {
        'groupids': groupids,
        'output': [
          'host',
        ],
        'selectItems': [
          'type',
          'value_type',
          'name',
          'lastvalue',
          'units',
          'snmp_oid',
        ],
        'selectInterfaces': [
          'ip',
        ],
      },
      'id': 2,
      'auth': ApiKeys.zabbixToken,
    };

    final dataEncoded = json.encode(data);

    try {
      final response = await clientNoCheck.post(
        Uri.parse('${ApiKeys.zabbixPath}/api_jsonrpc.php'),
        headers: {'Content-Type': 'application/json-rpc'},
        body: dataEncoded,
      );

      if (response.statusCode == HttpStatus.ok) {
        final body = json.decode(response.body) as Map<String, dynamic>;
        final output = (body['result'] as List<dynamic>)
            .map((dynamic host) =>
                ZabbixHost.fromJson(host as Map<String, dynamic>))
            .toList();
        return output;
      } else {
        throw ServerException(
            'Failed to load User : ${response.statusCode} ${response.reasonPhrase}\n${response.body}');
      }
    } on SocketException catch (e) {
      if (e.toString().contains('timed out')) {
        throw ClientException(
            "N'est pas connecté au réseau WiFi Minitel. Connection timed out.");
      } else if (e.toString().contains('No route to host')) {
        throw ClientException(
            'Le server de monitoring semble être éteint. No route to host.');
      } else {
        throw ClientException(e);
      }
    }
  }
}
