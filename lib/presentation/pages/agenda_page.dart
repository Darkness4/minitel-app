import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/routes/routes.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/event.dart';
import 'package:minitel_toolbox/injection_container/injection_container.dart';
import 'package:minitel_toolbox/presentation/blocs/agenda/agenda_bloc.dart';
import 'package:minitel_toolbox/presentation/blocs/notification_settings/notification_settings_bloc.dart';
import 'package:minitel_toolbox/presentation/pages/agenda/notification_settings_page.dart';
import 'package:minitel_toolbox/presentation/widgets/agenda_widgets/agenda_widgets.dart';
import 'package:minitel_toolbox/presentation/widgets/drawers/main_drawer.dart';

class AgendaPage extends StatelessWidget {
  final String title;

  const AgendaPage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotificationSettingsBloc>(
          create: (_) => sl<NotificationSettingsBloc>()
            ..add(const NotificationSettingsLoad()),
        ),
        BlocProvider<AgendaBloc>(
          create: (context) => sl<AgendaBloc>(),
        ),
      ],
      child: Scaffold(
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
        body: Center(
          child:
              BlocListener<NotificationSettingsBloc, NotificationSettingsState>(
            listener: (context, state) {
              if (state.isLoaded) {
                final agendaState = context.bloc<AgendaBloc>().state;
                if (agendaState is AgendaInitial) {
                  context.bloc<AgendaBloc>().add(AgendaLoad(
                        notificationSettings: state.notificationSettings,
                      ));
                }
              }
            },
            child: BlocBuilder<AgendaBloc, AgendaState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const CircularProgressIndicator(
                      backgroundColor: Colors.white),
                  loading: () => const CircularProgressIndicator(
                      backgroundColor: Colors.white),
                  error: (exception) => ErrorAgendaWidget(exception),
                  loaded: (events) => StreamBuilder<List<Widget>>(
                    stream: _listEventCards(context, events),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Widget>> snapshot) {
                      if (snapshot.hasData) {
                        return OrientationBuilder(
                          builder:
                              (BuildContext context, Orientation orientation) {
                            return PageView(
                              controller: PageController(
                                  viewportFraction:
                                      _viewportFraction(orientation, context)),
                              pageSnapping: _pageSnapping(context),
                              children: snapshot.data,
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
          ),
        ),
        drawer: const MainDrawer(
          currentRoutePaths: RoutePaths.agenda,
        ),
      ),
    );
  }

  Stream<List<Widget>> _listEventCards(
      BuildContext context, Iterable<Event> events) async* {
    List<Widget> monthlyWidgets = <Widget>[];
    List<Widget> dailyEvents = <Widget>[];
    final List<Widget> monthPages = <Widget>[];
    DateTime oldDt;

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

      for (final Event event in events) {
        dt = event.dtstart;

        // New Month
        if (dt.month != oldDt?.month) {
          if (dailyEvents.isNotEmpty) {
            monthlyWidgets.add(DayWidget(oldDt, dailyEvents));
          }
          // Return the last month
          if (monthlyWidgets.isNotEmpty) {
            monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
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
            monthlyWidgets.add(DayWidget(oldDt, dailyEvents));
          }

          oldDt = dt;
          dailyEvents = <Widget>[]; // Clear Events
        }

        // Event Card
        dailyEvents.add(EventCard(event));
      }

      // Return the last day
      if (dailyEvents.isNotEmpty && monthlyWidgets.isNotEmpty) {
        monthlyWidgets.add(DayWidget(oldDt, dailyEvents));
        monthPages.add(MonthPage(oldDt.month, monthlyWidgets));
      }
    }
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
}
