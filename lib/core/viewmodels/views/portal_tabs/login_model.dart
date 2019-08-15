import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:minitel_toolbox/core/services/icalendar.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Mutex
enum LoginState { Busy, Available }

class LoginViewModel extends ChangeNotifier {
  final PortailAPI portailAPI;
  final GatewayAPI gatewayAPI;
  final CalendarUrlAPI calendarUrlAPI;
  final ICalendar iCalendar;
  final ValueNotifier<String> selectedTime;
  final ValueNotifier<String> selectedUrl;
  final ValueNotifier<bool> rememberMe;
  final ValueNotifier<bool> autoLogin;

  LoginState loginState = LoginState.Available;

  LoginViewModel({
    @required this.portailAPI,
    @required this.gatewayAPI,
    @required this.calendarUrlAPI,
    @required this.selectedTime,
    @required this.iCalendar,
    @required this.selectedUrl,
    @required this.rememberMe,
    @required this.autoLogin,
  });

  Future<void> login(BuildContext context, String uid, String pswd) async {
    // Remember me
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe.value) {
      await Future.wait([
        prefs.setBool("rememberMe", true),
        prefs.setBool("autoLogin", autoLogin.value),
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
        prefs.remove("autoLogin"),
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
    await gatewayAPI.autoLogin(
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
      await iCalendar.saveCalendar(calendarUrl, calendarUrlAPI);
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
