import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';

class DiagnoseTab extends StatelessWidget {
  final Diagnosis _diagnosis;

  const DiagnoseTab({
    Key key,
    @required Diagnosis diagnosis,
  })  : _diagnosis = diagnosis,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                _diagnosis.report["alert"],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              Material(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "${DiagnosisContent.ssid}: ${_diagnosis.report[DiagnosisContent.ssid]}, ${DiagnosisContent.ip}: ${_diagnosis.report[DiagnosisContent.ip]}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              for (String item in DiagnosisContent().all)
                if (item != DiagnosisContent.ssid &&
                    item != DiagnosisContent.ip) // Ignore them
                  LogCard(
                    _diagnosis.report[item],
                    title: item,
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
