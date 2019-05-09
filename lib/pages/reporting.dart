import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:dscript_exec/dscript_exec.dart';
import 'package:flutter/material.dart';
import 'package:minitel_toolbox/components/drawer.dart';
import 'package:minitel_toolbox/funcs/http_portail.dart';
import 'package:minitel_toolbox/funcs/http_webhook.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'reporting_tabs/diagnose_tab.dart';
import 'reporting_tabs/report_tab.dart';

/// This stores all diagnosis results.
///
/// To obtain the report, simply use:
/// ```
/// Diagnosis diagnosis;
/// diagnosis.report["name"];
/// ```
///
/// By default, everything is [null].
/// All data can be initialized to "" using `diagnosis.onInit()`.
///
/// To generates all the data : `diagnosis.diagnose()`
///
/// The data is generated asynchronously. The process times out after one minute.
///
/// This is all the data that you can get:
///
/// - "alert",
/// - "statusPublic",
/// - "statusGateway",
/// - "SSID",
/// - "IP",
/// - "ip a",
/// - "ifconfig",
/// - "arp",
/// - "traceroute",
/// - "traceroute Google",
/// - "pingLo",
/// - "pingLocal",
/// - "pingGateway",
/// - "pingDNS1",
/// - "pingDNS2",
/// - "pingDNS3",
/// - "pingDNS4",
/// - "pingDNS5",
/// - "nsLookupEMSE",
/// - "nsLookupEMSEBusybox",
/// - "nsLookupGoogle",
/// - "nsLookupGoogleBusybox"
class Diagnosis {
  Map<String, String> _report = {
    "alert": "",
    "statusPublic": "",
    "statusGateway": "",
    "SSID": "",
    "IP": "",
    "ip a": "",
    "ifconfig": "",
    "arp": "",
    "traceroute": "",
    "traceroute Google": "",
    "pingLo": "",
    "pingLocal": "",
    "pingGateway": "",
    "pingDNS1": "",
    "pingDNS2": "",
    "pingDNS3": "",
    "pingDNS4": "",
    "pingDNS5": "",
    "nsLookupEMSE": "",
    "nsLookupEMSEBusybox": "",
    "nsLookupGoogle": "",
    "nsLookupGoogleBusybox": "",
  };

  Map<String, String> get report => _report;

