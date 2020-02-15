part of 'zabbix_hosts_bloc.dart';

@immutable
abstract class ZabbixHostsState extends Equatable {
  const ZabbixHostsState();

  @override
  List<Object> get props => [];
}

class ZabbixHostsStateError extends ZabbixHostsState {
  final dynamic error;

  const ZabbixHostsStateError({@required this.error});

  @override
  List<Object> get props => [error];
}

class ZabbixHostsStateInitial extends ZabbixHostsState {
  const ZabbixHostsStateInitial();
}

class ZabbixHostsStateLoaded extends ZabbixHostsState {
  final List<ZabbixHost> hosts;

  const ZabbixHostsStateLoaded({@required this.hosts});

  @override
  List<Object> get props => [hosts];
}

class ZabbixHostsStateLoading extends ZabbixHostsState {
  const ZabbixHostsStateLoading();
}
