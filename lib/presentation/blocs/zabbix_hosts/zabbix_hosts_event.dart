part of 'zabbix_hosts_bloc.dart';

class GetZabbixHostsEvent extends ZabbixHostsEvent {
  final int groupids;

  const GetZabbixHostsEvent(this.groupids);

  @override
  List<Object> get props => [groupids];
}

@immutable
abstract class ZabbixHostsEvent extends Equatable {
  const ZabbixHostsEvent();
}