  /// Run a report suite with a 1 minute time out.
  ///
  /// Run multiples command and store into the [report] Map.
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
  /// If the report takes too much time, the function return any given
  /// informations after one minute.
  Future<String> diagnose(BuildContext context) async {
    var out = "";
    const argsPing = "-c 4 -w 5 -W 5";
    _report["alert"] = "";
    _report["statusPublic"] = "Loading...";
    _report["statusGateway"] = "Loading...";
    _report["SSID"] = "Loading...";
    _report["IP"] = "Loading...";
    _report["ip a"] = "Loading...";
    _report["ifconfig"] = "Loading...";
    _report["arp"] = "Loading...";
    _report["traceroute"] = "Loading...";
    _report["traceroute Google"] = "Loading...";
    _report["pingLo"] = "Loading...";
    _report["pingLocal"] = "Loading...";
    _report["pingGateway"] = "Loading...";
    _report["pingDNS1"] = "Loading...";
    _report["pingDNS2"] = "Loading...";
    _report["pingDNS3"] = "Loading...";
    _report["pingDNS4"] = "Loading...";
    _report["pingDNS5"] = "Loading...";
    _report["nsLookupEMSE"] = "Loading...";
    _report["nsLookupEMSEBusybox"] = "Loading...";
    _report["nsLookupGoogle"] = "Loading...";
    _report["nsLookupGoogleBusybox"] = "Loading...";

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

      _report["SSID"] = ssid;
      _report["IP"] = ip;

      await Future.wait([
        exec("ip", [
          'a',
        ]).runGetOutput().then(
            (out) => _report["ip a"] = out.isEmpty ? "Nothing to show" : out),
        exec("ifconfig", [
          '-a',
        ]).runGetOutput().then((out) =>
            _report["ifconfig"] = out.isEmpty ? "Nothing to show" : out),
        exec("arp", [
          '-a',
        ])
            .runGetOutput()
            .then(
                (out) => _report["arp"] = out.isEmpty ? "Nothing to show" : out)
            .catchError((out) => _report["arp"] = out.toString()),
        exec("su", [
          '-c',
          'traceroute',
          'google.com',
        ])
            .runGetOutput()
            .then((out) =>
                _report["traceroute"] = out.isEmpty ? "Nothing to show" : out)
            .catchError((out) => _report["traceroute"] = out.toString()),
        exec("su", [
          '-c',
          'traceroute',
          '8.8.8.8',
        ])
            .runGetOutput()
            .then((out) => _report["traceroute Google"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError((out) => _report["traceroute Google"] = out.toString()),
        exec("ping", [argsPing, "127.0.0.1"]).runGetOutput().then(
            (out) => _report["pingLo"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.5"]).runGetOutput().then((out) =>
            _report["pingLocal"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.2"]).runGetOutput().then((out) =>
            _report["pingGateway"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "192.168.130.33"]).runGetOutput().then((out) =>
            _report["pingDNS1"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "192.168.130.3"]).runGetOutput().then((out) =>
            _report["pingDNS2"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "8.8.8.8"]).runGetOutput().then((out) =>
            _report["pingDNS3"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "1.1.1.1"]).runGetOutput().then((out) =>
            _report["pingDNS4"] = out.isEmpty ? "Nothing to show" : out),
        exec("ping", [argsPing, "10.163.0.6"]).runGetOutput().then((out) =>
            _report["pingDNS5"] = out.isEmpty ? "Nothing to show" : out),
        exec("nslookup", ["fw-cgcp.emse.fr"])
            .runGetOutput()
            .then((out) => _report["nsLookupEMSEBusybox"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError(
                (out) => _report["nsLookupEMSEBusybox"] = out.toString()),
        exec("nslookup", ["google.com"])
            .runGetOutput()
            .then((out) => _report["nsLookupGoogleBusybox"] =
                out.isEmpty ? "Nothing to show" : out)
            .catchError(
                (out) => _report["nsLookupGoogleBusybox"] = out.toString()),
        getStatus("195.83.139.7").then((status) => _report["statusPublic"] =
            status.isEmpty ? "Nothing to show" : status),
        getStatus("10.163.0.2").then((status) => _report["statusGateway"] =
            status.isEmpty ? "Nothing to show" : status),
        InternetAddress.lookup("fw-cgcp.emse.fr")
            .then((addresses) => addresses.forEach((address) =>
                _report["nsLookupEMSE"] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError((e) => _report["nsLookupEMSE"] = e.toString()),
        InternetAddress.lookup("google.com")
            .then((addresses) => addresses.forEach((address) =>
                _report["nsLookupGoogle"] =
                    "Host: ${address.host}\nLookup: ${address.address}"))
            .catchError((e) => _report["nsLookupGoogle"] = e.toString()),
      ]).timeout(const Duration(minutes: 1), onTimeout: () {
        _report["alert"] = "Diagnosis has timed out !";
      });

      out = "\n*SSID: ${_report["SSID"]}, Ip: ${_report["IP"]}*\n\n"
          "*ip a:* \n${_report["ip a"]}\n\n"
          "*ifconfig:* \n${_report["ifconfig"]}\n\n"
          "*ARP:* \n${_report["arp"]}\n\n"
          "*Traceroute Google:* \n${_report["traceroute"]}\n\n"
          "*Traceroute Google DNS:* \n${_report["traceroute Google"]}\n\n"
          "*Ping Loopback:* \n${_report["pingLo"]}\n\n"
          "*Ping Local:* \n${_report["pingLocal"]}\n\n"
          "*HTTP Portal Response Public:* \n${_report["statusPublic"]}\n\n"
          "*HTTP Portal Response Gateway:* \n${_report["statusGateway"]}\n\n"
          "*Ping Gateway:* \n${_report["pingGateway"]}\n\n"
          "*Ping DNS1:* \n${_report["pingDNS1"]}\n\n"
          "*Ping DNS2:* \n${_report["pingDNS2"]}\n\n"
          "*Ping DNS3:* \n${_report["pingDNS3"]}\n\n"
          "*Ping DNS4:* \n${_report["pingDNS4"]}\n\n"
          "*Ping DNS5:* \n${_report["pingDNS5"]}\n\n"
          "*NSLookup EMSE:* \n${_report["nsLookupEMSE"]}\n\n"
          "*NSLookup Google:* \n${_report["nsLookupGoogle"]}\n\n"
          "*NSLookup EMSE (Busybox):* \n${_report["nsLookupEMSEBusybox"]}\n\n"
          "*NSLookup Google (Busybox):* \n${_report["nsLookupGoogleBusybox"]}\n\n";
    } else
      _report["alert"] = "Pas de Wifi";

    return out;
  }
}

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

  var _diagnosis = Diagnosis();

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

  Widget get _diagnosisButton => FloatingActionButton(
        backgroundColor: _diagnosisState == 2 ? Colors.green : Colors.blue,
        onPressed: () async {
          if (!_animationController.isDismissed) _animationController.reverse();
          if (_diagnosisState != 1) {
            setState(() => _diagnosisState = 1);
            _percentageDiagnoseProgress = 0.0;
            Timer.periodic(
                const Duration(seconds: 1),
                (Timer t) =>
                    setState(() => _percentageDiagnoseProgress += 1 / 60));
            _diagnosis.diagnose(context).then((diagnosis) {
              _report = diagnosis;
              setState(() => _diagnosisState = 2);
            });
          }
        },
        child: _diagnosisIcon,
      );

  Widget get _diagnosisIcon {
    switch (_diagnosisState) {
      case 0:
        return const Icon(Icons.zoom_in);
        break;
      case 1:
        return CircularProgressIndicator(
          value: _percentageDiagnoseProgress,
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
        );
        break;
      case 2:
        if (_animationController.isDismissed) _animationController.forward();
        return const Icon(Icons.done);
        break;
      default:
        return const Text("");
    }
  }

  Widget get _mailButton => ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              elevation: 4,
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.red,
              child: const Icon(Icons.mail),
              mini: true,
              onPressed: () async {
                var body = "---Report ${DateTime.now().toString()}---\n\n"
                    "Titre: ${_titleController.text}\n"
                    "Description: ${_descriptionController.text}\n\n"
                    "*Diagnosis*\n"
                    "$_report";
                _launchURL(
                    "mailto:minitel13120@gmail.com?subject=${_titleController.text}&body=$body");
              },
            ),
          ],
        ),
      );

  Widget get _reportIcon {
    switch (_reportState) {
      case 0:
        return Image.asset("assets/img/Slack_Mark_Monochrome_White.png");
        break;
      case 1:
        return const CircularProgressIndicator(
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white));
        break;
      case 2:
        return const Icon(
          Icons.done,
          color: Colors.white,
        );
        break;
      default:
        return const Text("");
    }
  }

  Widget get _shareButton => ScaleTransition(
        scale: CurvedAnimation(
          parent: _animationController,
          curve: const Interval(0.0, 1.0, curve: Curves.easeOut),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Partager",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              elevation: 4,
            ),
            FloatingActionButton(
              heroTag: null,
              backgroundColor: Colors.red,
              child: const Icon(Icons.share),
              mini: true,
              onPressed: () =>
                  Share.share("---Report ${DateTime.now().toString()}---\n\n"
                      "Titre: ${_titleController.text}\n"
                      "Description: ${_descriptionController.text}\n\n"
                      "*Diagnosis*\n"
                      "$_report"),
            ),
          ],
        ),
      );

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
                      floating: true,
                      forceElevated: true,
                      bottom: const TabBar(
                        indicatorColor: Colors.white,
                        tabs: <Tab>[
                          const Tab(
                            icon: const Icon(Icons.warning),
                            text: "Report",
                          ),
                          const Tab(
                            icon: const Icon(Icons.zoom_in),
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
                alert: _diagnosis.report["alert"],
                statusPublic: _diagnosis.report["statusPublic"],
                statusGateway: _diagnosis.report["statusGateway"],
                ssid: _diagnosis.report["SSID"],
                ip: _diagnosis.report["IP"],
                ipAll: _diagnosis.report["ip a"],
                ifconfig: _diagnosis.report["ifconfig"],
                arp: _diagnosis.report["arp"],
                tracertGoogle: _diagnosis.report["traceroute"],
                tracertGoogleDNS: _diagnosis.report["traceroute Google"],
                pingLo: _diagnosis.report["pingLo"],
                pingLocal: _diagnosis.report["pingLocal"],
                pingGateway: _diagnosis.report["pingGateway"],
                pingDNS1: _diagnosis.report["pingDNS1"],
                pingDNS2: _diagnosis.report["pingDNS2"],
                pingDNS3: _diagnosis.report["pingDNS3"],
                pingDNS4: _diagnosis.report["pingDNS4"],
                pingDNS5: _diagnosis.report["pingDNS5"],
                nsLookupEMSE: _diagnosis.report["nsLookupEMSE"],
                nsLookupEMSEBusybox: _diagnosis.report["nsLookupEMSEBusybox"],
                nsLookupGoogle: _diagnosis.report["nsLookupGoogle"],
                nsLookupGoogleBusybox:
                    _diagnosis.report["nsLookupGoogleBusybox"],
              ),
            ],
          ),
        ),
        drawer: const MainDrawer(),
        floatingActionButton: Builder(
          builder: (context) => Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Notifier sur Slack",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            elevation: 4,
          ),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              if (_reportState != 1) {
                setState(() => _reportState = 1);
                getTimeout().then(
                  (timeout) {
                    if (DateTime.now().isAfter(timeout))
                      report(
                        "_${_descriptionController.text}_\n\n"
                        "*Diagnosis*\n"
                        "$_report",
                        title: _titleController.text,
                        channel: channel,
                      ).then(
                        (status) {
                          if (status == "ok") {
                            _setTimeout();
                            setState(() => _reportState = 2);
                          } else {
                            setState(() => _reportState = 0);
                          }
                          Scaffold.of(ctxt).showSnackBar(
                            SnackBar(
                              content: Text(status),
                            ),
                          );
                        },
                      );
                    else {
                      _reportState = 0;
                      Scaffold.of(ctxt).showSnackBar(
                        SnackBar(
                          content: Text(
                              "Wait until ${timeout.hour}:${timeout.minute}"),
                        ),
                      );
                    }
                  },
                );
              }
            },
            child: _reportIcon,
            backgroundColor: _reportState == 2 ? Colors.green : Colors.red,
            foregroundColor: Colors.black,
            mini: true,
          ),
        ],
      ),
    );
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
