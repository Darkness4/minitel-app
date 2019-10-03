import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/switch_model/switch_port_statistics.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/switch_model/switch_status.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_interface.dart';
import 'package:minitel_toolbox/core/services/zabbix_api.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class SwitchesCard extends StatelessWidget {
  const SwitchesCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<ZabbixHost>>(
        future: Provider.of<ZabbixAPI>(context).getZabbixHosts(
          ApiConstants.zabbixSwitches,
          ApiConstants.zabbixPath,
          token: ApiConstants.zabbixToken,
        ),
        builder:
            (BuildContext context, AsyncSnapshot<List<ZabbixHost>> snapshot) {
          if (snapshot.hasError) {
            return Text(
              snapshot.error.toString(),
              style: MinitelTextStyles.error,
            );
          }
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              return Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  for (ZabbixHost host in snapshot.data) ...<Widget>[
                    _SwitchBody(host),
                  ],
                ],
              );
          }
          return null;
        },
      ),
    );
  }
}

class _SwitchBody extends StatelessWidget {
  final SwitchStatus _status;
  final String _hostname;
  final List<ZabbixInterface> _interfaces;

  _SwitchBody(
    ZabbixHost host, {
    Key key,
  })  : _status = SwitchStatus.fromHost(host),
        _hostname = host.host,
        _interfaces = host.interfaces,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final SwitchPortStatistics statistics = _status.count();

    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              _hostname,
              style: Theme.of(context).textTheme.title,
            ),
            Text(
              _status.description,
              style: Theme.of(context).textTheme.subtitle,
            ),
            for (final ZabbixInterface interface in _interfaces)
              Text('IP : ${interface.ip}'),
            Text(
              'Ping : ${_status.pingResponseTime * 1e3} ms',
              style: Theme.of(context).textTheme.body1.apply(
                  color:
                      _status.pingResponseTime < 5 ? Colors.green : Colors.red),
            ),
            Text(
              _status.snmpAvailable == 1 ? 'SNMP Available' : 'Errors',
              style: Theme.of(context).textTheme.body1.apply(
                    fontWeightDelta: 4,
                    color:
                        _status.snmpAvailable == 1 ? Colors.green : Colors.red,
                  ),
            ),
            Text(
              'Uptime: ${_status.uptime.inDays} Days '
              '${_status.uptime.inHours.remainder(24)} Hours '
              '${_status.uptime.inMinutes.remainder(60)} Minutes '
              '${_status.uptime.inSeconds.remainder(60)} Seconds',
            ),
            Text(
              statistics.toString(),
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}
