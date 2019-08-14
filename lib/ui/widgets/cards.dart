import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:html/parser.dart' show parseFragment;
import 'package:intl/intl.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:provider/provider.dart';

class DocCard extends StatelessWidget {
  final List<Widget> children;
  final double elevation;
  final double intPadding;

  const DocCard({
    @required this.children,
    this.elevation = 4.0,
    this.intPadding = 15.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: EdgeInsets.all(intPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
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
                    key: Key('agenda_view/uid'),
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
                    key: Key('agenda_view/pswd'),
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
              key: Key('agenda_view/connect'),
              backgroundColor: Colors.red,
              elevation: 10.0,
              onPressed: () async {
                CalendarUrlAPI _calendarURL =
                    Provider.of<CalendarUrlAPI>(context);
                try {
                  var url = await _calendarURL.getCalendarURL(
                    username: _uidController.text,
                    password: _pswdController.text,
                  );
                  await ICalendar(_calendarURL).saveCalendar(url);
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
  final Map<String, String> _event;

  const EventCard(Map<String, String> event, {Key key})
      : _event = event,
        super(key: key);

  Color get _cardColor {
    var upper = _event["SUMMARY"].toLowerCase();
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
        elevation: (_event["SUMMARY"].toLowerCase().contains("sport") ||
                _event["SUMMARY"].toLowerCase().contains("vacance") ||
                _event["SUMMARY"].toLowerCase().contains("férié"))
            ? 0
            : 4,
        child: Container(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: <Widget>[
              Text(
                _event["SUMMARY"],
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                _event["DESCRIPTION"],
                style: const TextStyle(height: 1.4),
                textAlign: TextAlign.center,
              ),
              Text(
                "${_event["LOCATION"] != "" ? '➡' : ''} ${_event["LOCATION"]} ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "${DateFormat.Hm().format(DateTime.parse(_event["DTSTART"]))}"
                " - "
                "${DateFormat.Hm().format(DateTime.parse(_event["DTEND"]))}",
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

class LogCard extends StatelessWidget {
  final String title;
  final String text;
  final double elevation;

  const LogCard(this.text, {@required this.title, this.elevation = 3});

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: elevation,
        color: MinitelColors.TerminalHeaderColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 10,
                  fontFamily: "RobotoMono",
                  color: MinitelColors.TerminalFgColor,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: MinitelColors.TerminalBgColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final dynamic item;
  final double elevation;

  const NewsCard({
    @required this.item,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: InkWell(
        onTap: () => LaunchURL.launchURL(
            item.links.map((link) => link.href).toList().first),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network(
                      item.media.thumbnails.first.url
                          .toString()
                          .replaceAll("?s=30", "?s=90"),
                      fit: BoxFit.cover,
                      height: 60,
                      width: 60,
                    ),
                  ),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          item.title.trim(),
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headline
                              .copyWith(height: 1),
                        ),
                        Text(
                          (item.authors)
                              .map((author) => author.name)
                              .toList()
                              .join(" "),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 0.1, 1.0],
                    colors: [
                      Colors.black,
                      Color(item.id.hashCode ~/ 100 + 0xFF000000),
                      Colors.deepPurpleAccent,
                    ],
                  ),
                ),
                height: 100,
                child: Center(
                  child: Text(
                    "Version v${item.id.substring(41)}",
                    style: Theme.of(context)
                        .textTheme
                        .display1
                        .apply(color: Colors.white),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  parseFragment(item.content).text,
                  overflow: TextOverflow.fade,
                  maxLines: 10,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    textColor: Colors.blue,
                    child: Text(
                      "See More...",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => LaunchURL.launchURL(
                        item.links.map((link) => link.href).toList().first),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
