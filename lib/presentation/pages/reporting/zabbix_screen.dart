import 'package:flutter/material.dart';

import 'zabbix_widgets/ap_card.dart';
import 'zabbix_widgets/servers_card.dart';
import 'zabbix_widgets/switches_card.dart';

class ZabbixScreen extends StatelessWidget {
  const ZabbixScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: const <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('From Zabbix.'),
            ),
          ),
          Divider(),
          ServersCard(),
          Divider(),
          SwitchesCard(),
          Divider(),
          AccessPointsCard(),
        ],
      ),
    );
  }
}
