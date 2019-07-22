import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/models/icalendar.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  final PortailAPI _portail;
  final GatewayAPI _gateway;
  const LoginPage(
      {Key key, @required PortailAPI portail, @required GatewayAPI gateway})
      : _portail = portail,
        _gateway = gateway,
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
  final _calendarURL = CalendarURLAPI();
  final List<String> _urlRootList = [
    '10.163.0.2',
    'fw-cgcp.emse.fr',
    '195.83.139.7',
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
  var _status = "";
  var _selectedTime = '4 hours'; // Default
  var _selectedUrl = '195.83.139.7';
  bool rememberMe = false;

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
                  portail: widget._portail,
                  calendarURL: _calendarURL,
                  status: _status,
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
                              Text("Nom de domaine / IP "),
                              DropdownButton<String>(
                                value: _selectedUrl,
                                items: _urlRootList
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String selectedUrl) {
                                  _selectedUrl = selectedUrl;
                                  widget._gateway.getStatus(_selectedUrl).then(
                                      (status) =>
                                          setState(() => _status = status));
                                },
                              ),
                            ],
                          ),
                        ),
                        FittedBox(
                          child: Row(
                            children: <Widget>[
                              Text("Durée d\'authentification "),
                              DropdownButton<String>(
                                value: _selectedTime,
                                items: _timeMap.keys
                                    .map((String value) =>
                                        DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (selectedTime) => setState(
                                    () => _selectedTime = selectedTime),
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
                                decoration: InputDecoration(
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
                                decoration: InputDecoration(
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
                            Text("Se souvenir "),
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) =>
                                  setState(() => rememberMe = value),
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
                        final snackBar = SnackBar(content: Text('Requested'));
                        Scaffold.of(context).showSnackBar(snackBar);
                        widget._gateway
                            .autoLogin(
                              _uidController.text,
                              _pswdController.text,
                              _selectedUrl,
                              _timeMap[_selectedTime],
                            )
                            .then((status) => setState(() => _status = status));
                        String calendarUrl = await _calendarURL.getCalendarURL(
                          username: _uidController.text,
                          password: _pswdController.text,
                        );
                        ICalendar(_calendarURL)
                            .saveCalendar(calendarUrl)
                            .then((_) => setState(() {}));
                        if (rememberMe) {
                          prefs.setString("user", _uidController.text);
                          prefs.setString("time", _selectedTime);
                          prefs.setString("pswd",
                              base64.encode(utf8.encode(_pswdController.text)));
                        } else {
                          prefs.remove("user");
                          prefs.remove("time");
                          prefs.remove("pswd");
                        }
                        widget._portail
                            .saveCookiePortailFromLogin(
                              username: _uidController.text,
                              password: _pswdController.text,
                            )
                            .then((_) => setState(() {}));
                      },
                      label: const Text(
                        "Se connecter",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      icon: Icon(Icons.arrow_forward),
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
    WidgetsBinding.instance.addPostFrameCallback((_) => widget._gateway
        .getStatus(_selectedUrl)
        .then((status) => setState(() => _status = status)));
    _rememberLogin();
  }

  _rememberLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _uidController.text = prefs.getString("user");
    _selectedTime = prefs.getString("time");
    if (_uidController.text != "") {
      _pswdController.text =
          utf8.decode(base64.decode(prefs.getString("pswd")));
      rememberMe = true;
    }
  }
}

class _StatusCard extends StatelessWidget {
  final String _status;
  final PortailAPI _portail;
  final CalendarURLAPI _calendarURL;

  const _StatusCard({
    Key key,
    @required String status,
    @required PortailAPI portail,
    @required CalendarURLAPI calendarURL,
  })  : _status = status,
        _portail = portail,
        _calendarURL = calendarURL,
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
              Text.rich(
                TextSpan(
                  text: "Gateway: ",
                  style: const TextStyle(fontSize: 24),
                  children: <TextSpan>[
                    TextSpan(
                      text: _status,
                      style: const TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  const Text(
                    "Calendar: ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  FutureBuilder<String>(
                    future: _calendarURL
                        .savedCalendarURL, // a previously-obtained Future<String> or null
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
              Row(
                children: <Widget>[
                  const Text(
                    "Portail: ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  FutureBuilder<String>(
                    future: _portail.getSavedCookiePortail(),
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