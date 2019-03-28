import 'package:test/test.dart';
import 'dart:convert';
import 'package:auto_login_flutter/funcs/http_resquests.dart';

void main() {
  group('Http Requests', () {
    test('Bad Username or Password to fw-cgcp.emse.fr', () async {
      var status = await autoLogin("", "", "fw-cgcp.emse.fr", 480);

      expect(status, "Error: Bad Username or Password");
    });

    test('Good Username and Password to fw-cgcp.emse.fr', () async {
      var status = await autoLogin("marc.nguyen", utf8.decode(base64.decode("c3RpY2ttYW45NjM=")), "fw-cgcp.emse.fr", 480);

      expect(status.contains("second"), true);
    });

    test('Report to slack', () async {
      var status = await report("Unit test", title: "Unit test", channel: "DE8PA0Z1C");

      expect(status.contains("ok"), true);
    });
  });
}