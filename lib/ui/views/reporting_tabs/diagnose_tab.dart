import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class DiagnoseTab extends StatelessWidget {
  final Diagnosis _diagnosis;

  const DiagnoseTab({
    Key key,
    @required Diagnosis diagnosis,
  })  : _diagnosis = diagnosis,
        super(key: key);

  String _reportData(AsyncSnapshot<String> snapshot) {
    String output;
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        output = '';
        break;
      case ConnectionState.active:
      case ConnectionState.waiting:
        output = '...';
        break;
      case ConnectionState.done:
        if (snapshot.hasError) {
          output = '${snapshot.error}';
        } else {
          output = snapshot.data;
        }
        break;
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scrollbar(
        child: ListView(
          key: const Key('diagnose_tab/list'),
          children: <Widget>[
            Text(
              _diagnosis.alert ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
            Center(
              child: Chip(
                elevation: 2.0,
                backgroundColor: MinitelColors.ReportPrimaryColor,
                label: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FutureBuilder<String>(
                    future: _diagnosis.report[DiagnosisContent.ip],
                    builder: (context, ipSnapshot) {
                      String output = "${DiagnosisContent.ip}: ";
                      output += ipSnapshot.hasData ? ipSnapshot.data : "";
                      return Text(
                        output,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            for (String item in DiagnosisContent())
              if (item != DiagnosisContent.ip) // Ignore them
                FutureBuilder<String>(
                  future: _diagnosis.report[item],
                  builder: (BuildContext context, snapshot) => LogCard(
                    _reportData(snapshot),
                    title: item,
                    key: Key('diagnose_tab/$item'),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
