import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/core/services/diagnosis_api.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:provider/provider.dart';

class DiagnoseTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Diagnosis _diagnosis = Provider.of<DiagnosisAPI>(context).diagnosis;
    return Scrollbar(
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
                  future: _diagnosis.ip.content,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> ipSnapshot) {
                    String output = "${_diagnosis.ip.title}: ";
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
          for (DiagnosisItem item in _diagnosis)
            if (item.title != _diagnosis.ip.title) // Ignore them
              FutureBuilder<String>(
                future: item.content,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) =>
                        LogCard(
                  _reportData(snapshot),
                  title: item.title,
                  key: Key('diagnose_tab/${item.title}'),
                ),
              ),
        ],
      ),
    );
  }

  String _reportData(AsyncSnapshot<String> snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return '';
      case ConnectionState.active:
      case ConnectionState.waiting:
        return '...';
      case ConnectionState.done:
        if (snapshot.hasError) {
          return '${snapshot.error}';
        } else {
          return snapshot.data;
        }
    }
    return null;
  }
}
