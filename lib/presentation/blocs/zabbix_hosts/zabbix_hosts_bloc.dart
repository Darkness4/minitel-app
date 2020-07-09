import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';

part 'zabbix_hosts_bloc.freezed.dart';
part 'zabbix_hosts_event.dart';
part 'zabbix_hosts_state.dart';

@injectable
class ZabbixHostsBloc extends Bloc<ZabbixHostsEvent, ZabbixHostsState> {
  final ZabbixHostsRepository repository;

  ZabbixHostsBloc({
    @required this.repository,
  })  : assert(repository != null),
        super(const ZabbixHostsStateInitial());

  @override
  Stream<ZabbixHostsState> mapEventToState(ZabbixHostsEvent event) {
    return event.when(get: _mapGetZabbixHostsEventToState);
  }

  Stream<ZabbixHostsState> _mapGetZabbixHostsEventToState(int groupids) async* {
    yield const ZabbixHostsStateLoading();
    try {
      final hosts = await repository.get(groupids);
      yield ZabbixHostsStateLoaded(hosts);
    } on Exception catch (e) {
      yield ZabbixHostsStateError(e);
    }
  }
}
