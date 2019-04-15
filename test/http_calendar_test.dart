import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:test/test.dart';

void main() {
  test('bypassCAS', () async {
    var phpSessionId = await bypassCAS(
      username: "marc.nguyen",
      password: "stickman963",
      referee: "https://portail.emse.fr/ics/",
    );

    print(phpSessionId);

    expect(phpSessionId, contains("ST"));
  });

  test('getCalendar', () async {
    var phpSessionId = await bypassCAS(
      username: "marc.nguyen",
      password: "stickman963",
      referee: "https://portail.emse.fr/ics/",
    );

    var icsUrl = await getCalendar(
      phpSessionIDCAS: phpSessionId,
      url: "https://portail.emse.fr/ics/",
    );

    print(icsUrl);

    expect(icsUrl, contains("https://portail.emse.fr/ics/"));
    expect(icsUrl, contains(".ics"));
  });
}
