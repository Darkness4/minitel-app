import 'dart:async';

import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/diagnosis_suite.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportingPage extends StatefulWidget {
  final String title;
  final String channel;

  const ReportingPage(
      {Key key, this.title, this.channel: "projet_flutter_notif"})
      : super(key: key);

  @override
  ReportingPageState createState() => ReportingPageState();
}

class ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  /// 0 = None, 1 = Loading, 2 = Done
  int _reportState = 0;

  /// 0 = None, 1 = Loading, 2 = Done
  int _diagnosisState = 0;
  double _percentageDiagnoseProgress = 0.0;
  String _report = "";
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.red,
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Scrollbar(
            child: ListView(children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
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
              DocCard(
                elevation: 4,
                children: <Widget>[
                  Header(AppLoc.of(context).sentenceReportingTitle),
                  Header(AppLoc.of(context).sentenceReportingNOTE, level: 2),
                  Header(AppLoc.of(context).sentenceReportingSubTitle1,
                      level: 2),
                  Header(AppLoc.of(context).sentenceReportingSubtitle2,
                      level: 2),
                  Header(AppLoc.of(context).sentenceReportingSubtitle3,
                      level: 2),
                  Paragraph(AppLoc.of(context).sentenceReportingParagraph),
                  Header(AppLoc.of(context).sentenceReportingSubtitle4,
                      level: 2),
                  Header(AppLoc.of(context).sentenceReportingSubtitle5,
                      level: 2),
                ],
              ),
              DocCard(
                elevation: 4,
                children: <Widget>[
                  Header("Contacts"),
                  Header("Facebook: Minitel Ismin", level: 2),
                  Header("G*: Contact Admin", level: 2),
                  Header("Mail: minitelismin@gmail.com", level: 2),
                ],
              ),
            ]),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children:
                  buildFloatingActionButtons(context, channel: widget.channel),
            ),
      ),
    );
  }

  List<Widget> buildFloatingActionButtons(BuildContext ctxt,
      {String channel: "projet_flutter_notif"}) {
    var lsWidgets = <Widget>[
      _buildShareButton(),
      _buildMailButton(),
      _buildReportButton(ctxt, channel: channel),
      _buildDiagnosisButton(),
    ];

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

  Future<DateTime> getTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    final timeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(timeout);
  }

  setTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }

  Widget _buildDiagnosisButton() {
    return FloatingActionButton(
      backgroundColor: _diagnosisState == 2 ? Colors.green : Colors.blue,
      onPressed: () {
        if (!_controller.isDismissed) _controller.reverse();
        if (_diagnosisState != 1) {
          setState(() => _diagnosisState = 1);
          _percentageDiagnoseProgress = 0.0;
          Timer.periodic(
              const Duration(seconds: 1),
              (Timer t) =>
                  setState(() => _percentageDiagnoseProgress += 1 / 60));
          diagnose(context).then((diagnosis) {
            _report = diagnosis;
            setState(() => _diagnosisState = 2);
          });
        }
      },
      child: _buildDiagnosisIcon(),
    );
  }

  Widget _buildDiagnosisIcon() {
    switch (_diagnosisState) {
      case 0:
        return Icon(Icons.zoom_in);
        break;
      case 1:
        return CircularProgressIndicator(
          value: _percentageDiagnoseProgress,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        if (_controller.isDismissed) _controller.forward();
        return Icon(Icons.done);
        break;
      default:
        return Text("");
    }
  }

  Widget _buildReportButton(BuildContext ctxt,
      {String channel: "projet_flutter_notif"}) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          if (_reportState != 1) {
            setState(() => _reportState = 1);
            getTimeout().then((timeout) {
              if (DateTime.now().isAfter(timeout))
                report(
                  "_${_descriptionController.text}_\n\n"
                  "*Diagnosis*\n"
                  "$_report",
                  title: _titleController.text,
                  channel: channel,
                ).then((status) {
                  if (status == "ok") {
                    setTimeout();
                    setState(() => _reportState = 2);
                  } else {
                    setState(() => _reportState = 0);
                  }
                  Scaffold.of(ctxt).showSnackBar(SnackBar(
                    content: Text(status),
                  ));
                });
              else {
                _reportState = 0;
                Scaffold.of(ctxt).showSnackBar(SnackBar(
                  content: Text("Wait until ${timeout.hour}:${timeout.minute}"),
                ));
              }
            });
          }
        },
        child: _buildReportIcon(),
        backgroundColor: _reportState == 2 ? Colors.green : Colors.red,
        foregroundColor: Colors.black,
        mini: true,
      ),
    );
  }

  Widget _buildReportIcon() {
    switch (_reportState) {
      case 0:
        return Image.asset("assets/img/Slack_Mark_Monochrome_White.png");
        break;
      case 1:
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        return Icon(
          Icons.done,
          color: Colors.white,
        );
        break;
      default:
        return Text("");
    }
  }

  Widget _buildShareButton() {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.red,
        child: Icon(Icons.share),
        mini: true,
        onPressed: () =>
            Share.share("---Report ${DateTime.now().toString()}---\n\n"
                "Titre: ${_titleController.text}\n"
                "Description: ${_descriptionController.text}\n\n"
                "*Diagnosis*\n"
                "$_report"),
      ),
    );
  }

  Widget _buildMailButton() {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
      child: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.red,
          child: Icon(Icons.mail),
          mini: true,
          onPressed: () async {
            var body = "---Report ${DateTime.now().toString()}---\n\n"
                "Titre: ${_titleController.text}\n"
                "Description: ${_descriptionController.text}\n\n"
                "*Diagnosis*\n"
                "$_report";
            _launchURL(
                "mailto:minitelismin@gmail.com?subject=${_titleController.text}&body=$body");
          }),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
