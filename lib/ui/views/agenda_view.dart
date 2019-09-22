import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/models/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:minitel_toolbox/core/viewmodels/views/agenda_view_model.dart';
import 'package:minitel_toolbox/ui/widgets/agenda_widgets/agenda_widgets.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';
import 'package:provider/provider.dart';

import 'agenda_pages/notification_settings_page.dart';

class AgendaView extends StatelessWidget {
  final String title;

  const AgendaView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AgendaViewModel>(
      onModelReady: (AgendaViewModel model) async =>
          model.onModelReady(context),
      model: AgendaViewModel(
        flutterLocalNotificationsPlugin: FlutterLocalNotificationsPlugin(),
        calendarUrlAPI: Provider.of<CalendarUrlAPI>(context),
        iCalendar: Provider.of<ICalendarAPI>(context),
      ),
      builder: (BuildContext context, AgendaViewModel model, _) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            title: Text(title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(
                    builder: (_) => NotificationSettingsPage(
                      notificationSettings: model.notificationSettings,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Center(
            // Load the calendar
            child: FutureBuilder<ParsedCalendar>(
              future: model.loadCalendar(context),
              builder: (BuildContext context,
                  AsyncSnapshot<ParsedCalendar> snapshot) {
                if (snapshot.hasError) {
                  return ErrorAgendaWidget(
                    snapshot.error.toString(),
                    model.refresh,
                  );
                }
                if (snapshot.hasData) {
                  return
                      // Then parse the calendar et generate the pages
                      StreamBuilder<List<Widget>>(
                    stream: model.listEventCards(snapshot.data),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Widget>> snapshotStream) {
                      switch (snapshotStream.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.waiting:
                        case ConnectionState.active:
                          return const CircularProgressIndicator(
                            backgroundColor: Colors.white,
                          );

                        case ConnectionState.done:
                          return OrientationBuilder(
                            builder: (BuildContext context,
                                Orientation orientation) {
                              return PageView(
                                controller: PageController(
                                    viewportFraction:
                                        orientation == Orientation.portrait &&
                                                MediaQuery.of(context)
                                                        .size
                                                        .shortestSide <
                                                    600
                                            ? 0.9
                                            : 0.7),
                                pageSnapping:
                                    MediaQuery.of(context).size.shortestSide <
                                        600,
                                children: snapshotStream.data,
                              );
                            },
                          );
                      }
                      return null;
                    },
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          drawer: const MainDrawer(
            currentRoutePaths: RoutePaths.Agenda,
          ),
        );
      },
    );
  }
}
