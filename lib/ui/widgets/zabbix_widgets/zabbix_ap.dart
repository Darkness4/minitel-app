import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/ap_model/switch_status.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_interface.dart';
import 'package:minitel_toolbox/core/services/zabbix_api.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class AccessPointsCard extends StatelessWidget {
  const AccessPointsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<ZabbixHost>>(
        future: Provider.of<ZabbixAPI>(context).getZabbixHosts(
          ApiConstants.zabbixAP,
          ApiConstants.zabbixPath,
          token: ApiConstants.zabbixToken,
        ),
        builder:
            (BuildContext context, AsyncSnapshot<List<ZabbixHost>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: MinitelTextStyles.error,
                );
              } else {
                return Column(
                  children: <Widget>[
                    for (ZabbixHost host in snapshot.data)
                      _AccessPointBody(host),
                  ],
                );
              }
          }
          return null;
        },
      ),
    );
  }
}

class _AccessPointBody extends StatelessWidget {
  final APStatus _status;
  final String _hostname;
  final List<ZabbixInterface> _interfaces;

  _AccessPointBody(
    ZabbixHost host, {
    Key key,
  })  : _status = APStatus.fromHost(host),
        _hostname = host.host,
        _interfaces = host.interfaces,
        super(key: key);

  @override
  Widget build(BuildContext context) {
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
            for (final ZabbixInterface interface in _interfaces)
              Text('IP : ${interface.ip}'),
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
              'Users: ${_status.users}\n'
              '2G Usage: ${_status.utilization2G} %\n'
              '5G Usage: ${_status.utilization5G} %',
              style: Theme.of(context).textTheme.body2,
            ),
          ],
        ),
      ),
    );
  }
}
