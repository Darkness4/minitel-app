import 'package:freezed_annotation/freezed_annotation.dart';

part 'zabbix_interface.freezed.dart';

/// This is used to store interface data from a host.
@freezed
abstract class ZabbixInterface with _$ZabbixInterface {
  const factory ZabbixInterface({
    @required @nullable String ip,
  }) = _ZabbixInterface;
}
