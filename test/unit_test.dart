import 'dart:convert';
import 'dart:io';

import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:test/test.dart';

void main() {
  group('Http Requests', () {
    test('Bad Username or Password to 195.83.139.7', () async {
      var status = await autoLogin("", "", "195.83.139.7", 480);
      print(status);

      expect(status, "Error: Bad Username or Password");
    });

    test('Bad Username and Password to google.fr to get HttpError', () async {
      var status = await autoLogin("", "", "google.fr", 0);
      print(status);

      expect(status.contains("HttpError"), true);
    });

    test('Get status Not logged in from 195.83.139.7', () async {
      await disconnectGateway("195.83.139.7");
      var status = await getStatus("fw-cgcp.emse.fr");
      print(status);

      expect(status.contains("logged"), true);
    });

    test('Get status SUCCESS from fw-cgcp.emse.fr', () async {
      await autoLogin(
          "marc.nguyen",
          utf8.decode(base64.decode("c3RpY2ttYW45NjM=")),
          "fw-cgcp.emse.fr",
          240);
      var status = await getStatus("fw-cgcp.emse.fr");
      print(status);

      expect(status.contains("seconds"), true);
    });

    test('Get status intentionaly from google.fr to get error', () async {
      var status = await getStatus("www.google.fr");
      print(status);

      expect(status.contains("HttpError"), true);
    });

    test('Disconnect intentionaly from google.fr to get error', () async {
      var status = await disconnectGateway("www.google.fr");
      print(status);

      expect(status.contains("HttpError"), true);
    });

    test('Disconnect from 195.83.139.7', () async {
      var status = await disconnectGateway("195.83.139.7");
      print(status);

      expect(status.contains("You have logged out"), true);
    });

    test('Good Username and Password to 195.83.139.7', () async {
      var status = await autoLogin("marc.nguyen",
          utf8.decode(base64.decode("c3RpY2ttYW45NjM=")), "195.83.139.7", 240);
      print(status);

      expect(status.contains("seconds"), true);
    });

    test('Report to slack', () async {
      var status =
          await report("Unit test", title: "Unit test", channel: "DE8PA0Z1C");
      print(status);

      expect(status.contains("ok"), true);
    });

    test('Not enough information report', () async {
      var status = await report("", title: "", channel: "DE8PA0Z1C");
      print(status);

      expect(status.contains("Not enough information."), true);
    });

    test('Get Atom from Github', () async {
      var status = await getAtom(
          "https://github.com/Darkness4/minitel-app/commits/develop.atom");
      print(status.toString());

      expect(status.title.contains("Recent Commits to minitel-app"), true);
    });

    test('Get Rss from Github', () async {
      var status = await getRss("https://blog.jetbrains.com/feed/");
      print(status.toString());

      expect(status.title.contains("JetBrains Blog"), true);
    });
  });
}
