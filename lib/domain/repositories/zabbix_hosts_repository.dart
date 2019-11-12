import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

abstract class ZabbixHostsRepository {
  Future<List<ZabbixHost>> get(int groupids, String zabbixPath,
      {String token = ""});
}
