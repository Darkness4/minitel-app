import 'dart:io';

import 'package:auto_login_flutter/components/drawer.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';

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
  var _response = "";
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
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(children: <Widget>[
                  Text("Status: ", style: TextStyle(fontSize: 24)),
                  Text(
                    _status,
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  ),
                ]),
              ),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: <Widget>[
                      Row(children: <Widget>[
                        Text("Domain Name / IP "),
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
                          Text("Authentication duration "),
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
                                    hintText: 'Surname.Name',
                                    labelText: 'Username')),
                            TextFormField(
                                controller: _pswdController,
                                obscureText: true,
                                // Use secure text for passwords.
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password')),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          '$_response',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ),
                    ],
                  ))
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
                _response = "";
                _autoLogin(_uidController.text, _pswdController.text,
                    _selectedUrl, _timeMap[_selectedTime]);
                _getStatus(_selectedUrl);
              },
              //onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.lock_open),
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

  initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _getStatus(_selectedUrl));
  }

  _autoLogin(String uid, String pswd, String selectedUrl, int selectedTime) {
    var url = "https://$selectedUrl/auth/plain.html";
    var data = {
      'uid': uid,
      'time': '$selectedTime',
      'pswd': pswd
    }; // SessionId finder. If the SessionId is not found, adjust the RegEx.
    RegExp exp = RegExp(r'"(id=([^"]*))');

    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) =>
            true); // SECURITY WARNING  Bypass certificate!!!
    IOClient ioClient = IOClient(client);

    ioClient
        .post(url, body: data)
        .then((response) {
          // debugPrint(response.body);
          if (response.statusCode == 200) {
            if (response.body.contains('title_error'))
              throw ("Error: Bad Username or Password");
            else
              return response.body;
          } else
            throw Exception("HttpError: ${response.statusCode}");
        })
        .then((body) => exp.firstMatch(body))
        .then((match) {
          if (match.group(1) is! String)
            throw Exception(
                "Error: SessionId doesn't exist. Please check if the RegEx is updated.");
          else
            return match.group(1);
        })
        .then((sessionId) =>
            {'session': sessionId, 'read': 'accepted', 'action': "J'accepte"})
        .then((data) {
          url = "https://$selectedUrl/auth/disclaimer.html";
          ioClient.post(url, body: data).then((response) {
            if (response.body.contains('title_error'))
              throw Exception(
                  "Error: SessionId is incorrect. Please check the RegEx.");
            else
              return response.body;
          }).then((body) {
            exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');
            return exp.firstMatch(body);
          }).then((match) {
            if (match.group(1) is! String)
              throw Exception(
                  "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
            else
              setState(() {
                _response = "Success";
                _status = '${match.group(1)} seconds left';
              });
          }).catchError((e) => setState(() => _status = e.toString()));
        })
        .catchError((e) => setState(() => _response = e.toString()));
  }

  _changedTimeItem(String selectedTime) {
    setState(() {
      _selectedTime = selectedTime;
    });
  }

  _changedUrlItem(String selectedUrl) {
    _selectedUrl = selectedUrl;
    _getStatus(_selectedUrl);
  }

  _getStatus(String selectedUrl) {
    var url = 'https://$selectedUrl/auth/';
    /*var headers = {
      "Host": selectedUrl,
      "Accept-Encoding": 'gzip, deflate, br',
      "Accept": "text/html",
      "Accept-Language": 'fr-FR,fr;q=0.9,en-US;q=0.8,en;q=0.7',
      "DNT": '1',
      "Upgrade-Insecure-Requests": '1',
      "User-Agent":
      'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36 Vivaldi/2.2.1388.37',
    }*/
    RegExp exp = RegExp(r'<span id="l_rtime">([^<]*)<\/span>');

    HttpClient client = HttpClient();
    client.badCertificateCallback =
        ((X509Certificate cert, String host, int port) =>
            true); // SECURITY WARNING  Bypass certificate!!!
    IOClient ioClient = IOClient(client);

    ioClient
        .post(url) // TODO: GET instead of POST
        .then((response) {
          // debugPrint(response.body);
          if (response.statusCode == 200) {
            if (!response.body.contains('l_rtime'))
              throw ("Not logged in");
            else
              return response.body;
          } else
            throw Exception("HttpError: ${response.statusCode}");
        })
        .then((body) => exp.firstMatch(body))
        .then((match) {
          if (match.group(1) is! String)
            throw Exception(
                "Error: l_rtime doesn't exist. Please check if the RegEx is updated.");
          else
            setState(() => _status = '${match.group(1)} seconds left');
        })
        .catchError((e) => setState(() => _status = e.toString()));
  }
}
