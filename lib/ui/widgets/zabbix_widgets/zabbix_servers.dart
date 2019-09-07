import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/servers_model/server_status.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_host.dart';
import 'package:minitel_toolbox/core/models/zabbix_api/zabbix_interface.dart';
import 'package:minitel_toolbox/core/services/zabbix_api.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class ServersCard extends StatelessWidget {
  const ServersCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<List<ZabbixHost>>(
        future: Provider.of<ZabbixAPI>(context).getZabbixHosts(
          ApiConstants.zabbixServers,
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
                    for (ZabbixHost host in snapshot.data) _ServerBody(host),
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

class _ServerBody extends StatelessWidget {
  final ServerStatus _status;
  final String _hostname;
  final List<ZabbixInterface> _interfaces;

  _ServerBody(
    ZabbixHost host, {
    Key key,
  })  : _status = ServerStatus.fromHost(host),
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
              _status.icmpAvailable == 1 ? 'ICMP Available' : 'Errors',
              style: Theme.of(context).textTheme.body1.apply(
                    fontWeightDelta: 4,
                    color:
                        _status.icmpAvailable == 1 ? Colors.green : Colors.red,
                  ),
            ),
            Text(
              'Ping : ${_status.pingResponseTime * 1e3} ms',
              style: Theme.of(context).textTheme.body1.apply(
                  color:
                      _status.pingResponseTime < 5 ? Colors.green : Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
