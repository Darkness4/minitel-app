import 'dart:async';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/funcs/http_webhook.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'reporting_tabs/diagnose_tab.dart';
import 'reporting_tabs/report_tab.dart';

class ReportingPage extends StatefulWidget {
  final String title;

  const ReportingPage({Key key, this.title}) : super(key: key);

  @override
  ReportingPageState createState() => ReportingPageState();
}

class ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  AnimationController _animationController;

  var _diagnosis = Diagnosis();

  String _report = "";

  /// State of the Diagnosis.
  ///
  /// 0 = None, 1 = Loading, 2 = Done
  int _diagnosisState = 0;

  /// State of the "Send to Slack" action.
  ///
  /// 0 = None, 1 = Loading, 2 = Done
  int _reportState = 0;

  /// Used for the [CircularProgressIndicator], between 0.0 and 1.0.
  double _percentageDiagnoseProgress = 0.0;

  Widget get _diagnosisButton => FloatingActionButton(
        backgroundColor: _diagnosisState == 2 ? Colors.green : Colors.blue,
        onPressed: () async {
          if (!_animationController.isDismissed) _animationController.reverse();
          if (_diagnosisState != 1) {
            setState(() => _diagnosisState = 1);
            _percentageDiagnoseProgress = 0.0;
            Timer.periodic(
                const Duration(seconds: 1),
                (Timer t) =>
                    setState(() => _percentageDiagnoseProgress += 1 / 60));
            _diagnosis.diagnose(context).then((diagnosis) {
              _report = diagnosis;
              setState(() => _diagnosisState = 2);
            });
          }
        },
        child: _diagnosisIcon,
      );

  Widget get _diagnosisIcon {
    switch (_diagnosisState) {
      case 0:
        return const Icon(Icons.zoom_in);
        break;
      case 1:
        return CircularProgressIndicator(
          value: _percentageDiagnoseProgress,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        if (_animationController.isDismissed) _animationController.forward();
        return const Icon(Icons.done);
        break;
      default:
        return const Text("");
    }
  }

  Widget get _mailButton => ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              elevation: 4,
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: MinitelColors.ReportPrimaryColor,
              child: const Icon(Icons.mail),
              mini: true,
              onPressed: () async {
                var body = "---Report ${DateTime.now().toString()}---\n\n"
                    "Titre: ${_titleController.text}\n"
                    "Description: ${_descriptionController.text}\n\n"
                    "*Diagnosis*\n"
                    "$_report";
                _launchURL(
                    "mailto:minitelismin@gmail.com?subject=${_titleController.text}&body=$body");
              },
            ),
          ],
        ),
      );

  Widget get _reportIcon {
    switch (_reportState) {
      case 0:
        return Image.asset("assets/img/Slack_Mark_Monochrome_White.png");
        break;
      case 1:
        return const CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white));
        break;
      case 2:
        return const Icon(
          Icons.done,
          color: Colors.white,
        );
        break;
      default:
        return const Text("");
    }
  }

  Widget get _shareButton => ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Partager",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              elevation: 4,
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: MinitelColors.ReportPrimaryColor,
              child: const Icon(Icons.share),
              mini: true,
              onPressed: () =>
                  Share.share("---Report ${DateTime.now().toString()}---\n\n"
                      "Titre: ${_titleController.text}\n"
                      "Description: ${_descriptionController.text}\n\n"
                      "*Diagnosis*\n"
                      "$_report"),
            ),
          ],
        ),
      );

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
            SliverAppBar(
              title: Text(widget.title),
              backgroundColor: MinitelColors.ReportPrimaryColor,
              pinned: true,
              floating: true,
              forceElevated: true,
              bottom: const TabBar(
                indicatorColor: Colors.white,
                tabs: <Tab>[
                  const Tab(
                    icon: const Icon(Icons.warning),
                    text: "Report",
                  ),
                  const Tab(
                    icon: const Icon(Icons.zoom_in),
                    text: "Diagnosis",
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            children: <Widget>[
              ReportTab(
                titleController: _titleController,
                descriptionController: _descriptionController,
              ),
              DiagnoseTab(
                diagnosis: _diagnosis,
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        floatingActionButton: Builder(
          builder: (context) => Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              _shareButton,
              _mailButton,
              _buildReportButton(context),
              _diagnosisButton,
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<DateTime> getTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    final timeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(timeout);
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  Widget _buildReportButton(BuildContext ctxt,
      {String channel: "projet_flutter_notif"}) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Notifier sur Slack",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            elevation: 4,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              if (_reportState != 1) {
                setState(() => _reportState = 1);
                getTimeout().then(
                  (timeout) {
                    if (DateTime.now().isAfter(timeout))
                      report(
                        "_${_descriptionController.text}_\n\n"
                        "*Diagnosis*\n"
                        "$_report",
                        title: _titleController.text,
                        channel: channel,
                      ).then(
                        (status) {
                          if (status == "ok") {
                            _setTimeout();
                            setState(() => _reportState = 2);
                          } else {
                            setState(() => _reportState = 0);
                          }
                          Scaffold.of(ctxt).showSnackBar(
                            SnackBar(
                              content: Text(status),
                            ),
                          );
                        },
                      );
                    else {
                      _reportState = 0;
                      Scaffold.of(ctxt).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Wait until ${timeout.hour}:${timeout.minute}"),
                        ),
                      );
                    }
                  },
                );
              }
            },
            child: _reportIcon,
            backgroundColor: _reportState == 2 ? Colors.green : Colors.red,
            foregroundColor: Colors.black,
            mini: true,
          ),
        ],
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _setTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }
}
