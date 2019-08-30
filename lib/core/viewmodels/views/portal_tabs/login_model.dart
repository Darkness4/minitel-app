import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Mutex
enum LoginState { Busy, Available }

class LoginViewModel extends ChangeNotifier {
  final PortailAPI portailAPI;
  final StormshieldAPI stormshieldAPI;
  final CalendarUrlAPI calendarUrlAPI;
  final ICalendarAPI iCalendar;
  final ValueNotifier<String> selectedTime = ValueNotifier<String>('4 hours');
  final ValueNotifier<String> selectedUrl =
      ValueNotifier<String>(MyIPAdresses.stormshieldIP);
  final ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);
  final ValueNotifier<bool> autoLogin = ValueNotifier<bool>(false);
  final FocusNode uidFocusNode = FocusNode();
  final FocusNode pswdFocusNode = FocusNode();
  final TextEditingController uidController = TextEditingController();
  final TextEditingController pswdController = TextEditingController();

  LoginState loginState = LoginState.Available;

  LoginViewModel({
    @required this.portailAPI,
    @required this.stormshieldAPI,
    @required this.calendarUrlAPI,
    @required this.iCalendar,
  });

  Future<void> login(BuildContext context, String uid, String pswd) async {
    // Remember me
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe.value) {
      await Future.wait<bool>(<Future<bool>>[
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
      await Future.wait<bool>(<Future<bool>>[
        prefs.remove("rememberMe"),
        prefs.remove("autoLogin"),
        prefs.remove("user"),
        prefs.remove("time"),
        prefs.remove("pswd"),
      ]);
    }

    // Notification
    Scaffold.of(context).showSnackBar(
      const SnackBar(content: Text('Requested')),
    );

    // Lock
    loginState = LoginState.Busy;
    notifyListeners();

    // Login
    try {
      await stormshieldAPI.autoLogin(
        uid,
        pswd,
        selectedUrl.value,
        LoginConstants.timeMap[selectedTime.value],
      );
      notifyListeners();
    } on Exception catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    // Calendar
    try {
      final String calendarUrl = await calendarUrlAPI.getCalendarURL(
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

  /// Load saved data and remember login if it was true
  Future<void> rememberLogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe.value = prefs.getBool("rememberMe") ?? false;
    if (rememberMe.value) {
      uidController.text = prefs.getString("user");
      selectedTime.value = prefs.getString("time");
      pswdController.text = utf8.decode(base64.decode(prefs.getString("pswd")));
      autoLogin.value = prefs.getBool("autoLogin") ?? false;
    }
    if (autoLogin.value) {
      await login(context, uidController.text, pswdController.text);
    }
  }

  @override
  void dispose() {
    selectedTime.dispose();
    selectedUrl.dispose();
    rememberMe.dispose();
    autoLogin.dispose();
    uidFocusNode.dispose();
    pswdFocusNode.dispose();
    uidController.dispose();
    pswdController.dispose();

    super.dispose();
  }
}
