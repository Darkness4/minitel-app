import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_webfeed.dart';
import 'package:webfeed/domain/atom_feed.dart';
import 'package:webfeed/domain/rss_feed.dart';

void main() {
  final GatewayAPI _gateway = GatewayAPI();
  final WebFeedAPI _webfeed = WebFeedAPI();

  group('Http Requests', () {
    test('Bad Username or Password to 195.83.139.7', () async {
      try {
        await _gateway.autoLogin("", "", "195.83.139.7", 480);
        throw Exception("autoLogin did not throw");
      } catch (e) {
        expect(e.toString(), contains("Bad Username or Password"));
      }
    });

    test('Bad Username and Password to google.fr to get HttpError', () async {
      try {
        await _gateway.autoLogin("", "", "google.fr", 0);
        throw Exception("autoLogin did not throw");
      } catch (e) {
        expect(e.toString(), contains("HttpError"));
      }
    });

    test('Get status Non connecté in from 195.83.139.7', () async {
      await _gateway.disconnectGateway("195.83.139.7");
      final String status = await _gateway.getStatus("195.83.139.7");
      print(status);

      expect(status, contains("Non connecté"));
    });

    test('Get status SUCCESS from 195.83.139.7', () async {
      final Cookie cookie = await _gateway.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      final String statusFromReturn =
          await _gateway.getStatus("195.83.139.7", cookie: cookie);
      final String statusFromApi =
          await _gateway.getStatus("195.83.139.7", cookie: _gateway.cookie);

      expect(statusFromApi, contains("second"));
      expect(statusFromReturn, contains("second"));
    });

    test('Get status intentionaly from google.fr to get error', () async {
      final String status = await _gateway.getStatus("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect intentionaly from google.fr to get error', () async {
      final String status = await _gateway.disconnectGateway("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect from 195.83.139.7', () async {
      final Cookie cookie = await _gateway.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      final String status =
          await _gateway.disconnectGateway("195.83.139.7", cookie: cookie);
      print(status);

      expect(status.contains("You have logged out"), true);
    });

    test('Good Username and Password to 195.83.139.7', () async {
      final Cookie status = await _gateway.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      print(status);

      expect(status.name, equals("NETASQ_USER"));
    });

    test('Get Atom from Github', () async {
      final AtomFeed status = await _webfeed.getAtom(
          "https://github.com/Darkness4/minitel-app/commits/develop.atom");
      print(status.toString());

      expect(status.title, contains("Recent Commits to minitel-app"));
    });

    test('Get Rss from Github', () async {
      final RssFeed status =
          await _webfeed.getRss("https://blog.jetbrains.com/feed/");
      print(status.toString());

      expect(status.title, contains("JetBrains Blog"));
    });
  });
}
