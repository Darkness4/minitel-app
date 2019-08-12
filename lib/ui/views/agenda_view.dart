import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/viewmodels/views/agenda_view_model.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/drawer.dart';

import 'calendar_pages/notification_settings_page.dart';

class AgendaView extends StatefulWidget {
  final String title;

  const AgendaView({Key key, this.title}) : super(key: key);

  @override
  AgendaViewState createState() => AgendaViewState();
}

class AgendaViewState extends State<AgendaView> {
  final _formKey = GlobalKey<FormState>();
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final _initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/launcher_icon');
  final _initializationSettingsIOS = IOSInitializationSettings();

  @override
  Widget build(BuildContext context) {
    return BaseWidget<AgendaViewModel>(
      model: AgendaViewModel(
          flutterLocalNotificationsPlugin: _flutterLocalNotificationsPlugin),
      builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NotificationSettingsPage(
                      notificationSettings: model.notificationSettings,
                    ),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            alignment: Alignment.center,
            color: MinitelColors.PrimaryColor,
            child: FutureBuilder<ICalendar>(
              future: model.loadCalendar(context),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasError) {
                  return ErrorCalendarWidget(
                    snapshot.error.toString(),
                    setState,
                    _formKey,
                  );
                }
                if (snapshot.hasData) {
                  return Scrollbar(
                    child: StreamBuilder<Widget>(
                      stream: model.listEventCards(snapshot.data),
                      builder: (BuildContext context, snapshotStream) {
                        switch (snapshotStream.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return const CircularProgressIndicator();
                          case ConnectionState.active:
                            model.monthPages.add(snapshotStream.data);
                            break;
                          case ConnectionState.done:
                            model.monthPages.add(snapshotStream.data);
                            return PageView(children: model.monthPages);
                        }
                        return null;
                      },
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
          drawer: const MainDrawer(),
        );
      },
    );
  }

  void initState() {
    super.initState();
    final initializationSettings = InitializationSettings(
        _initializationSettingsAndroid, _initializationSettingsIOS);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) =>
            _onSelectNotification(payload, context));
  }

  Future<void> _onSelectNotification(
      String payload, BuildContext context) async {
    List<String> output = payload.split(';');
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("${output[0]}"),
        content: Text("${output.length < 2 ? "null" : output[1]}"),
      ),
    );
  }
}
