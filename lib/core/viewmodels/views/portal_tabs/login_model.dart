import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Mutex
enum LoginState { Busy, Available }

class LoginViewModel extends ChangeNotifier {
  final PortailAPI portailAPI;
  final GatewayAPI gatewayAPI;
  final CalendarUrlAPI calendarUrlAPI;
  final ValueNotifier<String> selectedTime;
  final ValueNotifier<String> selectedUrl;
  final ValueNotifier<bool> rememberMe;

  String cookie;

  LoginState loginState = LoginState.Available;

  LoginViewModel({
    @required this.portailAPI,
    @required this.gatewayAPI,
    @required this.calendarUrlAPI,
    @required this.selectedTime,
    @required this.selectedUrl,
    @required this.rememberMe,
  });

  Future<void> login(BuildContext context, String uid, String pswd) async {
    // Remember me
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe.value) {
      await Future.wait([
        prefs.setBool("rememberMe", true),
        prefs.setString("user", uid),
        prefs.setString("time", selectedTime.value),
        prefs.setString(
          "pswd",
          base64.encode(utf8.encode(pswd)),
        ),
      ]);
    } else {
      await Future.wait([
        prefs.remove("rememberMe"),
        prefs.remove("user"),
        prefs.remove("time"),
        prefs.remove("pswd"),
      ]);
    }

    // Notification
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text('Requested')),
    );

    // Lock
    loginState = LoginState.Busy;
    notifyListeners();

    // Login
    cookie = await gatewayAPI.autoLogin(
      uid,
      pswd,
      selectedUrl.value,
      LoginConstants.timeMap[selectedTime.value],
    );
    // Calendar
    try {
      String calendarUrl = await calendarUrlAPI.getCalendarURL(
        username: uid,
        password: pswd,
      );
      await ICalendar(calendarUrlAPI).saveCalendar(calendarUrl);
      notifyListeners();
    } on Exception catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
    // Portail
    try {
      await portailAPI.saveCookiePortailFromLogin(
        username: uid,
        password: pswd,
      );
    } on Exception catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    // Unlock
    loginState = LoginState.Available;
    notifyListeners();
  }
}