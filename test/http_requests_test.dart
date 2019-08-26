import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';

void main() {
  final GatewayAPI _gatewayAPI = GatewayAPI();

  group('Http Requests', () {
    test('Bad Username or Password to 195.83.139.7', () async {
      try {
        await _gatewayAPI.autoLogin("", "", "195.83.139.7", 480);
        throw Exception("autoLogin did not throw");
      } catch (e) {
        expect(e.toString(), contains("Bad Username or Password"));
      }
    });

    test('Bad Username and Password to google.fr to get HttpError', () async {
      try {
        await _gatewayAPI.autoLogin("", "", "google.fr", 0);
        throw Exception("autoLogin did not throw");
      } catch (e) {
        expect(e.toString(), contains("HttpError"));
      }
    });

    test('Get status Non connecté in from 195.83.139.7', () async {
      await _gatewayAPI.disconnectGateway("195.83.139.7");
      final String status = await _gatewayAPI.getStatus("195.83.139.7");
      print(status);

      expect(status, contains("Non connecté"));
    });

    test('Get status SUCCESS from 195.83.139.7', () async {
      final Cookie cookie = await _gatewayAPI.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      final String statusFromReturn =
          await _gatewayAPI.getStatus("195.83.139.7", cookie: cookie);
      final String statusFromApi = await _gatewayAPI.getStatus("195.83.139.7",
          cookie: _gatewayAPI.cookie);

      expect(statusFromApi, contains("second"));
      expect(statusFromReturn, contains("second"));
    });

    test('Get status intentionaly from google.fr to get error', () async {
      final String status = await _gatewayAPI.getStatus("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect intentionaly from google.fr to get error', () async {
      final String status =
          await _gatewayAPI.disconnectGateway("www.google.fr");
      print(status);

      expect(status, contains("HttpError"));
    });

    test('Disconnect from 195.83.139.7', () async {
      final Cookie cookie = await _gatewayAPI.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      final String status =
          await _gatewayAPI.disconnectGateway("195.83.139.7", cookie: cookie);
      print(status);

      expect(status.contains("You have logged out"), true);
    });

    test('Good Username and Password to 195.83.139.7', () async {
      final Cookie status = await _gatewayAPI.autoLogin("marc.nguyen",
          utf8.decode(base64.decode("b3BzdGU5NjM=")), "195.83.139.7", 240);
      print(status);

      expect(status.name, equals("NETASQ_USER"));
    });
  });
}
