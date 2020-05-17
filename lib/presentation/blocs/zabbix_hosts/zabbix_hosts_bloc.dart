import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';

part 'zabbix_hosts_bloc.freezed.dart';
part 'zabbix_hosts_event.dart';
part 'zabbix_hosts_state.dart';

class ZabbixHostsBloc extends Bloc<ZabbixHostsEvent, ZabbixHostsState> {
  final ZabbixHostsRepository repository;

  ZabbixHostsBloc({
    @required this.repository,
  }) : assert(repository != null);

  @override
  ZabbixHostsState get initialState => const ZabbixHostsStateInitial();

  @override
  Stream<ZabbixHostsState> mapEventToState(
    ZabbixHostsEvent event,
  ) async* {
    if (event is GetZabbixHostsEvent) {
      yield* _mapGetZabbixHostsEventToState(event);
    }
  }

  Stream<ZabbixHostsState> _mapGetZabbixHostsEventToState(
      GetZabbixHostsEvent event) async* {
    yield const ZabbixHostsStateLoading();
    try {
      final hosts = await repository.get(event.groupids);
      yield ZabbixHostsStateLoaded(hosts);
    } on Exception catch (e) {
      yield ZabbixHostsStateError(e);
    }
  }
}
