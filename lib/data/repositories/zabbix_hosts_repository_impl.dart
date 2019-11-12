import 'package:minitel_toolbox/data/datasources/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';

class ZabbixHostsRepositoryImpl implements ZabbixHostsRepository {
  final ZabbixRemoteDataSource remoteDataSource;

  const ZabbixHostsRepositoryImpl({
    this.remoteDataSource,
  });

  @override
  Future<List<ZabbixHost>> get(int groupids, String zabbixPath,
          {String token = ""}) =>
      _get(groupids, zabbixPath, token);

  Future<List<ZabbixHost>> _get(int groupids, String zabbixPath, String token) {
    return remoteDataSource.fetchZabbixHosts(groupids, zabbixPath,
        token: token);
  }
}
