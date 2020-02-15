import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/widgets/cards/zabbix_widgets/zabbix_widgets.dart';

class ZabbixScreen extends StatelessWidget {
  const ZabbixScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("From Zabbix."),
            ),
          ),
          const Divider(),
          const ServersCard(),
          const Divider(),
          const SwitchesCard(),
          const Divider(),
          const AccessPointsCard(),
        ],
      ),
    );
  }
}
