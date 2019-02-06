import 'dart:io';

import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
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
                LogCard(_permission,
                    title: "Permission Coarse Location (for SSID)"),
                LogCard(
                  _pingLo,
                  title: "Ping Loopback",
                ),
                LogCard(
                  _pingLocal,
                  title: "Ping Local",
                ),
                LogCard(
                  _status,
                  title: "HTTP Gateway Response",
                ),
                LogCard(
                  _pingGateway,
                  title: "Ping Gateway",
                ),
                LogCard(
                  _pingDNS1,
                  title: "Ping DNS 1",
                ),
                LogCard(
                  _pingDNS2,
                  title: "Ping DNS 2",
                ),
                LogCard(
                  _pingDNS3,
                  title: "Ping DNS 3",
                ),
                LogCard(
                  _pingDNS4,
                  title: "Ping DNS 4",
                ),
                LogCard(
                  _pingDNS5,
                  title: "Ping DNS 5",
                ),
                LogCard(
                  _nsLookupEMSE,
                  title: "NSLookupEMSE",
                ),
                LogCard(
                  _nsLookupGoogle,
                  title: "NSLookupGoogle",
                ),
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
              label: Text(AppLoc
                  .of(context)
                  .verbDiagnose),
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

      getStatus("172.17.0.1")
          .then((status) => setState(() => _status = status));

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
      setState(() =>
      _alert = AppLoc
          .of(context)
          .sentenceNotConnected);
  }
}
