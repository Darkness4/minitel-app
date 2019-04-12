import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

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
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
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
                _StatusCard(status: _status),
                Card(
                  elevation: 10.0,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text("${AppLoc.of(context).wordDomain} / IP "),
                          DropdownButton<String>(
                            value: _selectedUrl,
                            items: _urlRootList
                                .map((String value) => DropdownMenuItem<String>(
                                      child: Text(value),
                                      value: value,
                                    ))
                                .toList(),
                            onChanged: (String selectedUrl) {
                              _selectedUrl = selectedUrl;
                              getStatus(_selectedUrl).then(
                                  (status) => setState(() => _status = status));
                            },
                          ),
                        ]),
                        Row(
                          children: <Widget>[
                            Text(AppLoc.of(context).wordsAuthDuration),
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
                                  hintText: AppLoc.of(context).wordSurnameName,
                                  labelText: AppLoc.of(context).wordUsername,
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
                                      hintText: AppLoc.of(context).wordPassword,
                                      labelText:
                                          AppLoc.of(context).wordPassword)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: RaisedButton(
                      shape: ContinuousRectangleBorder(),
                      color: Colors.greenAccent[400],
                      elevation: 4,
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: Text('Requested'),
                        );
                        Scaffold.of(context).showSnackBar(snackBar);
                        autoLogin(_uidController.text, _pswdController.text,
                                _selectedUrl, _timeMap[_selectedTime])
                            .then((status) => setState(() => _status = status));
                      },
                      child: Text(
                        "LOGIN",
                        style: TextStyle(
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
  const _StatusCard({
    Key key,
    @required String status,
  })  : _status = status,
        super(key: key);

  final String _status;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Card(
        elevation: 10.0,
        child: Padding(
          padding: EdgeInsets.all(25),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text("Status: ",
                    style: TextStyle(
                      fontSize: 24,
                    )),
                Text(
                  _status,
                  style: TextStyle(fontSize: 24, color: Colors.red),
                ),
              ]),
        ),
      ),
    );
  }
}
