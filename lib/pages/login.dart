import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  LoginPage({Key key, this.title}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _uidController = TextEditingController();
  final _pswdController = TextEditingController();
  final List<String> _urlRootList = ['172.17.0.1', 'fw-cgcp.emse.fr'];
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          color: Colors.lightBlueAccent,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Material(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                  type: MaterialType.card,
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
              ),
              Material(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                type: MaterialType.card,
                elevation: 10.0,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text("${AppLoc.of(context).wordDomain} / IP "),
                        DropdownButton<String>(
                          value: _selectedUrl,
                          items: _urlRootList.map((String value) {
                            return DropdownMenuItem<String>(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: _changedUrlItem,
                        ),
                      ]),
                      Row(
                        children: <Widget>[
                          Text(AppLoc.of(context).wordsAuthDuration),
                          DropdownButton<String>(
                            value: _selectedTime,
                            items: _timeMap.keys.map((String value) {
                              return DropdownMenuItem<String>(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: _changedTimeItem,
                          ),
                        ],
                      ),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                                controller: _uidController,
                                decoration: InputDecoration(
                                    hintText:
                                        AppLoc.of(context).wordSurnameName,
                                    labelText:
                                        AppLoc.of(context).wordUsername)),
                            TextFormField(
                                controller: _pswdController,
                                obscureText: true,
                                // Use secure text for passwords.
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
            ],
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: Text('Requested'),
                );
                Scaffold.of(context).showSnackBar(snackBar);
                autoLogin(_uidController.text, _pswdController.text,
                        _selectedUrl, _timeMap[_selectedTime])
                    .then((status) => setState(() => _status = status));
              },
              //onPressed: _incrementCounter,
              tooltip: 'Log in',
              child: Icon(Icons.lock_open),
              backgroundColor: Colors.yellow,
              foregroundColor: Colors.black,
            ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  dispose() {
    // Clean up the controller when the Widget is disposed
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

  _changedTimeItem(String selectedTime) {
    setState(() => _selectedTime = selectedTime);
  }

  _changedUrlItem(String selectedUrl) {
    _selectedUrl = selectedUrl;
    getStatus(_selectedUrl).then((status) => setState(() => _status = status));
  }
}
