import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel =
      MethodChannel('plugins.flutter.io/path_provider');

  final List<MethodCall> log = <MethodCall>[];
  String response;

  channel.setMockMethodCallHandler((MethodCall methodCall) async {
    log.add(methodCall);
    return response;
  });

  response = "";

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

    var icsUrl = await getCalendarURL(
      phpSessionIDCAS: phpSessionId,
      url: "https://portail.emse.fr/ics/",
    );

    print(icsUrl);

    expect(icsUrl, contains("https://portail.emse.fr/ics/"));
    expect(icsUrl, contains(".ics"));
  });

  test('saveCalendar', () async {
    await saveCalendar(username: "marc.nguyen", password: "stickman963");
  });

  test('readCalendar', () async {
    await saveCalendar(username: "marc.nguyen", password: "stickman963");
    print(await readCalendar());
  });
}
