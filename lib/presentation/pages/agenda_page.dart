import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/cubits/agenda/agenda_cubit.dart';
import 'package:minitel_toolbox/presentation/cubits/news/notification_settings/notification_settings_cubit.dart';
import 'package:minitel_toolbox/presentation/pages/agenda/agenda_widgets/agenda_widgets.dart';
import 'package:minitel_toolbox/presentation/pages/agenda/notification_settings_page.dart';
import 'package:minitel_toolbox/presentation/widgets/drawers/main_drawer.dart';

class AgendaPage extends StatelessWidget {
  final String title;

  const AgendaPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(
                MaterialPageRoute(
                  builder: (context) => const NotificationSettingsPage(),
                ),
              );
            },
          )
        ],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AgendaCubit>(
            create: (context) =>
                sl<AgendaCubit>(param1: sl<NotificationSettingsCubit>()),
          ),
        ],
        child: const AgendaContent(),
      ),
      drawer: const MainDrawer(
        currentRoutePaths: RoutePaths.agenda,
      ),
    );
  }
}

class AgendaContent extends StatelessWidget {
  const AgendaContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<AgendaCubit, AgendaState>(
        builder: (context, state) {
          return state.when(
            initial: () =>
                const CircularProgressIndicator(backgroundColor: Colors.white),
            loading: () =>
                const CircularProgressIndicator(backgroundColor: Colors.white),
            error: (exception) => ErrorAgendaWidget(exception),
            loaded: (events) => StreamBuilder<List<Widget>>(
              stream: _listEventCards(context, events),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                if (snapshot.hasData) {
                  return OrientationBuilder(
                    builder: (BuildContext context, Orientation orientation) {
                      return PageView(
                        controller: PageController(
                            viewportFraction:
                                _viewportFraction(orientation, context)),
                        pageSnapping: _pageSnapping(context),
                        children: snapshot.data!,
                      );
                    },
                  );
                } else {
                  return const CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }

  bool _pageSnapping(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide < 600;
  }

  double _viewportFraction(Orientation orientation, BuildContext context) {
    if (orientation == Orientation.portrait &&
        MediaQuery.of(context).size.shortestSide < 600) {
      return 0.9;
    } else {
      return 0.7;
    }
  }

  Stream<List<Widget>> _listEventCards(
      BuildContext context, Iterable<Event> events) async* {
    var monthlyWidgets = <Widget>[];
    var dailyEvents = <Widget>[];
    final monthPages = <Widget>[];
    DateTime? oldDt;

    if (events.isEmpty) {
      yield <Widget>[
        Center(
          child: Text(
            AppLoc.of(context).agenda.cases[
                Random().nextInt(AppLoc.of(context).agenda.cases.length)],
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ];
    } else {
      yield monthPages;
      DateTime dt;

      for (final event in events) {
        dt = event.dtstart;

        // New Month
        if (dt.month != oldDt?.month) {
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(oldDt!, dailyEvents));
          }
          // Return the last month
          if (monthlyWidgets.isNotEmpty) {
            monthPages.add(MonthPage(oldDt!.month, monthlyWidgets));
          }
          oldDt = dt;

          monthlyWidgets = <Widget>[];
          monthlyWidgets.add(MonthHeader(
              DateFormat.MMMM(AppLoc.of(context).localeName)
                  .format(DateTime(dt.year, dt.month))));
          dailyEvents = <Widget>[];
        }

        // New Day
        if (dt.day != oldDt?.day) {
          // Return the last day
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(oldDt!, dailyEvents));
          }

          oldDt = dt;
          dailyEvents = <Widget>[]; // Clear Events
        }

        // Event Card
        dailyEvents.add(EventCard(event));
      }

      // Return the last day
      if (dailyEvents.isNotEmpty && monthlyWidgets.isNotEmpty) {
        monthlyWidgets.add(DayWidget(oldDt!, dailyEvents));
        monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
      }
    }
  }
}
