import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/ap/ap_status.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_host.dart';
import 'package:minitel_toolbox/domain/entities/zabbix/zabbix_interface.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/zabbix_hosts/zabbix_hosts_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/text_styles.dart';

class AccessPointsCard extends StatelessWidget {
  const AccessPointsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider<ZabbixHostsBloc>(
        create: (_) => sl<ZabbixHostsBloc>(),
        child: BlocBuilder<ZabbixHostsBloc, ZabbixHostsState>(
          builder: (context, state) {
            if (state is ZabbixHostsStateInitial) {
              context
                  .bloc<ZabbixHostsBloc>()
                  .add(const GetZabbixHostsEvent(ApiKeys.zabbixAP));
              return const CircularProgressIndicator();
            } else if (state is ZabbixHostsStateLoading) {
              return const CircularProgressIndicator();
            } else if (state is ZabbixHostsStateError) {
              return Text(
                state.error.toString(),
                style: MinitelTextStyles.error,
              );
            } else if (state is ZabbixHostsStateLoaded) {
              return Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  for (ZabbixHost host in state.hosts) _AccessPointBody(host),
                ],
              );
            } else {
              return null;
            }
          },
        ),
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
              style: Theme.of(context).textTheme.headline6,
            ),
            for (final ZabbixInterface interface in _interfaces)
              Text('IP : ${interface.ip}'),
            Text(
              _status.snmpAvailable == 1 ? 'SNMP Available' : 'Errors',
              style: Theme.of(context).textTheme.bodyText2.apply(
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
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
