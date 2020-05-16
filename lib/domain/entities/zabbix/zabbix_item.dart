import 'package:freezed_annotation/freezed_annotation.dart';

part 'zabbix_item.freezed.dart';

/// This is used to store data from a host.
@freezed
abstract class ZabbixItem with _$ZabbixItem {
  const factory ZabbixItem({
    @required @nullable String type,
    @required @nullable int value_type,
    @required @nullable String name,
    @required @nullable String lastvalue,
    @required @nullable String units,
    @required @nullable String snmp_oid,
  }) = _ZabbixItem;
}
