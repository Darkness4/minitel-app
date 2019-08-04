import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final PortailAPI _portailAPI;
  final GatewayAPI _gatewayAPI;
  const LoginPage({
    Key key,
    @required PortailAPI portailAPI,
    @required GatewayAPI gatewayAPI,
  })  : _portailAPI = portailAPI,
        _gatewayAPI = gatewayAPI,
        super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _uidFocusNode = FocusNode();
  final _pswdFocusNode = FocusNode();
  final _uidController = TextEditingController();
  final _pswdController = TextEditingController();
  final _calendarURLApi = CalendarUrlAPI();
  final List<String> _urlRootList = [
    MyIPAdresses.gatewayIP,
    MyIPAdresses.stormshield,
    MyIPAdresses.stormshieldIP,
  ];
  final Map<String, int> _timeMap = {
    '15 minutes': 15,
    '30 minutes': 30,
    '45 minutes': 45,
    '1 hour': 60,
    '2 hours': 120,
    '3 hours': 180,
    '4 hours': 240,
    '(8 hours)': 480,
  };
  ValueNotifier<String> _selectedTime = ValueNotifier<String>('4 hours');
  ValueNotifier<String> _selectedUrl =
      ValueNotifier<String>(MyIPAdresses.stormshieldIP);
  ValueNotifier<bool> rememberMe = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _StatusCard(
                  portailAPI: widget._portailAPI,
                  calendarURL: _calendarURLApi,
                  gatewayAPI: widget._gatewayAPI,
                  selectedUrl: _selectedUrl.value,
                ),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              const Text("Nom de domaine / IP "),
                              ValueListenableBuilder<String>(
                                valueListenable: _selectedUrl,
                                builder: (context, value, _) {
                                  return DropdownButton<String>(
                                    value: value,
                                    items: [
                                      for (var value in _urlRootList)
                                        DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value,
                                        )
                                    ],
                                    onChanged: (String selectedUrl) async =>
                                        _selectedUrl.value = selectedUrl,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              const Text("Durée d\'authentification "),
                              ValueListenableBuilder<String>(
                                valueListenable: _selectedTime,
                                builder: (context, value, _) {
                                  return DropdownButton<String>(
                                    value: _selectedTime.value,
                                    items: [
                                      for (var value in _timeMap.keys)
                                        DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value,
                                        )
                                    ],
                                    onChanged: (selectedTime) =>
                                        _selectedTime.value = selectedTime,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                focusNode: _uidFocusNode,
                                controller: _uidController,
                                decoration: const InputDecoration(
                                  hintText: "prénom.nom",
                                  labelText: "Nom d'utilisateur",
                                ),
                                onEditingComplete: () {
                                  _uidFocusNode.unfocus();
                                  FocusScope.of(context)
                                      .requestFocus(_pswdFocusNode);
                                },
                              ),
                              TextFormField(
                                controller: _pswdController,
                                obscureText: true,
                                focusNode: _pswdFocusNode,
                                decoration: const InputDecoration(
                                  hintText: "Mot de passe",
                                  labelText: "Mot de passe",
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Se souvenir "),
                            ValueListenableBuilder<bool>(
                              valueListenable: rememberMe,
                              builder: (context, value, _) {
                                return Checkbox(
                                  value: value,
                                  onChanged: (value) =>
                                      rememberMe.value = value,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: FloatingActionButton.extended(
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final snackBar =
                            SnackBar(content: const Text('Requested'));
                        Scaffold.of(context).showSnackBar(snackBar);
                        widget._gatewayAPI.autoLogin(
                          _uidController.text,
                          _pswdController.text,
                          _selectedUrl.value,
                          _timeMap[_selectedTime],
                        );
                        String calendarUrl =
                            await _calendarURLApi.getCalendarURL(
                          username: _uidController.text,
                          password: _pswdController.text,
                        );
                        ICalendar(_calendarURLApi)
                            .saveCalendar(calendarUrl)
                            .then((_) => setState(() {}));
                        if (rememberMe.value) {
                          prefs.setBool("rememberMe", true);
                          prefs.setString("user", _uidController.text);
                          prefs.setString("time", _selectedTime.value);
                          prefs.setString("pswd",
                              base64.encode(utf8.encode(_pswdController.text)));
                        } else {
                          prefs.remove("rememberMe");
                          prefs.remove("user");
                          prefs.remove("time");
                          prefs.remove("pswd");
                        }
                        widget._portailAPI
                            .saveCookiePortailFromLogin(
                              username: _uidController.text,
                              password: _pswdController.text,
                            )
                            .then((_) => setState(() {}));
                      },
                      label: const Text(
                        "Se connecter",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: const Icon(Icons.arrow_forward),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  dispose() {
    _uidController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  @override
  initState() {
    super.initState();
    _rememberLogin();
  }

  Future<void> _rememberLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    rememberMe.value = prefs.getBool("rememberMe") ?? false;
    if (rememberMe.value) {
      _uidController.text = prefs.getString("user");
      _selectedTime.value = prefs.getString("time");
      _pswdController.text =
          utf8.decode(base64.decode(prefs.getString("pswd")));
    }
  }
}

class _StatusCard extends StatelessWidget {
  final PortailAPI _portailAPI;
  final CalendarUrlAPI _calendarURLApi;
  final GatewayAPI _gatewayAPI;
  final String _selectedUrl;

  const _StatusCard({
    Key key,
    @required PortailAPI portailAPI,
    @required CalendarUrlAPI calendarURL,
    @required GatewayAPI gatewayAPI,
    @required String selectedUrl,
  })  : _portailAPI = portailAPI,
        _calendarURLApi = calendarURL,
        _gatewayAPI = gatewayAPI,
        _selectedUrl = selectedUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              FutureBuilder<String>(
                  future: _gatewayAPI.getStatus(_selectedUrl),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const Text(
                          "Passerelle: ...",
                          style: const TextStyle(fontSize: 24),
                        );
                      case ConnectionState.done:
                        return Text.rich(
                          TextSpan(
                            text: "Passerelle: ",
                            style: const TextStyle(fontSize: 24),
                            children: <TextSpan>[
                              TextSpan(
                                text: snapshot.data,
                                style: TextStyle(
                                  color: snapshot.hasError
                                      ? Colors.red
                                      : Colors.black,
                                ),
                              ),
                            ],
                          ),
                        );
                    }
                    return null; //
                  }),
              Row(
                children: <Widget>[
                  const Text(
                    "Agenda: ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  FutureBuilder<String>(
                    future: _calendarURLApi
                        .savedCalendarURL, // a previously-obtained Future<String> or null
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        case ConnectionState.done:
                          if (snapshot.hasError || snapshot.data == "")
                            return const Icon(Icons.close, color: Colors.red);
                          return const Icon(Icons.done, color: Colors.green);
                      }
                      return null; // unreachable
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  const Text(
                    "Portail: ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  FutureBuilder<String>(
                    future: _portailAPI.getSavedCookiePortail(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return const CircularProgressIndicator();
                        case ConnectionState.done:
                          if (snapshot.hasError)
                            return const Icon(Icons.close, color: Colors.red);
                          else if (snapshot.data == "")
                            return const Icon(Icons.close, color: Colors.red);
                          return const Icon(Icons.done, color: Colors.green);
                      }
                      return null; // unreachable
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
