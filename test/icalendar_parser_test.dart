import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/funcs/icalendar_parser.dart';

void main() {
  test('getCalendar', () async {
    print(await getCalendar(
        "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics"));
  });

  test('parseCalendar', () async {
    Stream<String> calendar = await getCalendar(
        "https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics");
    ICalendar ical = await parseCalendar(calendar);

    print(ical.timezone.daylight.toString());
    print(ical.events[0]["DTSTART"]);
    print(ical.events[0].length);
    print(ical.events[1].length);
    print(ical.events.length);
  });
}
