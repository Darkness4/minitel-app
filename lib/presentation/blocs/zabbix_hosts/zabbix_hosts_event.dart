import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class GetZabbixHostsEvent extends ZabbixHostsEvent {
  final int groupids;
  final String zabbixPath;

  const GetZabbixHostsEvent(this.groupids, this.zabbixPath);

  @override
  List<Object> get props => [groupids, zabbixPath];
}

@immutable
abstract class ZabbixHostsEvent extends Equatable {
  const ZabbixHostsEvent();
}
