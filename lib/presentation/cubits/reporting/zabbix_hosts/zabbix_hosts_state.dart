part of 'zabbix_hosts_cubit.dart';

@freezed
class ZabbixHostsState with _$ZabbixHostsState {
  const factory ZabbixHostsState.initial() = ZabbixHostsStateInitial;
  const factory ZabbixHostsState.loading() = ZabbixHostsStateLoading;
  const factory ZabbixHostsState.loaded(List<ZabbixHost> hosts) =
      ZabbixHostsStateLoaded;
  const factory ZabbixHostsState.error(Exception error) = ZabbixHostsStateError;
}
