import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/viewmodels/views/reporting_view_model.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
import 'package:minitel_toolbox/ui/widgets/buttons.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';

import 'reporting_tabs/diagnose_tab.dart';
import 'reporting_tabs/report_tab.dart';

class ReportingView extends StatefulWidget {
  final String title;

  const ReportingView({Key key, this.title}) : super(key: key);

  @override
  ReportingViewState createState() => ReportingViewState();
}

class ReportingViewState extends State<ReportingView>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<ReportingViewModel>(
      model: ReportingViewModel(
        webhookAPI: Provider.of(context),
        gatewayAPI: Provider.of(context),
      ),
      builder: (BuildContext context, ReportingViewModel model, Widget child) =>
          DefaultTabController(
        length: 2,
        child: Scaffold(
          body: NestedScrollView(
            key: const Key('reporting_view/tabs'),
            headerSliverBuilder: _headerSliverBuilder,
            body: TabBarView(
              children: <Widget>[
                child,
                DiagnoseTab(diagnosis: model.diagnosis),
              ],
            ),
          ),
          drawer: const MainDrawer(
            currentRoutePaths: RoutePaths.Reporting,
          ),
          floatingActionButton: Builder(
            builder: (BuildContext context) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _shareButton(model),
                _mailButton(model),
                _reportButton(context, model),
                _diagnosisButton(model),
              ],
            ),
          ),
        ),
      ),
      child: ReportTab(
        titleController: _titleController,
        descriptionController: _descriptionController,
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

  Widget _diagnosisButton(ReportingViewModel model) => FloatingActionButton(
        backgroundColor: model.diagnosisState == ButtonState.Done
            ? Colors.green
            : Colors.blue,
        onPressed: () async {
          if (!_animationController.isDismissed) {
            _animationController.reverse();
          }
          await model.diagnose();
          setState(() {});
        },
        child: _diagnosisIcon(model),
      );

  Widget _diagnosisIcon(ReportingViewModel model) {
    Widget child;
    switch (model.diagnosisState) {
      case ButtonState.None:
        child = const Icon(
          Icons.zoom_in,
          key: Key('reporting_view/diagnose'),
        );
        break;
      case ButtonState.Loading:
        child = ValueListenableBuilder<double>(
          valueListenable: model.percentageDiagnoseProgress,
          builder: (BuildContext context, double value, _) =>
              CircularProgressIndicator(
            value: value,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        );
        break;
      case ButtonState.Done:
        if (_animationController.isDismissed) {
          _animationController.forward();
        }
        child = const Icon(
          Icons.done,
          key: Key('reporting_view/diagnose_done'),
        );
        break;
    }
    return child;
  }

  List<Widget> _headerSliverBuilder(
          BuildContext context, bool innerBoxIsScrolled) =>
      <Widget>[
        SliverAppBar(
          title: Text(widget.title),
          backgroundColor: MinitelColors.ReportPrimaryColor,
          pinned: true,
          floating: true,
          forceElevated: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Tab>[
              Tab(
                icon: Icon(
                  Icons.warning,
                  key: Key('reporting_view/reporting_tab'),
                ),
                text: "Report",
              ),
              Tab(
                icon: Icon(
                  Icons.zoom_in,
                  key: Key('reporting_view/diagnosis_tab'),
                ),
                text: "Diagnosis",
              ),
            ],
          ),
        ),
      ];

  Widget _mailButton(ReportingViewModel model) => AnimatedFloatingButton(
        "Email",
        start: 0.0,
        end: 0.5,
        controller: _animationController,
        onPressed: () async {
          final String body = "---Report ${DateTime.now().toString()}---\n\n"
              "Titre: ${_titleController.text}\n"
              "Description: ${_descriptionController.text}\n\n"
              "*Diagnosis*\n"
              "${await model.diagnosis.reportAll}";
          await LaunchURL.launchURL(
              "mailto:minitelismin@gmail.com?subject=${_titleController.text}&body=$body");
        },
        child: const Icon(Icons.mail),
      );

  Widget _reportButton(BuildContext context, ReportingViewModel model) =>
      AnimatedFloatingButton(
        "Notifier sur Slack",
        start: 0.0,
        end: 0.25,
        controller: _animationController,
        onPressed: () async {
          final String status = await model.reportToSlack(
              _titleController.text, _descriptionController.text);
          if (status != null) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(status),
              ),
            );
          }
        },
        child: const ImageIcon(
          AssetImage("assets/img/Slack_Mark_Monochrome_White.png"),
          size: 100.0,
          key: Key('reporting_view/slack'),
        ),
      );

  Widget _shareButton(ReportingViewModel model) => AnimatedFloatingButton(
        "Partager",
        start: 0.0,
        end: 1.0,
        controller: _animationController,
        onPressed: () async =>
            Share.share("---Report ${DateTime.now().toString()}---\n\n"
                "Titre: ${_titleController.text}\n"
                "Description: ${_descriptionController.text}\n\n"
                "*Diagnosis*\n"
                "${await model.diagnosis.reportAll}"),
        child: const Icon(Icons.share),
      );
}
