import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/core/services/http_webhook.dart';
import 'package:minitel_toolbox/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/buttons.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'reporting_tabs/diagnose_tab.dart';
import 'reporting_tabs/report_tab.dart';

Future<void> _setTimeout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(
      'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
}

enum ButtonState { None, Loading, Done }

class ReportingPage extends StatefulWidget {
  final String title;

  const ReportingPage({Key key, this.title}) : super(key: key);

  @override
  ReportingPageState createState() => ReportingPageState();
}

class ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final Diagnosis _diagnosis = Diagnosis();
  final WebhookAPI _webhook = WebhookAPI();
  final ValueNotifier<double> _percentageDiagnoseProgress =
      ValueNotifier<double>(0.0);

  ButtonState _diagnosisState = ButtonState.None;

  String _report = "";

  Widget get _diagnosisButton => FloatingActionButton(
        backgroundColor:
            _diagnosisState == ButtonState.Done ? Colors.green : Colors.blue,
        onPressed: () async {
          if (!_animationController.isDismissed) _animationController.reverse();
          if (_diagnosisState != ButtonState.Loading) {
            setState(() => _diagnosisState = ButtonState.Loading);
            _percentageDiagnoseProgress.value = 0.0;
            Timer.periodic(const Duration(seconds: 1),
                (Timer t) => _percentageDiagnoseProgress.value += 1 / 60);
            _diagnosis.diagnose().then((diagnosis) {
              _report = diagnosis;
              setState(() => _diagnosisState = ButtonState.Done);
            });
          }
        },
        child: _diagnosisIcon,
      );

  Widget get _diagnosisIcon {
    Widget child;
    switch (_diagnosisState) {
      case ButtonState.None:
        child = const Icon(Icons.zoom_in);
        break;
      case ButtonState.Loading:
        child = ValueListenableBuilder<double>(
          valueListenable: _percentageDiagnoseProgress,
          builder: (context, value, _) => CircularProgressIndicator(
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
        break;
      case ButtonState.Done:
        if (_animationController.isDismissed) _animationController.forward();
        child = const Icon(Icons.done);
        break;
    }
    return child;
  }

  Widget get _mailButton => AnimatedFloatingButton(
        "Email",
        start: 0.0,
        end: 0.5,
        child: Icon(Icons.mail),
        controller: _animationController,
        onPressed: () {
          var body = "---Report ${DateTime.now().toString()}---\n\n"
              "Titre: ${_titleController.text}\n"
              "Description: ${_descriptionController.text}\n\n"
              "*Diagnosis*\n"
              "$_report";
          LaunchURL.launchURL(
              "mailto:minitelismin@gmail.com?subject=${_titleController.text}&body=$body");
        },
      );

  Widget get _shareButton => AnimatedFloatingButton(
        "Partager",
        start: 0.0,
        end: 1.0,
        child: Icon(Icons.share),
        controller: _animationController,
        onPressed: () =>
            Share.share("---Report ${DateTime.now().toString()}---\n\n"
                "Titre: ${_titleController.text}\n"
                "Description: ${_descriptionController.text}\n\n"
                "*Diagnosis*\n"
                "$_report"),
      );

  Future<DateTime> get _timeout async {
    final prefs = await SharedPreferences.getInstance();
    final dateTimeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(dateTimeout);
  }

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
              _reportButton(context),
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

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  Widget _reportButton(BuildContext context, {String channel: "DE8PA0Z1C"}) =>
      AnimatedFloatingButton(
        "Notifier sur Slack",
        start: 0.0,
        end: 0.25,
        child: const ImageIcon(
          AssetImage("assets/img/Slack_Mark_Monochrome_White.png"),
          size: 100.0,
        ),
        controller: _animationController,
        onPressed: () async {
          DateTime timeout = await _timeout;
          String status;
          if (DateTime.now().isAfter(timeout)) {
            status = await _webhook.report(
              "_${_descriptionController.text}_\n\n"
              "*Diagnosis*\n"
              "$_report",
              title: _titleController.text,
              channel: channel,
            );
            if (status == "ok") _setTimeout();
          } else {
            status = "Wait until ${timeout.hour}:${timeout.minute}";
          }
          if (status != null)
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(status),
              ),
            );
        },
      );
}
