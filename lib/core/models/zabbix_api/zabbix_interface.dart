/// This is used to store interface data from a host.
class ZabbixInterface {
  final String dns;
  final String ip;

  const ZabbixInterface({
    this.dns,
    this.ip,
  });

  factory ZabbixInterface.fromJson(Map<String, dynamic> json) {
    return ZabbixInterface(
      dns: json['dns'] as String,
      ip: json['ip'] as String,
    );
  }
}
