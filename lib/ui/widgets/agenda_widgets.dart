import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/models/icalendar/event.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/icalendar.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class DayWidget extends StatelessWidget {
  final DateTime dt;
  final List<Widget> dailyEvents;

  const DayWidget(this.dt, this.dailyEvents);

  @override
  Widget build(BuildContext context) {
    return StickyHeaderBuilder(
      builder: (BuildContext context, double stuckAmount) {
        stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Material(
            elevation: stuckAmount * 10,
            color: Color.lerp(
                Colors.transparent,
                MinitelColors.MonthColorPalette[dt.month].withOpacity(0.9),
                stuckAmount),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "${DateFormat.MMMMEEEEd("fr_FR").format(dt)}",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .apply(color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: dailyEvents,
      ),
    );
  }
}

class ErrorAgendaWidget extends StatelessWidget {
  final _uidController = TextEditingController();
  final _pswdController = TextEditingController();
  final _uidFocusNode = FocusNode();
  final _pswdFocusNode = FocusNode();
  final _formKey;
  final String error;
  final Function parentSetState;

  ErrorAgendaWidget(this.error, this.parentSetState, this._formKey);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          elevation: 4,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                error.toString(),
                style: MinitelTextStyles.error,
              ),
            ),
          ),
        ),
        Card(
          elevation: 4,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    key: const Key('agenda_view/uid'),
                    focusNode: _uidFocusNode,
                    controller: _uidController,
                    decoration: InputDecoration(
                      hintText: "prénom.nom",
                      labelText: "Nom d'utilisateur",
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
                      hintText: "Mot de passe",
                      labelText: "Mot de passe",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: FloatingActionButton.extended(
              key: const Key('agenda_view/connect'),
              backgroundColor: Colors.red,
              elevation: 10.0,
              onPressed: () async {
                CalendarUrlAPI _calendarURL =
                    Provider.of<CalendarUrlAPI>(context);
                ICalendar ical = Provider.of<ICalendar>(context);
                try {
                  var url = await _calendarURL.getCalendarURL(
                    username: _uidController.text,
                    password: _pswdController.text,
                  );
                  await ical.saveCalendar(url, _calendarURL);
                } on Exception catch (e) {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())),
                  );
                }
                parentSetState(() {});
              },
              label: const Text(
                "Se connecter",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              icon: Icon(Icons.arrow_forward),
            ),
          ),
        ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final Event _event;

  const EventCard(Event event, {Key key})
      : _event = event,
        super(key: key);

  Color get _cardColor {
    var upper = _event.summary.toLowerCase();
    if (upper.contains("examen")) {
      return Colors.red[200];
    } else if (upper.contains("tp")) {
      return Colors.orange[200];
    } else if (upper.contains("td")) {
      return Colors.green[200];
    } else if (upper.contains("tutorat")) {
      return Colors.blue[200];
    } else if (upper.contains("sport") ||
        upper.contains("vacance") ||
        upper.contains("férié")) {
      return Colors.transparent;
    } else {
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: _cardColor,
        elevation: (_event.summary.toLowerCase().contains("sport") ||
                _event.summary.toLowerCase().contains("vacance") ||
                _event.summary.toLowerCase().contains("férié"))
            ? 0
            : 4,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Text(
                _event.summary,
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                _event.description,
                style: const TextStyle(height: 1.4),
                textAlign: TextAlign.center,
              ),
              Text(
                "${_event.location != "" ? '➡' : ''} ${_event.location} ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "${DateFormat.Hm().format(_event.dtstart)}"
                " - "
                "${DateFormat.Hm().format(_event.dtend)}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MonthHeader extends StatelessWidget {
  final String text;
  const MonthHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.display2.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}

class MonthPage extends StatelessWidget {
  final int _month;
  final List<Widget> _monthlyWidgets;

  const MonthPage(this._month, this._monthlyWidgets, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: MinitelColors.MonthColorPalette[_month],
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _monthlyWidgets,
          ),
        ),
      ),
    );
  }
}
