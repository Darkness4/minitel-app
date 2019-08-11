import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:minitel_toolbox/core/services/http_webhook.dart';

void main() {
  final _gateway = GatewayAPI();
  final _webfeed = WebFeedAPI();
  final _webhook = WebhookAPI();

  group('Http Requests', () {
    test('Bad Username or Password to 195.83.139.7', () async {
      var status = await _gateway.autoLogin("", "", "195.83.139.7", 480);
      print(status);

      expect(status, "Error: Bad Username or Password");
    });

    test('Bad Username and Password to google.fr to get HttpError', () async {
      var status = await _gateway.autoLogin("", "", "google.fr", 0);
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Get status Not logged in from 195.83.139.7', () async {
      await _gateway.disconnectGateway("195.83.139.7");
      var status = await _gateway.getStatus("195.83.139.7");
      print(status);

      expect(status, contains("Not logged in"));
    });

    // This test does not work because we are not using cookies.
    test('Get status SUCCESS from 195.83.139.7', () async {
      var cookie = await _gateway.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      var statusFromReturn =
          await _gateway.getStatus("195.83.139.7", cookie: cookie);
      var statusFromApi =
          await _gateway.getStatus("195.83.139.7", cookie: _gateway.cookie);

      expect(statusFromApi, contains("seconds"));
      expect(statusFromReturn, contains("seconds"));
    });

    test('Get status intentionaly from google.fr to get error', () async {
      var status = await _gateway.getStatus("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect intentionaly from google.fr to get error', () async {
      var status = await _gateway.disconnectGateway("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect from 195.83.139.7', () async {
      var cookie = await _gateway.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      var status =
          await _gateway.disconnectGateway("195.83.139.7", cookie: cookie);
      print(status);

      expect(status.contains("You have logged out"), true);
    });

    test('Good Username and Password to 195.83.139.7', () async {
      var status = await _gateway.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      print(status);

      expect(status, contains("NETASQ_USER"));
    });

    test('Report to slack', () async {
      var status = await _webhook.report(
        "Unit test",
        attachments: {"test": "test"},
        channel: "DE8PA0Z1C",
      );
      print(status);

      expect(status, equals(''));
    });

    test('Not enough information report', () async {
      var status = await _webhook.report(
        "",
        channel: "DE8PA0Z1C",
      );
      print(status);

      expect(status, contains("Not enough information."));
    });

    test('Get Atom from Github', () async {
      var status = await _webfeed.getAtom(
          "https://github.com/Darkness4/minitel-app/commits/develop.atom");
      print(status.toString());

      expect(status.title, contains("Recent Commits to minitel-app"));
    });

    test('Get Rss from Github', () async {
      var status = await _webfeed.getRss("https://blog.jetbrains.com/feed/");
      print(status.toString());

      expect(status.title, contains("JetBrains Blog"));
    });
  });
}
