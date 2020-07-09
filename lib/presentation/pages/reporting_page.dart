import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/diagnosis/diagnosis_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/report/report_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/report_status/report_status_bloc.dart';
import 'package:minitel_toolbox/presentation/pages/reporting/diagnose_screen.dart';
import 'package:minitel_toolbox/presentation/pages/reporting/report_screen.dart';
import 'package:minitel_toolbox/presentation/pages/reporting/zabbix_screen.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/widgets/buttons.dart';
import 'package:minitel_toolbox/presentation/widgets/drawers/main_drawer.dart';

class ReportingPage extends StatefulWidget {
  final String title;

  const ReportingPage({Key key, this.title}) : super(key: key);

  @override
  ReportingPageState createState() => ReportingPageState();
}

class ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<double> _percentageDiagnoseProgress =
      ValueNotifier<double>(0.0);

  AnimationController _animationController;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ReportBloc>()),
        BlocProvider(create: (_) => sl<DiagnosisBloc>()),
        BlocProvider(create: (_) => sl<ReportStatusBloc>()),
      ],
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: BlocListener<ReportBloc, ReportState>(
            listener: (context, state) {
              if (state is ReportDone) {
                if (state.status != null) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.status),
                  ));
                }
              }
            },
            child: NestedScrollView(
              key: const Key(Keys.reportingTab),
              headerSliverBuilder: _headerSliverBuilder,
              body: const TabBarView(
                children: <Widget>[
                  ReportScreen(),
                  DiagnoseScreen(),
                  ZabbixScreen(),
                ],
              ),
            ),
          ),
          drawer: const MainDrawer(
            currentRoutePaths: RoutePaths.reporting,
          ),
          floatingActionButton: Builder(
            builder: (BuildContext context) => Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                _shareButton(context),
                _mailButton(context),
                _reportButton(context),
                BlocBuilder<DiagnosisBloc, DiagnosisState>(
                  builder: _diagnosisButton,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController?.dispose();
    _percentageDiagnoseProgress.dispose();
    super.dispose();
  }

  Widget _diagnosisButton(BuildContext context, DiagnosisState state) =>
      FloatingActionButton(
        backgroundColor: state is DiagnosisLoaded ? Colors.green : Colors.blue,
        onPressed: () {
          if (state is! DiagnosisLoading) {
            if (!_animationController.isDismissed) {
              _animationController.reverse();
            }

            context.bloc<DiagnosisBloc>().add(const DiagnosisRun());
            _percentageDiagnoseProgress.value = 0;
            _timer?.cancel();
            _timer = Timer.periodic(
              const Duration(seconds: 1),
              (Timer t) => _percentageDiagnoseProgress.value += 1 / 60,
            );
          }
        },
        child: _diagnosisIcon(context, state),
      );

  Widget _diagnosisIcon(BuildContext context, DiagnosisState state) {
    if (state is DiagnosisInitial || state is DiagnosisError) {
      return const Icon(
        Icons.zoom_in,
        key: Key(Keys.reportingFAB),
      );
    } else if (state is DiagnosisLoading) {
      return ValueListenableBuilder<double>(
        valueListenable: _percentageDiagnoseProgress,
        builder: (BuildContext context, double value, _) =>
            CircularProgressIndicator(
          value: value,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      );
    } else if (state is DiagnosisLoaded) {
      if (_animationController.isDismissed) {
        _animationController.forward();
      }
      return const Icon(
        Icons.done,
        key: Key(Keys.reportingFABDone),
      );
    } else {
      return null;
    }
  }

  List<Widget> _headerSliverBuilder(
          BuildContext context, bool innerBoxIsScrolled) =>
      <Widget>[
        SliverAppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).brightness == Brightness.light
              ? MinitelColors.reportPrimaryColor
              : Theme.of(context).primaryColor,
          pinned: true,
          floating: true,
          forceElevated: true,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: <Tab>[
              Tab(
                icon: Icon(
                  Icons.warning,
                  key: Key(Keys.reportingTab),
                ),
                text: 'Report',
              ),
              Tab(
                icon: Icon(
                  Icons.zoom_in,
                  key: Key(Keys.diagnosisTab),
                ),
                text: 'Diagnosis',
              ),
              Tab(
                icon: Icon(
                  Icons.settings_ethernet,
                  key: Key(Keys.zabbixTab),
                ),
                text: 'Network',
              ),
            ],
          ),
        ),
      ];

  Widget _mailButton(BuildContext context) => AnimatedFloatingButton(
        'Mail',
        end: 0.5,
        controller: _animationController,
        onPressed: () {
          final reportStatusState = context.bloc<ReportStatusBloc>().state;
          final diagnosisState = context.bloc<DiagnosisBloc>().state;
          if (diagnosisState is DiagnosisLoaded && reportStatusState.isValid) {
            context.bloc<ReportBloc>().add(ReportToMail(
                  description: reportStatusState.description,
                  name: reportStatusState.name,
                  room: reportStatusState.room,
                  title: reportStatusState.title,
                  diagnosis: diagnosisState.diagnosis,
                ));
          } else if (!reportStatusState.isValid) {
            _showNotValidSnackbar(reportStatusState, context);
          }
        },
        child: const Icon(Icons.mail),
      );

  void _showNotValidSnackbar(
      ReportStatusState reportStatusState, BuildContext context) {
    if (!reportStatusState.isValidName) {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('Identity is not valid.'),
      ));
    } else if (!reportStatusState.isValidRoom) {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('Room is not valid.'),
      ));
    } else if (!reportStatusState.isValidTitle) {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text('Title is not valid.'),
      ));
    }
  }

  Widget _reportButton(BuildContext context) => AnimatedFloatingButton(
        AppLoc.of(context).reporting.slack,
        end: 0.25,
        controller: _animationController,
        onPressed: () {
          final reportStatusState = context.bloc<ReportStatusBloc>().state;
          final diagnosisState = context.bloc<DiagnosisBloc>().state;
          if (diagnosisState is DiagnosisLoaded && reportStatusState.isValid) {
            context.bloc<ReportBloc>().add(ReportToSlack(
                  description: reportStatusState.description,
                  name: reportStatusState.name,
                  room: reportStatusState.room,
                  title: reportStatusState.title,
                  diagnosis: diagnosisState.diagnosis,
                  channel: 'minitel_toolbox_notifications',
                ));
          } else if (!reportStatusState.isValid) {
            _showNotValidSnackbar(reportStatusState, context);
          }
        },
        child: const ImageIcon(
          AssetImage(AssetPaths.slack),
          size: 100.0,
          key: Key(Keys.sendToSlack),
        ),
      );

  Widget _shareButton(BuildContext context) => AnimatedFloatingButton(
        AppLoc.of(context).reporting.share,
        controller: _animationController,
        onPressed: () {
          final reportStatusState = context.bloc<ReportStatusBloc>().state;
          final diagnosisState = context.bloc<DiagnosisBloc>().state;
          if (diagnosisState is DiagnosisLoaded && reportStatusState.isValid) {
            context.bloc<ReportBloc>().add(ReportToShare(
                  description: reportStatusState.description,
                  name: reportStatusState.name,
                  room: reportStatusState.room,
                  title: reportStatusState.title,
                  diagnosis: diagnosisState.diagnosis,
                ));
          } else if (!reportStatusState.isValid) {
            _showNotValidSnackbar(reportStatusState, context);
          }
        },
        child: const Icon(Icons.share),
      );
}
