import 'dart:async';
import 'dart:io';

import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/funcs/http_resquests.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'reporting_tabs/diagnose_tab.dart';
import 'reporting_tabs/report_tab.dart';

class ReportingPage extends StatefulWidget {
  final String title;

  const ReportingPage({Key key, this.title}) : super(key: key);

  @override
  ReportingPageState createState() => ReportingPageState();
}

class ReportingPageState extends State<ReportingPage>
    with SingleTickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  /// Control the animation of the speed dial.
  AnimationController _animationController;

  Map<String, String> _diagnosis = {};

  String _report = "";

  /// State of the Diagnosis.
  ///
  /// 0 = None, 1 = Loading, 2 = Done
  int _diagnosisState = 0;

  /// State of the "Send to Slack" action.
  ///
  /// 0 = None, 1 = Loading, 2 = Done
  int _reportState = 0;

  /// Used for the [CircularProgressIndicator], between 0.0 and 1.0.
  double _percentageDiagnoseProgress = 0.0;

  Widget get _diagnosisButton {
    return FloatingActionButton(
      backgroundColor: _diagnosisState == 2 ? Colors.green : Colors.blue,
      onPressed: () {
        if (!_animationController.isDismissed) _animationController.reverse();
        if (_diagnosisState != 1) {
          setState(() => _diagnosisState = 1);
          _percentageDiagnoseProgress = 0.0;
          Timer.periodic(
              const Duration(seconds: 1),
              (Timer t) =>
                  setState(() => _percentageDiagnoseProgress += 1 / 60));
          _diagnose(context).then((diagnosis) {
            _report = diagnosis;
            setState(() => _diagnosisState = 2);
          });
        }
      },
      child: _diagnosisIcon,
    );
  }

  Widget get _diagnosisIcon {
    switch (_diagnosisState) {
      case 0:
        return Icon(Icons.zoom_in);
        break;
      case 1:
        return CircularProgressIndicator(
          value: _percentageDiagnoseProgress,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        if (_animationController.isDismissed) _animationController.forward();
        return Icon(Icons.done);
        break;
      default:
        return Container();
    }
  }

  Widget get _mailButton {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.5, curve: Curves.easeOut),
      ),
      child: FloatingActionButton(
          heroTag: null,
          backgroundColor: Colors.red,
          child: Icon(Icons.mail),
          mini: true,
          onPressed: () async {
            var body = "---Report ${DateTime.now().toString()}---\n\n"
                "Titre: ${_titleController.text}\n"
                "Description: ${_descriptionController.text}\n\n"
                "*Diagnosis*\n"
                "$_report";
            _launchURL(
                "mailto:minitelismin@gmail.com?subject=${_titleController.text}&body=$body");
          }),
    );
  }

  Widget get _reportIcon {
    switch (_reportState) {
      case 0:
        return Image.asset("assets/img/Slack_Mark_Monochrome_White.png");
        break;
      case 1:
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        return Icon(
          Icons.done,
          color: Colors.white,
        );
        break;
      default:
        return Text("");
    }
  }

  Widget get _shareButton {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 1.0, curve: Curves.easeOut),
      ),
      child: FloatingActionButton(
        heroTag: null,
        backgroundColor: Colors.red,
        child: Icon(Icons.share),
        mini: true,
        onPressed: () =>
            Share.share("---Report ${DateTime.now().toString()}---\n\n"
                "Titre: ${_titleController.text}\n"
                "Description: ${_descriptionController.text}\n\n"
                "*Diagnosis*\n"
                "$_report"),
      ),
    );
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => <Widget>[
                    SliverAppBar(
                      title: Text(widget.title),
                      backgroundColor: Colors.red,
                      pinned: true,
                      floating: false,
                      forceElevated: true,
                      bottom: TabBar(
                        indicatorColor: Colors.white,
                        tabs: <Tab>[
                          Tab(
                            icon: Icon(Icons.warning),
                            text: "Report",
                          ),
                          Tab(
                            icon: Icon(Icons.zoom_in),
                            text: "Diagnosis",
                          ),
                        ],
                      ),
                    ),
                  ],
          body: TabBarView(
            children: <Widget>[
              ReportTab(
                titleController: _titleController,
                descriptionController: _descriptionController,
              ),
              DiagnoseTab(
                alert: _diagnosis["alert"],
                statusPublic: _diagnosis["statusPublic"],
                statusGateway: _diagnosis["statusGateway"],
                ssid: _diagnosis["SSID"],
                ip: _diagnosis["IP"],
                ipAll: _diagnosis["ip a"],
                ifconfig: _diagnosis["ifconfig"],
                arp: _diagnosis["arp"],
                tracertGoogle: _diagnosis["traceroute"],
                tracertGoogleDNS: _diagnosis["traceroute Google"],
                pingLo: _diagnosis["pingLo"],
                pingLocal: _diagnosis["pingLocal"],
                pingGateway: _diagnosis["pingGateway"],
                pingDNS1: _diagnosis["pingDNS1"],
                pingDNS2: _diagnosis["pingDNS2"],
                pingDNS3: _diagnosis["pingDNS3"],
                pingDNS4: _diagnosis["pingDNS4"],
                pingDNS5: _diagnosis["pingDNS5"],
                nsLookupEMSE: _diagnosis["nsLookupEMSE"],
                nsLookupEMSEBusybox: _diagnosis["nsLookupEMSEBusybox"],
                nsLookupGoogle: _diagnosis["nsLookupGoogle"],
                nsLookupGoogleBusybox: _diagnosis["nsLookupGoogleBusybox"],
              ),
            ],
          ),
        ),
        drawer: MainDrawer(),
        floatingActionButton: Builder(
          builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  _shareButton,
                  _mailButton,
                  _buildReportButton(context),
                  _diagnosisButton,
                ],
              ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<DateTime> getTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    final timeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(timeout);
  }

  @override
  void initState() {
    super.initState();
    _diagnosis["alert"] = "";
    _diagnosis["statusPublic"] = "";
    _diagnosis["statusGateway"] = "";
    _diagnosis["SSID"] = "";
    _diagnosis["IP"] = "";
    _diagnosis["ip a"] = "";
    _diagnosis["ifconfig"] = "";
    _diagnosis["arp"] = "";
    _diagnosis["traceroute"] = "";
    _diagnosis["traceroute Google"] = "";
    _diagnosis["pingLo"] = "";
    _diagnosis["pingLocal"] = "";
    _diagnosis["pingGateway"] = "";
    _diagnosis["pingDNS1"] = "";
    _diagnosis["pingDNS2"] = "";
    _diagnosis["pingDNS3"] = "";
    _diagnosis["pingDNS4"] = "";
    _diagnosis["pingDNS5"] = "";
    _diagnosis["nsLookupEMSE"] = "";
    _diagnosis["nsLookupEMSEBusybox"] = "";
    _diagnosis["nsLookupGoogle"] = "";
    _diagnosis["nsLookupGoogleBusybox"] = "";
    _animationController = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: const Duration(milliseconds: 500),
    );
  }

  Widget _buildReportButton(BuildContext ctxt,
      {String channel: "projet_flutter_notif"}) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.0, 0.25, curve: Curves.easeOut),
      ),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          if (_reportState != 1) {
            setState(() => _reportState = 1);
            getTimeout().then((timeout) {
              if (DateTime.now().isAfter(timeout))
                report(
                  "_${_descriptionController.text}_\n\n"
                  "*Diagnosis*\n"
                  "$_report",
                  title: _titleController.text,
                  channel: channel,
                ).then((status) {
                  if (status == "ok") {
                    _setTimeout();
                    setState(() => _reportState = 2);
                  } else {
                    setState(() => _reportState = 0);
                  }
                  Scaffold.of(ctxt).showSnackBar(SnackBar(
                    content: Text(status),
                  ));
                });
              else {
                _reportState = 0;
                Scaffold.of(ctxt).showSnackBar(SnackBar(
                  content: Text("Wait until ${timeout.hour}:${timeout.minute}"),
                ));
              }
            });
          }
        },
        child: _reportIcon,
        backgroundColor: _reportState == 2 ? Colors.green : Colors.red,
        foregroundColor: Colors.black,
        mini: true,
      ),
    );
  }

  /// Run a diagnosis suite with a 1 minute time out.
  ///
  /// Run multiples command and store into the [diagnosis] Map.
  /// The suite is composed of :
  /// - SSID, IP scan from [Connectivity]
  /// - ip a
  /// - ifconfig -a
  /// - arp -a
  /// - su -c traceroute google.com and 8.8.8.8
  /// - ping loopback, 10.163.0.5 (DHCP), 10.163.0.2 (Gateway),
  /// 192.168.130.33 (School DNS), 192.168.130.3 (School DNS),
  /// 1.1.1.1 (Cloudflare DNS), 8.8.8.8 (Google DNS), 10.163.0.6 (Private DNS).
  /// - nslookup google.com and fw-cgcp.emse.fr (with and without Busybox).
  /// If the diagnosis takes too much time, the function return any given
  /// informations after one minute.
  Future<String> _diagnose(BuildContext context) async {
    var out = "";
    const argsPing = "-c 4 -w 5 -W 5";
    _diagnosis["alert"] = "";
    _diagnosis["statusPublic"] = "Loading...";
    _diagnosis["statusGateway"] = "Loading...";
    _diagnosis["SSID"] = "Loading...";
    _diagnosis["IP"] = "Loading...";
    _diagnosis["ip a"] = "Loading...";
    _diagnosis["ifconfig"] = "Loading...";
    _diagnosis["arp"] = "Loading...";
    _diagnosis["traceroute"] = "Loading...";
    _diagnosis["traceroute Google"] = "Loading...";
    _diagnosis["pingLo"] = "Loading...";
    _diagnosis["pingLocal"] = "Loading...";
    _diagnosis["pingGateway"] = "Loading...";
    _diagnosis["pingDNS1"] = "Loading...";
    _diagnosis["pingDNS2"] = "Loading...";
    _diagnosis["pingDNS3"] = "Loading...";
    _diagnosis["pingDNS4"] = "Loading...";
    _diagnosis["pingDNS5"] = "Loading...";
    _diagnosis["nsLookupEMSE"] = "Loading...";
    _diagnosis["nsLookupEMSEBusybox"] = "Loading...";
    _diagnosis["nsLookupGoogle"] = "Loading...";
    _diagnosis["nsLookupGoogleBusybox"] = "Loading...";

    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      String ssid;
      PermissionHandler()
          .checkPermissionStatus(PermissionGroup.location)
          .then((answer) {
        if (answer == PermissionStatus.granted)
          Connectivity().getWifiName().then((output) => ssid = output);
        else
          PermissionHandler().requestPermissions([PermissionGroup.location]);
      });
      var ip = await Connectivity().getWifiIP();

      _diagnosis["SSID"] = ssid;
      _diagnosis["IP"] = ip;

      await Future.wait([
        exec("ip", [
          'a',
        ]).runGetOutput().then((out) =>
            _diagnosis["ip a"] = out.isEmpty ? "Nothing to show" : out),
        exec("ifconfig", [
          '-a',
        ]).runGetOutput().then((out) =>
            _diagnosis["ifconfig"] = out.isEmpty ? "Nothing to show" : out),
        exec("arp", [
          '-a',
        ])
            .runGetOutput()
            .then((out) =>
                _diagnosis["arp"] = out.isEmpty ? "Nothing to show" : out)
            .catchError((out) => _diagnosis["arp"] = out.toString()),
        exec("su", [
          '-c',
          'traceroute',
          'google.com',
        ])
            .runGetOutput()
            .then((out) => _diagnosis["traceroute"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError((out) => _diagnosis["traceroute"] = out.toString()),
        exec("su", [
          '-c',
          'traceroute',
          '8.8.8.8',
        ])
            .runGetOutput()
            .then((out) => _diagnosis["traceroute Google"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError(
                (out) => _diagnosis["traceroute Google"] = out.toString()),
        exec("ping", [argsPing, "127.0.0.1"]).runGetOutput().then((out) =>
            _diagnosis["pingLo"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.5"]).runGetOutput().then((out) =>
            _diagnosis["pingLocal"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.2"]).runGetOutput().then((out) =>
            _diagnosis["pingGateway"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "192.168.130.33"]).runGetOutput().then((out) =>
            _diagnosis["pingDNS1"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "192.168.130.3"]).runGetOutput().then((out) =>
            _diagnosis["pingDNS2"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "8.8.8.8"]).runGetOutput().then((out) =>
            _diagnosis["pingDNS3"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "1.1.1.1"]).runGetOutput().then((out) =>
            _diagnosis["pingDNS4"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.6"]).runGetOutput().then((out) =>
            _diagnosis["pingDNS5"] = out.isEmpty ? "Nothing to show" : out),
        exec("nslookup", ["fw-cgcp.emse.fr"])
            .runGetOutput()
            .then((out) => _diagnosis["nsLookupEMSEBusybox"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError(
                (out) => _diagnosis["nsLookupEMSEBusybox"] = out.toString()),
        exec("nslookup", ["google.com"])
            .runGetOutput()
            .then((out) => _diagnosis["nsLookupGoogleBusybox"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError(
                (out) => _diagnosis["nsLookupGoogleBusybox"] = out.toString()),
        getStatus("195.83.139.7").then((status) => _diagnosis["statusPublic"] =
            status.isEmpty ? "Nothing to show" : status),
        getStatus("10.163.0.2").then((status) => _diagnosis["statusGateway"] =
            status.isEmpty ? "Nothing to show" : status),
        InternetAddress.lookup("fw-cgcp.emse.fr")
            .then((addresses) => addresses.forEach((address) =>
                _diagnosis["nsLookupEMSE"] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError((e) => _diagnosis["nsLookupEMSE"] = e.toString()),
        InternetAddress.lookup("google.com")
            .then((addresses) => addresses.forEach((address) =>
                _diagnosis["nsLookupGoogle"] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError((e) => _diagnosis["nsLookupGoogle"] = e.toString()),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        _diagnosis["alert"] = "Diagnosis has timed out !";
      });

      out = "\n*SSID: ${_diagnosis["SSID"]}, Ip: ${_diagnosis["IP"]}*\n\n"
          "*ip a:* \n${_diagnosis["ip a"]}\n\n"
          "*ifconfig:* \n${_diagnosis["ifconfig"]}\n\n"
          "*ARP:* \n${_diagnosis["arp"]}\n\n"
          "*Traceroute Google:* \n${_diagnosis["traceroute"]}\n\n"
          "*Traceroute Google DNS:* \n${_diagnosis["traceroute Google"]}\n\n"
          "*Ping Loopback:* \n${_diagnosis["pingLo"]}\n\n"
          "*Ping Local:* \n${_diagnosis["pingLocal"]}\n\n"
          "*HTTP Portal Response Public:* \n${_diagnosis["statusPublic"]}\n\n"
          "*HTTP Portal Response Gateway:* \n${_diagnosis["statusGateway"]}\n\n"
          "*Ping Gateway:* \n${_diagnosis["pingGateway"]}\n\n"
          "*Ping DNS1:* \n${_diagnosis["pingDNS1"]}\n\n"
          "*Ping DNS2:* \n${_diagnosis["pingDNS2"]}\n\n"
          "*Ping DNS3:* \n${_diagnosis["pingDNS3"]}\n\n"
          "*Ping DNS4:* \n${_diagnosis["pingDNS4"]}\n\n"
          "*Ping DNS5:* \n${_diagnosis["pingDNS5"]}\n\n"
          "*NSLookup EMSE:* \n${_diagnosis["nsLookupEMSE"]}\n\n"
          "*NSLookup Google:* \n${_diagnosis["nsLookupGoogle"]}\n\n"
          "*NSLookup EMSE (Busybox):* \n${_diagnosis["nsLookupEMSEBusybox"]}\n\n"
          "*NSLookup Google (Busybox):* \n${_diagnosis["nsLookupGoogleBusybox"]}\n\n";
    } else
      _diagnosis["alert"] = AppLoc.of(context).sentenceNotConnected;

    return out;
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _setTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }
}
