import 'dart:io';

import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wifi/wifi.dart';

class DiagnosePage extends StatefulWidget {
  final String title;

  DiagnosePage({Key key, this.title}) : super(key: key);

  @override
  _DiagnosePageState createState() => _DiagnosePageState();
}

class _DiagnosePageState extends State<DiagnosePage> {
  var _alert = "";
  var _statusPublic = "";
  var _statusDNS = "";
  var _level = "";
  var _ssid = "";
  var _ip = "";
  var _ipAll = "";
  var _ifconfig = "";
  var _arp = "";
  var _tracertGoogle = "";
  var _tracertGoogleDNS = "";
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
  var _nsLookupEMSEBusybox = "";
  var _nsLookupGoogleBusybox = "";

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
                LogCard(
                  _ipAll,
                  title: "ip a",
                ),
                LogCard(
                  _ifconfig,
                  title: "ifconfig all",
                ),
                LogCard(
                  _arp,
                  title: "Address Resolution Protocol (Busybox)",
                ),
                LogCard(
                  _tracertGoogle,
                  title: "Traceroute Google (Busybox + Root)",
                ),
                LogCard(
                  _tracertGoogleDNS,
                  title: "Traceroute GoogleDNS (Busybox + Root)",
                ),
                LogCard(
                  _pingLo,
                  title: "Ping Loopback",
                ),
                LogCard(
                  _pingLocal,
                  title: "Ping Local",
                ),
                LogCard(
                  _statusPublic,
                  title: "HTTP Portal Response (195.83.139.7)",
                ),
                LogCard(
                  _statusDNS,
                  title: "HTTP Portal Response (fw-cgcp.emse.fr)",
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
                LogCard(
                  _nsLookupEMSEBusybox,
                  title: "NSLookupEMSE (Busybox)",
                ),
                LogCard(
                  _nsLookupGoogleBusybox,
                  title: "NSLookupGoogle (Busybox)",
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: MainDrawer(),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
              onPressed: _diagnose,
              icon: Icon(Icons.zoom_in),
              label: Text(AppLoc.of(context).verbDiagnose),
            ),
      ),
    );
  }

  _diagnose() async {
    setState(() {
      _alert = "";
      _statusPublic = _statusDNS = _ssid = _level = _ip = _ipAll = _ifconfig = _arp =
          _tracertGoogle = _tracertGoogleDNS = _pingLo = _pingLocal =
              _pingGateway = _pingDNS1 = _pingDNS2 = _pingDNS3 = _pingDNS4 =
                  _pingDNS5 = _nsLookupEMSE = _nsLookupGoogle =
                      _nsLookupEMSEBusybox = _nsLookupGoogleBusybox =
                          _nsLookupGoogleBusybox = "Loading...";
    });
    const argsPing = "-c 4 -w 5 -W 5";

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String ssid;
      PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location)
          .then((answer) {
        if (answer == PermissionStatus.granted)
          Connectivity().getWifiName().then((out) => ssid = out);
        else
          PermissionHandler().requestPermissions([PermissionGroup.location]);
      });
      var level = await Wifi.level;
      var ip = await Wifi.ip;

      setState(() {
        _ssid = ssid;
        _level = '$level';
        _ip = ip;
      });

      exec("ip", [
        'a',
      ]).runGetOutput().then((out) =>
          setState(() => _ipAll = out.isEmpty ? "Nothing to show" : out));
      exec("ifconfig", [
        '-a',
      ]).runGetOutput().then((out) =>
          setState(() => _ifconfig = out.isEmpty ? "Nothing to show" : out));
      exec("arp", [
        '-a',
      ]).runGetOutput().then((out) =>
          setState(() => _arp = out.isEmpty ? "Nothing to show" : out)).catchError((e) => _arp);
      exec("su", [
        '-c',
        'traceroute',
        'google.com',
      ]).runGetOutput().then((out) => setState(
          () => _tracertGoogle = out.isEmpty ? "Nothing to show" : out)).catchError((e) => _tracertGoogle);
      exec("su", [
        '-c',
        'traceroute',
        '8.8.8.8',
      ]).runGetOutput().then((out) => setState(
          () => _tracertGoogleDNS = out.isEmpty ? "Nothing to show" : out)).catchError((e) => _tracertGoogleDNS);
      exec("ping", [argsPing, "127.0.0.1"]).runGetOutput().then((out) =>
          setState(() => _pingLo = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "10.163.0.5"]).runGetOutput().then((out) =>
          setState(() => _pingLocal = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "10.163.0.2"]).runGetOutput().then((out) =>
          setState(() => _pingGateway = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "192.168.130.33"]).runGetOutput().then((out) =>
          setState(() => _pingDNS1 = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "192.168.130.3"]).runGetOutput().then((out) =>
          setState(() => _pingDNS2 = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "8.8.8.8"]).runGetOutput().then((out) =>
          setState(() => _pingDNS3 = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "1.1.1.1"]).runGetOutput().then((out) =>
          setState(() => _pingDNS4 = out.isEmpty ? "Nothing to show" : out));
      exec("ping", [argsPing, "10.163.0.6"]).runGetOutput().then((out) =>
          setState(() => _pingDNS5 = out.isEmpty ? "Nothing to show" : out));
      exec("nslookup", ["fw-cgcp.emse.fr"]).runGetOutput().then((out) =>
          setState(() =>
              _nsLookupEMSEBusybox = out.isEmpty ? "Nothing to show" : out)).catchError((e) => _nsLookupEMSEBusybox);
      exec("nslookup", ["google.com"]).runGetOutput().then((out) => setState(
          () =>
              _nsLookupGoogleBusybox = out.isEmpty ? "Nothing to show" : out)).catchError((e) => _nsLookupGoogleBusybox);

      getStatus("195.83.139.7").then((status) => setState(
          () => _statusPublic = status.isEmpty ? "Nothing to show" : status));
      getStatus("fw-cgcp.emse.fr").then((status) => setState(
          () => _statusDNS = status.isEmpty ? "Nothing to show" : status));

      InternetAddress.lookup("fw-cgcp.emse.fr")
          .then((addresses) => addresses.forEach((address) => setState(() =>
              _nsLookupEMSE =
                  "Host: ${address.host}\nLookup: ${address.address}")))
          .catchError((e) => setState(() => _nsLookupEMSE = e.toString()));

      InternetAddress.lookup("google.com")
          .then((addresses) => addresses.forEach((address) => setState(() =>
              _nsLookupGoogle =
                  "Host: ${address.host}\nLookup: ${address.address}")))
          .catchError((e) => setState(() => _nsLookupGoogle = e.toString()));
    } else
      setState(() => _alert = AppLoc.of(context).sentenceNotConnected);
  }

  _share() {
    var now = DateTime.now().toString();
    Share.share("---Report $now---\n"
        "SSID: $_ssid, Level: $_level, Ip: $_ip\n\n"
        "ip a: \n$_ipAll\n\n"
        "ifconfig: \n$_ifconfig\n\n"
        "ARP: \n$_arp\n\n"
        "Traceroute Google: \n$_tracertGoogle\n\n"
        "Traceroute Google DNS: \n$_tracertGoogle\n\n"
        "Ping Loopback: \n$_pingLo\n\n"
        "Ping Local: \n$_pingLocal\n\n"
        "HTTP Portal Response: \n$_statusPublic\n\n"
        "HTTP Portal Response: \n$_statusDNS\n\n"
        "Ping Gateway: \n$_pingLo\n\n"
        "Ping DNS1: \n$_pingDNS1\n\n"
        "Ping DNS2: \n$_pingDNS2\n\n"
        "Ping DNS3: \n$_pingDNS3\n\n"
        "Ping DNS4: \n$_pingDNS4\n\n"
        "Ping DNS5: \n$_pingDNS5\n\n"
        "NSLookup EMSE: \n$_nsLookupEMSE\n\n"
        "NSLookup Google: \n$_nsLookupGoogle\n\n"
        "NSLookup EMSE (Busybox): \n$_nsLookupEMSEBusybox\n\n"
        "NSLookup Google (Busybox): \n$_nsLookupGoogleBusybox\n\n");
  }
}
