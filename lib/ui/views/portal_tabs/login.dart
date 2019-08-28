import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/core/services/icalendar_api.dart';
import 'package:minitel_toolbox/core/viewmodels/views/portal_tabs/login_model.dart';
import 'package:minitel_toolbox/ui/widgets/base_view_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<LoginViewModel>(
      model: LoginViewModel(
        portailAPI: Provider.of<PortailAPI>(context),
        calendarUrlAPI: Provider.of<CalendarUrlAPI>(context),
        stormshieldAPI: Provider.of<StormshieldAPI>(context),
        iCalendar: Provider.of<ICalendarAPI>(context),
      ),
      onModelReady: (LoginViewModel model) => model.rememberLogin(context),
      builder: (BuildContext context, LoginViewModel model, Widget _) {
        return ListView(
          key: const Key('login/list'),
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
                    Form(
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              key: const Key('login/uid'),
                              focusNode: model.uidFocusNode,
                              controller: model.uidController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.person),
                                hintText: "prenom.nom",
                                labelText: "Nom d'utilisateur",
                              ),
                              onEditingComplete: () {
                                model.uidFocusNode.unfocus();
                                FocusScope.of(context)
                                    .requestFocus(model.pswdFocusNode);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              key: const Key('login/pswd'),
                              controller: model.pswdController,
                              obscureText: true,
                              focusNode: model.pswdFocusNode,
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
                        model.uidController.text,
                        model.pswdController.text,
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
    );
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
    final StormshieldAPI _gatewayAPI = Provider.of<StormshieldAPI>(context);
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
                if (_portailAPI.cookies.isEmpty)
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
