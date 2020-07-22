import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/repositories/zabbix_hosts_repository.dart';

part 'zabbix_hosts_cubit.freezed.dart';
part 'zabbix_hosts_state.dart';

@injectable
class ZabbixHostsCubit extends Cubit<ZabbixHostsState> {
  final ZabbixHostsRepository repository;

  ZabbixHostsCubit({
    @required this.repository,
  })  : assert(repository != null),
        super(const ZabbixHostsStateInitial());

  Future<void> getZabbixHosts(int groupids) async {
    emit(const ZabbixHostsStateLoading());
    try {
      final hosts = await repository.get(groupids);
      emit(ZabbixHostsStateLoaded(hosts));
    } on Exception catch (e) {
      emit(ZabbixHostsStateError(e));
    }
  }
}
