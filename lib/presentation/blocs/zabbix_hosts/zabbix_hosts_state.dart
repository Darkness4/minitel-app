import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';

@immutable
abstract class ZabbixHostsState extends Equatable {
  const ZabbixHostsState();
}

class ZabbixHostsStateError extends ZabbixHostsState {
  final String message;

  const ZabbixHostsStateError({@required this.message});

  @override
  List<Object> get props => [message];
}

class ZabbixHostsStateInitial extends ZabbixHostsState {
  const ZabbixHostsStateInitial();
  @override
  List<Object> get props => [];
}

class ZabbixHostsStateLoaded extends ZabbixHostsState {
  final List<ZabbixHost> hosts;

  const ZabbixHostsStateLoaded({@required this.hosts});

  @override
  List<Object> get props => [hosts];
}

class ZabbixHostsStateLoading extends ZabbixHostsState {
  const ZabbixHostsStateLoading();
  @override
  List<Object> get props => [];
}
