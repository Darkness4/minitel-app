import 'package:flutter/material.dart';
import 'package:minitel_toolbox/funcs/http_calendar.dart';
import 'package:minitel_toolbox/funcs/http_gateway.dart';
import 'package:minitel_toolbox/funcs/http_campus.dart';
import 'package:minitel_toolbox/funcs/http_portail.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _uidFocusNode = FocusNode();
  final _pswdFocusNode = FocusNode();
  final _uidController = TextEditingController();
  final _pswdController = TextEditingController();
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
    '8 hours': 480,
  };
  var _status = "";
  var _selectedTime = '4 hours'; // Default
  var _selectedUrl = 'fw-cgcp.emse.fr';

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
                  status: _status,
                ),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(
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
                                getStatus(_selectedUrl).then((status) =>
                                    setState(() => _status = status));
                              },
                            ),
                          ],
                        ),
                        Row(
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
                              onChanged: (selectedTime) =>
                                  setState(() => _selectedTime = selectedTime),
                            ),
                          ],
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RaisedButton(
                    color: Color(0xff087f23),
                    elevation: 10.0,
                    onPressed: () {
                      final snackBar = SnackBar(content: Text('Requested'));
                      Scaffold.of(context).showSnackBar(snackBar);
                      autoLogin(
                        _uidController.text,
                        _pswdController.text,
                        _selectedUrl,
                        _timeMap[_selectedTime],
                      ).then((status) => setState(() => _status = status));
                      saveCalendarFromLogin(
                        username: _uidController.text,
                        password: _pswdController.text,
                      ).then((status) => setState(() {}));
                      saveCookieCampusFromLogin(
                        username: _uidController.text,
                        password: _pswdController.text,
                      ).then((status) => setState(() {}));
                      saveCookiePortailFromLogin(
                        username: _uidController.text,
                        password: _pswdController.text,
                      ).then((status) => setState(() {}));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: const Text(
                        "Se connecter",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
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
    WidgetsBinding.instance.addPostFrameCallback((_) => getStatus(_selectedUrl)
        .then((status) => setState(() => _status = status)));
  }
}

class _StatusCard extends StatelessWidget {
  final String _status;

  const _StatusCard({
    Key key,
    @required String status,
  })  : _status = status,
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
                    future:
                        getSavedCalendarURL(), // a previously-obtained Future<String> or null
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return Text('Awaiting result...');
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
                    "Campus: ",
                    style: const TextStyle(fontSize: 20),
                  ),
                  FutureBuilder<String>(
                    future: getSavedCookieCampus(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return Text('Awaiting result...');
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
                    future: getSavedCookiePortail(),
                    builder:
                        (BuildContext context, AsyncSnapshot<String> snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                        case ConnectionState.active:
                        case ConnectionState.waiting:
                          return Text('Awaiting result...');
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
