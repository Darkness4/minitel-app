import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/icalendar/event.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:intl/intl.dart';

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
              stuckAmount,
            ),
            child: Container(
              alignment: Alignment.center,
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

class EventCard extends StatelessWidget {
  final Event _event;

  const EventCard(Event event, {Key key})
      : _event = event,
        super(key: key);

  Color get _cardColor {
    final String upper = _event.summary.toLowerCase();
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
