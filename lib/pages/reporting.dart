import 'dart:async';
import 'dart:io';

import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/diagnosis_suite.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReportingPage extends StatefulWidget {
  final String title;

  ReportingPage({Key key, this.title}) : super(key: key);

  @override
  _ReportingPageState createState() => _ReportingPageState();
}

class _ReportingPageState extends State<ReportingPage> {
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  int _reportState = 0; // 0 = None, 1 = Loading, 2 = Done
  int _diagnosisState = 0; // 0 = None, 1 = Loading, 2 = Done

  setTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }

  Future<DateTime> getTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    final timeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(timeout);
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/report.txt');
  }

  Future<File> writeReport(String contents) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsString(contents);
  }

  Future<String> readReport() async {
    try {
      final file = await _localFile;

      // Read the file
      return file.readAsString();
    } catch (e) {
      // If encountering an error, return 0
      return e.toString();
    }
  }

  Widget buildDiagnosisIcon() {
    switch (_diagnosisState) {
      case 0:
        return Icon(Icons.zoom_in);
        break;
      case 1:
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        return Icon(Icons.done);
        break;
      default:
        return Text("");
    }
  }

  Widget buildReportIcon() {
    switch (_reportState) {
      case 0:
        return Icon(Icons.send, color: Colors.white,);
        break;
      case 1:
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        return Icon(Icons.done, color: Colors.white,);
        break;
      default:
        return Text("");
    }
  }

  Widget buildReportButton(BuildContext ctxt) {
    return FloatingActionButton.extended(
      heroTag: null,
      label: Text(
        'Report',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        setState(() => _reportState = 1);
          getTimeout().then((timeout) {
            if (DateTime.now().isAfter(timeout))
              readReport().then((diagnosis) =>
                report(
                      "_${_descriptionController.text}_\n\n"
                      "*Diagnosis*\n"
                      "$diagnosis",
                      title: _titleController.text)
                  .then((status) {
                if (status == "ok") setTimeout();
                Scaffold.of(ctxt).showSnackBar(SnackBar(
                  content: Text(status),
                ));
              }).then((out) => setState(() => _reportState = 2)));
            else {
              _reportState = 0;
              Scaffold.of(ctxt).showSnackBar(SnackBar(
                content: Text("Wait until ${timeout.hour}:${timeout.minute}"),
              ));
            }
          });
      },
      tooltip: 'Report',
      icon: buildReportIcon(),
      backgroundColor: Colors.red,
      foregroundColor: Colors.black,
    );
  }

  List<Widget> buildFloatingActionButtons(BuildContext ctxt) {
    var lsWidgets = <Widget>[
      FloatingActionButton(
        backgroundColor: _diagnosisState == 2 ? Colors.green : Colors.blue,
        onPressed: () {
          setState(() => _diagnosisState = 1);
          diagnose(context).then((diagnosis) {
            writeReport(diagnosis);
            setState(() => _diagnosisState = 2);
          });
        },
        child: buildDiagnosisIcon(),
        mini: _diagnosisState == 2,
      ),
    ];
    if (_diagnosisState == 2) lsWidgets.add(buildReportButton(ctxt));

    return lsWidgets;
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    _titleFocusNode.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(children: <Widget>[
                  Card(
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: <Widget>[
                          TextField(
                            controller: _titleController,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            focusNode: _titleFocusNode,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              labelText: "Title",
                              hintText: "Room number : Short description.",
                            ),
                            onSubmitted: (term) {
                              _titleFocusNode.unfocus();
                              FocusScope.of(context)
                                  .requestFocus(_descriptionFocusNode);
                            },
                            autofocus: true,
                          ),
                          TextField(
                            controller: _descriptionController,
                            maxLines: null,
                            focusNode: _descriptionFocusNode,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              labelText: "Description",
                              hintText: "Describe your issue.",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  DocCard(
                    elevation: 4,
                    children: <Widget>[
                      Header("How to report without internet?"),
                      Header("1. Connect to 'WiFi Minitel'", level: 2),
                      Header("2. Run the diagnostic suite by pushing the button.", level: 2),
                      Header("3. Fill the report.", level: 2),
                      Paragraph("Example : \n"
                          "Title: 2012, no internet since monday.\n"
                          "Description: I'm loosing frequently the connection when i'm on Ethernet. Wifi is ok."),
                      Header("4. Connect to a working network.",
                          level: 2),
                      Header("5. Send the report.", level: 2),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: buildFloatingActionButtons(context),
            ),
      ),
    );
  }
}
