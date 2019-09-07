import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/ap_model/switch_status.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/switch_model/switch_port_statistics.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/switch_model/switch_status.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';
import 'package:minitel_toolbox/core/services/zabbix_api.dart';
import 'package:provider/provider.dart';

class ZabbixTab extends StatelessWidget {
  const ZabbixTab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          const _SwitchesCard(),
          const Divider(),
          const _AccessPointsCard(),
        ],
      ),
    );
  }
}

class _SwitchesCard extends StatelessWidget {
  const _SwitchesCard({
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
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const CircularProgressIndicator();
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(
                  snapshot.error.toString(),
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                );
              } else {
                return Column(
                  children: <Widget>[
                    for (ZabbixHost host in snapshot.data) ...<Widget>[
                      _SwitchBody(host),
                    ],
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

class _SwitchBody extends StatelessWidget {
  final SwitchStatus _status;
  final String _hostname;

  _SwitchBody(
    ZabbixHost host, {
    Key key,
  })  : _status = SwitchStatus.fromHost(host),
        _hostname = host.host,
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
            Text(
              'Ping : ${_status.pingResponseTime * 1e3} ms',
              style: Theme.of(context).textTheme.body1.apply(
                  color:
                      _status.pingResponseTime < 5 ? Colors.green : Colors.red),
            ),
            Text(
              _status.available == 1 ? 'SNMP Available' : 'Errors',
              style: Theme.of(context).textTheme.body1.apply(
                    fontWeightDelta: 4,
                    color: _status.available == 1 ? Colors.green : Colors.red,
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

class _AccessPointsCard extends StatelessWidget {
  const _AccessPointsCard({
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
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
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

  _AccessPointBody(
    ZabbixHost host, {
    Key key,
  })  : _status = APStatus.fromHost(host),
        _hostname = host.host,
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
            Text(
              _status.available == 1 ? 'SNMP Available' : 'Errors',
              style: Theme.of(context).textTheme.body1.apply(
                    fontWeightDelta: 4,
                    color: _status.available == 1 ? Colors.green : Colors.red,
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
