import 'dart:io';

import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:share/share.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:wifi/wifi.dart';

class DiagnosePage extends StatefulWidget {
  final String title;

  DiagnosePage({Key key, this.title}) : super(key: key);

  @override
  _DiagnosePageState createState() => _DiagnosePageState();
}

class _DiagnosePageState extends State<DiagnosePage> {
  var _alert = "";
  var _status = "";
  var _ssid = "";
  var _level = "";
  var _ip = "";
  var _permission = "";
  var _pingLo = "";
  var _pingLocal = "";
  var _pingGateway = "";
  var _pingDNS1 = "";
  var _pingDNS2 = "";
  var _pingDNS3 = "";
  var _pingDNS4 = "";
  var _pingDNS5 = "";
  var _nsLookupEMSE = "";
  var _nsLookupGoogle = "";

  // var _loading = false;
  // (
  //   _status == "" &&
  //   _ssid == "" &&
  //   _level == "" &&
  //   _ip == "" &&
  // _permission == "" &&
  // _pingLo == "" &&
  // _pingLocal == "" &&
  // _pingDNS1 == "" &&
  // _pingDNS2 == "" &&
  // _pingDNS3 == "" &&
  // _pingDNS4 == "" &&
  // _pingDNS5 == "" &&
  // _nsLookupEMSE == "" &&
  // _nsLookupGoogle == ""
  // )

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _share,
          ),
        ],
      ),
      body: Center(
        child: Scrollbar(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text(_alert,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red)),
                Material(
                  elevation: 2.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40.0)),
                  color: Colors.deepOrange,
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text("SSID: $_ssid, Level: $_level, IP: $_ip",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                LogWidget("Permission Coarse Location (for SSID)", _permission),
                LogWidget("Ping Loopback", _pingLo),
                LogWidget("Ping Local", _pingLocal),
                LogWidget("HTTP Gateway Response", _status),
                LogWidget("Ping Gateway", _pingGateway),
                LogWidget("Ping DNS 1", _pingDNS1),
                LogWidget("Ping DNS 2", _pingDNS2),
                LogWidget("Ping DNS 3", _pingDNS3),
                LogWidget("Ping DNS 4", _pingDNS4),
                LogWidget("Ping DNS 5", _pingDNS5),
                LogWidget("NSLookupEMSE", _nsLookupEMSE),
                LogWidget("NSLookupGoogle", _nsLookupGoogle),
              ],
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) =>
            FloatingActionButton.extended(
              onPressed: () {
                _diagnose();
              },
              icon: Icon(Icons.zoom_in),
              label: Text("Diagnose"),
            ),
      ),
    );
  }

  _share() {
    var now = DateTime.now().toString();
    Share.share("---Report $now---\n"
        "SSID: $_ssid, Level: $_level, Ip: $_ip\n\n"
        "Permission Coarse Location: \n$_permission\n\n"
        "Ping Loopback: \n$_pingLo\n\n"
        "Ping Local: \n$_pingLocal\n\n"
        "HTTP Gateway Response: \n$_status\n\n"
        "Ping Gateway: \n$_pingLo\n\n"
        "Ping DNS1: \n$_pingDNS1\n\n"
        "Ping DNS2: \n$_pingDNS2\n\n"
        "Ping DNS3: \n$_pingDNS3\n\n"
        "Ping DNS4: \n$_pingDNS4\n\n"
        "Ping DNS5: \n$_pingDNS5\n\n"
        "NSLookup EMSE: \n$_nsLookupEMSE\n\n"
        "NSLookup Google: \n$_nsLookupGoogle\n\n");
  }

  _diagnose() async {
    setState(() => _alert = "");
    var argsPing = "-c 4 -w 5 -W 5";
    var status = await SimplePermissions.checkPermission(
        Permission.AccessCoarseLocation);
    if (!status) {
      await SimplePermissions.requestPermission(
          Permission.AccessCoarseLocation);
    }
    status = await SimplePermissions.checkPermission(
        Permission.AccessCoarseLocation);

    setState(() => _permission = (status ? "Authorized" : "Forbidded"));

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      var ssid = await Connectivity().getWifiName();
      var level = await Wifi.level;
      var ip = await Wifi.ip;

      setState(() {
        _ssid = ssid;
        _level = '$level';
        _ip = ip;
      });

      exec("ping", [argsPing, "127.0.0.1"])
          .runGetOutput()
          .then((out) => setState(() => _pingLo = out));
      exec("ping", [argsPing, "172.17.0.5"])
          .runGetOutput()
          .then((out) => setState(() => _pingLocal = out));
      exec("ping", [argsPing, "172.17.0.1"])
          .runGetOutput()
          .then((out) => setState(() => _pingGateway = out));
      exec("ping", [argsPing, "192.168.130.33"])
          .runGetOutput()
          .then((out) => setState(() => _pingDNS1 = out));
      exec("ping", [argsPing, "192.168.130.3"])
          .runGetOutput()
          .then((out) => setState(() => _pingDNS2 = out));
      exec("ping", [argsPing, "8.8.8.8"])
          .runGetOutput()
          .then((out) => setState(() => _pingDNS3 = out));
      exec("ping", [argsPing, "1.1.1.1"])
          .runGetOutput()
          .then((out) => setState(() => _pingDNS4 = out));
      exec("ping", [argsPing, "172.17.0.6"])
          .runGetOutput()
          .then((out) => setState(() => _pingDNS5 = out));

      _getStatus("172.17.0.1");

      InternetAddress.lookup("fw-cgcp.emse.fr")
          .then((addresses) =>
          addresses.forEach((address) =>
              setState(() =>
              _nsLookupEMSE =
              "Host: ${address.host}\nLookup: ${address.address}")))
          .catchError((e) => setState(() => _nsLookupEMSE = e.toString()));

      InternetAddress.lookup("google.com")
          .then((addresses) =>
          addresses.forEach((address) =>
              setState(() =>
              _nsLookupGoogle =
              "Host: ${address.host}\nLookup: ${address.address}")))
          .catchError((e) => setState(() => _nsLookupGoogle = e.toString()));
    } else
      setState(() => _alert = "Not connected to Wifi nor Mobile.");
  }

  _getStatus(String selectedUrl) {
    var url = 'https://$selectedUrl/auth/';
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
