import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/imprimante_api.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Mutex
enum PortailState { Busy, Available }

class PortailViewModel extends ChangeNotifier {
  final PortailAPI portailAPI;
  final StormshieldAPI stormshieldAPI;
  final CalendarUrlAPI calendarUrlAPI;
  final ImprimanteAPI imprimanteAPI;
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

  PortailState portailState = PortailState.Available;

  PortailViewModel({
    @required this.portailAPI,
    @required this.stormshieldAPI,
    @required this.imprimanteAPI,
    @required this.calendarUrlAPI,
    @required this.iCalendar,
  });

  Future<void> refresh() async {
    portailState = PortailState.Available;
    notifyListeners();
  }

  Future<void> login(BuildContext context, String uid, String pswd) async {
    // Remember me
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const FlutterSecureStorage storage = FlutterSecureStorage();
    if (rememberMe.value) {
      await Future.wait<dynamic>(<Future<dynamic>>[
        prefs.setBool("rememberMe", true),
        prefs.setBool("autoLogin", autoLogin.value),
        prefs.setString("user", uid),
        prefs.setString("time", selectedTime.value),
        storage.write(
          key: "pswd",
          value: base64.encode(utf8.encode(pswd)),
        ),
      ]);
    } else {
      await Future.wait<dynamic>(<Future<dynamic>>[
        prefs.remove("rememberMe"),
        prefs.remove("autoLogin"),
        prefs.remove("user"),
        prefs.remove("time"),
        storage.delete(key: "pswd"),
      ]);
    }

    // Notification
    Scaffold.of(context).showSnackBar(
      const SnackBar(content: Text('Requested')),
    );

    // Lock
    portailState = PortailState.Busy;
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
    } catch (e) {
      portailState = PortailState.Available;
      notifyListeners();
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
    } catch (e) {
      portailState = PortailState.Available;
      notifyListeners();
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }

    // Portail
    await portailAPI
        .saveCookiePortailFromLogin(
          username: uid,
          password: pswd,
        )
        .then((_) => notifyListeners())
        .catchError((dynamic e) {
      portailState = PortailState.Available;
      notifyListeners();
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    });

    // Imprimante
    await imprimanteAPI
        .login(
          username: uid,
          password: pswd,
        )
        .then((_) => notifyListeners())
        .catchError((dynamic e) {
      portailState = PortailState.Available;
      notifyListeners();
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    });

    // Unlock
    portailState = PortailState.Available;
    notifyListeners();
  }

  /// Load saved data and remember login if it was true
  Future<void> rememberLogin(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const FlutterSecureStorage storage = FlutterSecureStorage();
    rememberMe.value = prefs.getBool("rememberMe") ?? false;
    if (rememberMe.value) {
      uidController.text = prefs.getString("user");
      selectedTime.value = prefs.getString("time");
      pswdController.text =
          utf8.decode(base64.decode(await storage.read(key: "pswd")));
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
