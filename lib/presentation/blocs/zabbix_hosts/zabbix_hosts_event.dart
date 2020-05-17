part of 'zabbix_hosts_bloc.dart';

@freezed
abstract class ZabbixHostsEvent with _$ZabbixHostsEvent {
  const factory ZabbixHostsEvent.get(int groupids) = GetZabbixHostsEvent;
}
