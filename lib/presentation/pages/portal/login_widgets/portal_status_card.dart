import 'package:flutter/material.dart';
import 'package:minitel_toolbox/presentation/pages/portal/login_widgets/calendar_status_widget.dart';
import 'package:minitel_toolbox/presentation/pages/portal/login_widgets/imprimante_status_widget.dart';
import 'package:minitel_toolbox/presentation/pages/portal/login_widgets/portail_emse_status_widget.dart';
import 'package:minitel_toolbox/presentation/pages/portal/login_widgets/stormshield_status_widget.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const <Widget>[
            StormshieldStatusWidget(),
            CalendarStatusWidget(),
            PortailEmseStatusWidget(),
            ImprimanteStatusWidget(),
          ],
        ),
      ),
    );
  }
}
