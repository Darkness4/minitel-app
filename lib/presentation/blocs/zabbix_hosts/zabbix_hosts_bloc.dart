import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';

import 'bloc.dart';

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
      yield const ZabbixHostsStateLoading();
      try {
        final hosts = await repository.get(
          event.groupids,
          event.zabbixPath,
          token: ApiConstants.zabbixToken,
        );
        yield ZabbixHostsStateLoaded(hosts: hosts);
      } catch (e) {
        yield ZabbixHostsStateError(message: e.toString());
      }
    }
  }
}
