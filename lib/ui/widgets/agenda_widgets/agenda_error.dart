import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class ErrorAgendaWidget extends StatelessWidget {
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final FocusNode _uidFocusNode = FocusNode();
  final FocusNode _pswdFocusNode = FocusNode();
  final String error;
  final Function parentSetState;

  ErrorAgendaWidget(this.error, this.parentSetState);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 4,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(
              error.toString(),
              style: MinitelTextStyles.error,
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    key: const Key('agenda_view/uid'),
                    focusNode: _uidFocusNode,
                    controller: _uidController,
                    decoration: InputDecoration(
                      hintText: AppLoc.of(context).portal.usernameHint,
                      labelText: AppLoc.of(context).portal.usernameLabel,
                    ),
                    onEditingComplete: () {
                      _uidFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_pswdFocusNode);
                    },
                  ),
                  TextFormField(
                    key: const Key('agenda_view/pswd'),
                    controller: _pswdController,
                    obscureText: true,
                    focusNode: _pswdFocusNode,
                    decoration: InputDecoration(
                      hintText: AppLoc.of(context).portal.password,
                      labelText: AppLoc.of(context).portal.password,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: FloatingActionButton.extended(
            key: const Key('agenda_view/connect'),
            backgroundColor: Colors.red,
            elevation: 10.0,
            onPressed: () async {
              final CalendarUrlAPI _calendarURL =
                  Provider.of<CalendarUrlAPI>(context);
              final ICalendarAPI ical = Provider.of<ICalendarAPI>(context);
              try {
                final String url = await _calendarURL.getCalendarURL(
                  username: _uidController.text,
                  password: _pswdController.text,
                );
                await ical.saveCalendar(url, _calendarURL);
              } on Exception catch (e) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text(e.toString())),
                );
              }
              parentSetState();
            },
            label: Text(
              AppLoc.of(context).portal.login,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(Icons.arrow_forward),
          ),
        ),
      ],
    );
  }
}
