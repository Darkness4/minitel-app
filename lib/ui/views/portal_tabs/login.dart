import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/constants/login_constants.dart';
import 'package:minitel_toolbox/core/services/calendar_url_api.dart';
import 'package:minitel_toolbox/core/services/imprimante_api.dart';
import 'package:minitel_toolbox/core/services/stormshield_api.dart';
import 'package:minitel_toolbox/core/services/portail_emse_api.dart';
import 'package:minitel_toolbox/core/viewmodels/views/portail_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final PortailViewModel model;
  const LoginPage({
    @required this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: model.refresh,
      child: ListView(
        key: const Key('login/list'),
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          _StatusCard(
            selectedUrl: model.selectedUrl.value,
          ),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            elevation: 10.0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FittedBox(
                    child: Row(
                      children: <Widget>[
                        Text(AppLoc.of(context).portal.domainNameHeader),
                        ValueListenableBuilder<String>(
                          valueListenable: model.selectedUrl,
                          builder: (BuildContext context, String value, _) {
                            return DropdownButton<String>(
                              key: const Key('login/name_server'),
                              value: value,
                              items: <DropdownMenuItem<String>>[
                                for (String value in LoginConstants.urlRootList)
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
                        Text(AppLoc.of(context).portal.authTime),
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
                    key: model.formKey,
                    child: FocusScope(
                      node: model.formNode,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              key: const Key('login/uid'),
                              controller: model.uidController,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.person),
                                hintText:
                                    AppLoc.of(context).portal.usernameHint,
                                labelText:
                                    AppLoc.of(context).portal.usernameLabel,
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return AppLoc.of(context).reporting.notEmpty;
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) {
                                model.formNode.nextFocus();
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: TextFormField(
                              key: const Key('login/pswd'),
                              controller: model.pswdController,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.vpn_key),
                                labelText: AppLoc.of(context).portal.password,
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return AppLoc.of(context).reporting.notEmpty;
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) {
                                model.formNode.unfocus();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(AppLoc.of(context).portal.rememberMe),
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
                      Text(AppLoc.of(context).portal.autoLogin),
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
        ],
      ),
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
    final ImprimanteAPI _imprimanteAPI = Provider.of<ImprimanteAPI>(context);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
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
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                String status = '';
                if (snapshot.hasData) {
                  final Duration duration =
                      Duration(seconds: int.parse(snapshot.data));
                  if (duration.inSeconds < 300) {
                    status = AppLoc.of(context)
                        .portal
                        .statusInSeconds(duration.inSeconds);
                  } else if (duration.inMinutes < 60) {
                    status = AppLoc.of(context)
                        .portal
                        .statusInMinutes(duration.inMinutes);
                  } else {
                    status = AppLoc.of(context)
                        .portal
                        .statusInHM(duration.inHours, duration.inMinutes % 60);
                  }
                }
                return Column(
                  children: <Widget>[
                    LinearProgressIndicator(
                      value: (snapshot.hasData && !snapshot.hasError)
                          ? Duration(seconds: int.parse(snapshot.data))
                                  .inSeconds /
                              28800
                          : 0.0,
                      backgroundColor: (snapshot.hasData && !snapshot.hasError)
                          ? Theme.of(context).backgroundColor
                          : Theme.of(context).errorColor,
                    ),
                    Text(
                      snapshot.hasError ? snapshot.error.toString() : status,
                      key: const Key('login/gateway_text'),
                      style: TextStyle(
                        color: (snapshot.hasData && !snapshot.hasError)
                            ? Theme.of(context).accentColor
                            : Theme.of(context).errorColor,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    LinearProgressIndicator(
                      value: (snapshot.hasData && !snapshot.hasError)
                          ? Duration(seconds: int.parse(snapshot.data))
                                  .inSeconds /
                              28800
                          : 0.0,
                      backgroundColor: (snapshot.hasData && !snapshot.hasError)
                          ? Theme.of(context).backgroundColor
                          : Theme.of(context).errorColor,
                    ),
                  ],
                );
              },
            ),
            Row(
              children: <Widget>[
                Text(
                  "${AppLoc.of(context).agenda.title}: ",
                  style: const TextStyle(fontSize: 20),
                ),
                FutureBuilder<String>(
                  future: _calendarUrlAPI
                      .savedCalendarURL, // a previously-obtained Future<String> or null
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.hasError ||
                        snapshot.data == "") {
                      return Icon(
                        Icons.close,
                        color: Theme.of(context).errorColor,
                      );
                    }
                    return Icon(
                      Icons.done,
                      color: Theme.of(context).accentColor,
                      key: const Key('login/agenda_success'),
                    ); // unreachable
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "${AppLoc.of(context).portal.title}: ",
                  style: const TextStyle(fontSize: 20),
                ),
                if (_portailAPI.cookies.isEmpty)
                  Icon(
                    Icons.close,
                    color: Theme.of(context).errorColor,
                  )
                else
                  Icon(
                    Icons.done,
                    color: Theme.of(context).accentColor,
                    key: const Key('login/portail_success'),
                  )
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "${AppLoc.of(context).portal.apps.printer}: ",
                  style: const TextStyle(fontSize: 20),
                ),
                if (_imprimanteAPI.cookie == null)
                  Icon(
                    Icons.close,
                    color: Theme.of(context).errorColor,
                  )
                else
                  Icon(
                    Icons.done,
                    color: Theme.of(context).accentColor,
                    key: const Key('login/imprimante_success'),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
