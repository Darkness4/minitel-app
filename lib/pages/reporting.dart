import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_login_flutter/funcs/diagnosis_suite.dart';
import 'dart:async';

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

  @override
  void dispose() {
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
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
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
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
              label: Text(
                'Report',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                getTimeout().then((timeout) {
                  if (true) // DateTime.now().isAfter(timeout)
                    diagnose(context).then((diagnosis) {
                      report(
                              "_${_descriptionController.text}_\n\n"
                              "*Diagnosis*\n"
                              "$diagnosis",
                              title: _titleController.text)
                          .then((status) {
                        if (status == "ok") setTimeout();
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text(status),
                        ));
                      });
                    });
                  else
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content:
                          Text("Wait until ${timeout.hour}:${timeout.minute}"),
                    ));
                });
              },
              //onPressed: _incrementCounter,
              tooltip: 'Report',
              icon: Icon(
                Icons.send,
                color: Colors.white,
              ),
              backgroundColor: Colors.red,
              foregroundColor: Colors.black,
            ),
      ),
    );
  }
}
