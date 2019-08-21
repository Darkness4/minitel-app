import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/http_calendar_url.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_portail.dart';
import 'package:minitel_toolbox/core/services/icalendar.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FocusNode _uidFocusNode = FocusNode();
  final FocusNode _pswdFocusNode = FocusNode();
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _pswdController = TextEditingController();
  final ValueNotifier<String> _selectedTime = ValueNotifier<String>('4 hours');
  final ValueNotifier<String> _selectedUrl =
      ValueNotifier<String>(MyIPAdresses.stormshieldIP);
  final ValueNotifier<bool> _rememberMe = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _autoLogin = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        portailAPI: Provider.of<PortailAPI>(context),
        calendarUrlAPI: Provider.of<CalendarUrlAPI>(context),
        gatewayAPI: Provider.of<GatewayAPI>(context),
        iCalendar: Provider.of<ICalendar>(context),
        rememberMe: _rememberMe,
        selectedTime: _selectedTime,
        selectedUrl: _selectedUrl,
        autoLogin: _autoLogin,
      ),
      onModelReady: (LoginViewModel model) => _rememberLogin(context, model),
      builder: (BuildContext context, LoginViewModel model, Widget loginForm) {
        return ListView(
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
                            builder: (BuildContext context, String value, _) {
                              return DropdownButton<String>(
                                key: const Key('login/name_server'),
                                value: value,
                                items: <DropdownMenuItem<String>>[
                                  for (String value
                                      in LoginConstants.urlRootList)
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
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
                            builder: (BuildContext context, String value, _) {
                              return DropdownButton<String>(
                                key: const Key('login/time'),
                                value: model.selectedTime.value,
                                items: <DropdownMenuItem<String>>[
                                  for (String value
                                      in LoginConstants.timeMap.keys)
                                    DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ),
                                ],
                                onChanged: (String selectedTime) =>
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
                          builder: (BuildContext context, bool value, _) {
                            return Checkbox(
                              key: const Key('login/remember_me'),
                              value: value,
                              onChanged: (bool value) {
                                if (!value) {
                                  model.autoLogin.value = false;
                                }
                                model.rememberMe.value = value;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text("Se connecter automatiquement"),
                        ValueListenableBuilder<bool>(
                          valueListenable: model.autoLogin,
                          builder: (BuildContext context, bool value, _) {
                            return Checkbox(
                              key: const Key('login/auto_login'),
                              value: value,
                              onChanged: (bool value) {
                                if (value) {
                                  model.rememberMe.value = true;
                                }
                                model.autoLogin.value = value;
                              },
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
                      key: const Key('login/connect'),
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
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: TextFormField(
                key: const Key('login/uid'),
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
                key: const Key('login/pswd'),
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
    );
  }

  @override
  void dispose() {
    _uidController.dispose();
    _pswdController.dispose();
    super.dispose();
  }

  Future<void> _rememberLogin(
      BuildContext context, LoginViewModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _rememberMe.value = prefs.getBool("rememberMe") ?? false;
    if (_rememberMe.value) {
      _uidController.text = prefs.getString("user");
      _selectedTime.value = prefs.getString("time");
      _pswdController.text =
          utf8.decode(base64.decode(prefs.getString("pswd")));
      _autoLogin.value = prefs.getBool("autoLogin") ?? false;
    }
    if (_autoLogin.value) {
      await model.login(context, _uidController.text, _pswdController.text);
    }
  }
}

class _StatusCard extends StatelessWidget {
  final String _selectedUrl;

  const _StatusCard({
    @required String selectedUrl,
    Key key,
  })  : _selectedUrl = selectedUrl,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final GatewayAPI _gatewayAPI = Provider.of<GatewayAPI>(context);
    final PortailAPI _portailAPI = Provider.of<PortailAPI>(context);
    final CalendarUrlAPI _calendarUrlAPI = Provider.of<CalendarUrlAPI>(context);

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
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
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
                        key: const Key('login/gateway_text'),
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
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
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
                          );
                        }
                        return const Icon(
                          Icons.done,
                          color: Colors.green,
                          key: Key('login/agenda_success'),
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
                if (_portailAPI.cookie == null)
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  )
                else
                  const Icon(
                    Icons.done,
                    color: Colors.green,
                    key: Key('login/portail_success'),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
