import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

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
                _diagnosis.alert ?? "",
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
                  child: FutureBuilder<String>(
                    // TODO: Fix bullshit
                    future: _diagnosis.report[DiagnosisContent.ssid],
                    builder: (context, ssidSnapshot) {
                      if (ssidSnapshot.hasData) {
                        return FutureBuilder<String>(
                          future: _diagnosis.report[DiagnosisContent.ip],
                          builder: (context, ipSnapshot) {
                            if (ipSnapshot.hasData) {
                              return Text(
                                "${DiagnosisContent.ssid}: ${ssidSnapshot.data}, ${DiagnosisContent.ip}: ${ipSnapshot.data}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            } else {
                              return Text(
                                "${DiagnosisContent.ssid}: ${ssidSnapshot.data}, ${DiagnosisContent.ip}: ",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                            }
                          },
                        );
                      }
                      return Text(
                        "${DiagnosisContent.ssid}: , ${DiagnosisContent.ip}: ",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
              for (String item in DiagnosisContent())
                if (item != DiagnosisContent.ssid &&
                    item != DiagnosisContent.ip) // Ignore them
                  FutureBuilder<String>(
                    future: _diagnosis.report[item],
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return LogCard(
                            "",
                            title: item,
                          );
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return LogCard(
                            '...',
                            title: item,
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          } else {
                            return LogCard(
                              snapshot.data,
                              title: item,
                            );
                          }
                      }
                      return null; // unreachable
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
