import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/data/datasources/zabbix/zabbix_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';

@LazySingleton(as: ZabbixHostsRepository)
class ZabbixHostsRepositoryImpl implements ZabbixHostsRepository {
  final ZabbixRemoteDataSource remoteDataSource;

  const ZabbixHostsRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<List<ZabbixHost>> get(int groupids) => _get(groupids);

  Future<List<ZabbixHost>> _get(int groupids) {
    return remoteDataSource.fetchZabbixHosts(groupids);
  }
}
