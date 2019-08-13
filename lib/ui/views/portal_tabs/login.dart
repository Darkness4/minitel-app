import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:minitel_toolbox/core/viewmodels/views/portal_tabs/login_model.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _uidFocusNode = FocusNode();
  final _pswdFocusNode = FocusNode();
  final _uidController = TextEditingController();
  final _pswdController = TextEditingController();
  final ValueNotifier<String> _selectedTime = ValueNotifier<String>('4 hours');
  final ValueNotifier<String> _selectedUrl =
      ValueNotifier<String>(MyIPAdresses.stormshieldIP);
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        portailAPI: Provider.of<PortailAPI>(context),
        calendarUrlAPI: Provider.of<CalendarUrlAPI>(context),
        gatewayAPI: Provider.of<GatewayAPI>(context),
        rememberMe: _rememberMe,
        selectedTime: _selectedTime,
        selectedUrl: _selectedUrl,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                key: Key('login/uidTextField'),
                focusNode: _uidFocusNode,
                controller: _uidController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: "prenom.nom",
                  labelText: "Nom d'utilisateur",
                ),
                onEditingComplete: () {
                  _uidFocusNode.unfocus();
                  FocusScope.of(context).requestFocus(_pswdFocusNode);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                key: Key('login/pswdTextField'),
                controller: _pswdController,
                obscureText: true,
                focusNode: _pswdFocusNode,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.vpn_key),
                  labelText: "Mot de passe",
                ),
              ),
            ),
          ],
        ),
      ),
      builder: (context, model, Widget loginForm) => ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          _StatusCard(
            selectedUrl: model.selectedUrl.value,
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
                          valueListenable: model.selectedUrl,
                          builder: (context, value, _) {
                            return DropdownButton<String>(
                              key: Key('login/nameServerDropdownButton'),
                              value: value,
                              items: [
                                for (var value in LoginConstants.urlRootList)
                                  DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  )
                              ],
                              onChanged: (String selectedUrl) async =>
                                  model.selectedUrl.value = selectedUrl,
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
                          valueListenable: model.selectedTime,
                          builder: (context, value, _) {
                            return DropdownButton<String>(
                              key: Key('login/timeDropdownButton'),
                              value: model.selectedTime.value,
                              items: [
                                for (var value in LoginConstants.timeMap.keys)
                                  DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value,
                                  ),
                              ],
                              onChanged: (selectedTime) =>
                                  model.selectedTime.value = selectedTime,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  loginForm,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Se souvenir "),
                      ValueListenableBuilder<bool>(
                        valueListenable: model.rememberMe,
                        builder: (context, value, _) {
                          return Checkbox(
                            key: Key('login/rememberMeButton'),
                            value: value,
                            onChanged: (value) =>
                                model.rememberMe.value = value,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: model.loginState == LoginState.Busy
                ? const CircularProgressIndicator()
                : FloatingActionButton.extended(
                    key: Key('login/connect'),
                    onPressed: () => model.login(
                      context,
                      _uidController.text,
                      _pswdController.text,
                    ),
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
        ],
      ),
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

  void _rememberLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _rememberMe.value = prefs.getBool("rememberMe") ?? false;
    if (_rememberMe.value) {
      _uidController.text = prefs.getString("user");
      _selectedTime.value = prefs.getString("time");
      _pswdController.text =
          utf8.decode(base64.decode(prefs.getString("pswd")));
    }
  }
}

class _StatusCard extends StatelessWidget {
  final String _selectedUrl;

  const _StatusCard({
    Key key,
    @required String selectedUrl,
  })  : _selectedUrl = selectedUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final _gatewayAPI = Provider.of<GatewayAPI>(context);
    final _portailAPI = Provider.of<PortailAPI>(context);
    final _calendarUrlAPI = Provider.of<CalendarUrlAPI>(context);

    return Card(
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FutureBuilder<String>(
                future: _gatewayAPI.getStatus(
                  _selectedUrl,
                  cookie: _gatewayAPI.cookie,
                ),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return const Center(
                        child: LinearProgressIndicator(),
                      );
                    case ConnectionState.done:
                      return Text(
                        snapshot.data,
                        key: Key('login/gatewayText'),
                        style: TextStyle(
                            color: (snapshot.hasError ||
                                    !snapshot.data.contains("second"))
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      );
                  }
                  return null; //
                }),
            Row(
              children: <Widget>[
                const Text(
                  "Agenda: ",
                  style: TextStyle(fontSize: 20),
                ),
                FutureBuilder<String>(
                  future: _calendarUrlAPI
                      .savedCalendarURL, // a previously-obtained Future<String> or null
                  builder: (BuildContext context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        if (snapshot.hasError || snapshot.data == "") {
                          return const Icon(
                            Icons.close,
                            color: Colors.red,
                            key: Key('login/agendaFailure'),
                          );
                        }
                        return const Icon(
                          Icons.done,
                          color: Colors.green,
                          key: Key('login/agendaSuccess'),
                        );
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
                  style: TextStyle(fontSize: 20),
                ),
                FutureBuilder<String>(
                  future: _portailAPI.getSavedCookiePortail(),
                  builder: (BuildContext context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.active:
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      case ConnectionState.done:
                        if (snapshot.hasError || snapshot.data == "") {
                          return const Icon(
                            Icons.close,
                            color: Colors.red,
                            key: Key('login/agendaFailure'),
                          );
                        } else {
                          return const Icon(
                            Icons.done,
                            color: Colors.green,
                            key: Key('login/agendaSuccess'),
                          );
                        }
                    }
                    return null; // unreachable
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
