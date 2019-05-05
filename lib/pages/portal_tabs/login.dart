import 'package:auto_login_flutter/funcs/http_calendar.dart';
import 'package:auto_login_flutter/funcs/http_portail.dart';
import 'package:flutter/material.dart';

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
  var _savedCalendar = false;
  var _selectedTime = '4 hours'; // Default
  var _selectedUrl = 'fw-cgcp.emse.fr';

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topRight,
              colors: [
                const Color(0xff89f7fe),
                const Color(0xff66a6ff)
              ], // whitish to gray
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _StatusCard(
                  status: _status,
                  savedCalendar: _savedCalendar,
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
                  padding: const EdgeInsets.all(30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: RaisedButton(
                      shape: const ContinuousRectangleBorder(),
                      color: Colors.lightBlueAccent,
                      elevation: 4,
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
                        ).then((out) => setState(() => _savedCalendar = out));
                      },
                      child: const Text(
                        "LOGIN",
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
  final bool _savedCalendar;

  const _StatusCard({
    Key key,
    @required String status,
    @required bool savedCalendar,
  })  : _status = status,
        _savedCalendar = savedCalendar,
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
                  _savedCalendar
                      ? const Icon(Icons.done, color: Colors.green)
                      : const Icon(Icons.close, color: Colors.red),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
