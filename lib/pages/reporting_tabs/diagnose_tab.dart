import 'package:flutter/material.dart';
import 'package:minitel_toolbox/components/cards.dart';

class DiagnoseTab extends StatelessWidget {
  final String _alert;
  final String _statusPublic;
  final String _statusGateway;
  final String _ssid;
  final String _ip;
  final String _ipAll;
  final String _ifconfig;
  final String _arp;
  final String _tracertGoogle;
  final String _tracertGoogleDNS;
  final String _pingLo;
  final String _pingLocal;
  final String _pingGateway;
  final String _pingDNS1;
  final String _pingDNS2;
  final String _pingDNS3;
  final String _pingDNS4;
  final String _pingDNS5;
  final String _nsLookupEMSE;
  final String _nsLookupGoogle;
  final String _nsLookupEMSEBusybox;
  final String _nsLookupGoogleBusybox;

  const DiagnoseTab({
    Key key,
    @required String alert,
    @required String statusPublic,
    @required String statusGateway,
    @required String ssid,
    @required String ip,
    @required String ipAll,
    @required String ifconfig,
    @required String arp,
    @required String tracertGoogle,
    @required String tracertGoogleDNS,
    @required String pingLo,
    @required String pingLocal,
    @required String pingGateway,
    @required String pingDNS1,
    @required String pingDNS2,
    @required String pingDNS3,
    @required String pingDNS4,
    @required String pingDNS5,
    @required String nsLookupEMSE,
    @required String nsLookupGoogle,
    @required String nsLookupEMSEBusybox,
    @required String nsLookupGoogleBusybox,
  })  : _alert = alert,
        _statusPublic = statusPublic,
        _statusGateway = statusGateway,
        _ssid = ssid,
        _ip = ip,
        _ipAll = ipAll,
        _ifconfig = ifconfig,
        _arp = arp,
        _tracertGoogle = tracertGoogle,
        _tracertGoogleDNS = tracertGoogleDNS,
        _pingLo = pingLo,
        _pingLocal = pingLocal,
        _pingGateway = pingGateway,
        _pingDNS1 = pingDNS1,
        _pingDNS2 = pingDNS2,
        _pingDNS3 = pingDNS3,
        _pingDNS4 = pingDNS4,
        _pingDNS5 = pingDNS5,
        _nsLookupEMSE = nsLookupEMSE,
        _nsLookupGoogle = nsLookupGoogle,
        _nsLookupEMSEBusybox = nsLookupEMSEBusybox,
        _nsLookupGoogleBusybox = nsLookupGoogleBusybox,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                _alert,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 15,
                ),
              ),
              Material(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0)),
                color: Colors.deepOrange,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "SSID: $_ssid, IP: $_ip",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
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
                _statusGateway,
                title: "HTTP Portal Response (10.163.0.2)",
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
    );
  }

  // _diagnose() async {
  //   setState(() {
  //     _alert = "";
  //     _statusPublic = _statusGateway = _ssid = _ip = _ipAll = _ifconfig = _arp =
  //         _tracertGoogle = _tracertGoogleDNS = _pingLo = _pingLocal =
  //             _pingGateway = _pingDNS1 = _pingDNS2 = _pingDNS3 = _pingDNS4 =
  //                 _pingDNS5 = _nsLookupEMSE = _nsLookupGoogle =
  //                     _nsLookupEMSEBusybox = _nsLookupGoogleBusybox =
  //                         _nsLookupGoogleBusybox = "Loading...";
  //   });
  //   const argsPing = "-c 4 -w 5 -W 5";

  //   var connectivityResult = await Connectivity().checkConnectivity();
  //   if (connectivityResult == ConnectivityResult.mobile ||
  //       connectivityResult == ConnectivityResult.wifi) {
  //     String ssid;
  //     PermissionHandler()
  //         .checkPermissionStatus(PermissionGroup.location)
  //         .then((answer) {
  //       if (answer == PermissionStatus.granted)
  //         Connectivity().getWifiName().then((out) => ssid = out);
  //       else
  //         PermissionHandler().requestPermissions([PermissionGroup.location]);
  //     });
  //     var ip = await Connectivity().getWifiIP();

  //     setState(() {
  //       _ssid = ssid;
  //       _ip = ip;
  //     });

  //     exec("ip", [
  //       'a',
  //     ]).runGetOutput().then((out) =>
  //         setState(() => _ipAll = out.isEmpty ? "Nothing to show" : out));
  //     exec("ifconfig", [
  //       '-a',
  //     ]).runGetOutput().then((out) =>
  //         setState(() => _ifconfig = out.isEmpty ? "Nothing to show" : out));
  //     exec("arp", [
  //       '-a',
  //     ])
  //         .runGetOutput()
  //         .then((out) =>
  //             setState(() => _arp = out.isEmpty ? "Nothing to show" : out))
  //         .catchError((e) => _arp = e.toString());
  //     exec("su", [
  //       '-c',
  //       'traceroute',
  //       'google.com',
  //     ])
  //         .runGetOutput()
  //         .then((out) => setState(
  //             () => _tracertGoogle = out.isEmpty ? "Nothing to show" : out))
  //         .catchError((e) => _tracertGoogle = e.toString());
  //     exec("su", [
  //       '-c',
  //       'traceroute',
  //       '8.8.8.8',
  //     ])
  //         .runGetOutput()
  //         .then((out) => setState(
  //             () => _tracertGoogleDNS = out.isEmpty ? "Nothing to show" : out))
  //         .catchError((e) => _tracertGoogleDNS = e.toString());
  //     exec("ping", [argsPing, "127.0.0.1"]).runGetOutput().then((out) =>
  //         setState(() => _pingLo = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "10.163.0.5"]).runGetOutput().then((out) =>
  //         setState(() => _pingLocal = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "10.163.0.2"]).runGetOutput().then((out) =>
  //         setState(() => _pingGateway = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "192.168.130.33"]).runGetOutput().then((out) =>
  //         setState(() => _pingDNS1 = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "192.168.130.3"]).runGetOutput().then((out) =>
  //         setState(() => _pingDNS2 = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "8.8.8.8"]).runGetOutput().then((out) =>
  //         setState(() => _pingDNS3 = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "1.1.1.1"]).runGetOutput().then((out) =>
  //         setState(() => _pingDNS4 = out.isEmpty ? "Nothing to show" : out));
  //     exec("ping", [argsPing, "10.163.0.6"]).runGetOutput().then((out) =>
  //         setState(() => _pingDNS5 = out.isEmpty ? "Nothing to show" : out));
  //     exec("nslookup", ["fw-cgcp.emse.fr"])
  //         .runGetOutput()
  //         .then((out) => setState(() =>
  //             _nsLookupEMSEBusybox = out.isEmpty ? "Nothing to show" : out))
  //         .catchError((e) => _nsLookupEMSEBusybox = e.toString());
  //     exec("nslookup", ["google.com"])
  //         .runGetOutput()
  //         .then((out) => setState(() =>
  //             _nsLookupGoogleBusybox = out.isEmpty ? "Nothing to show" : out))
  //         .catchError((e) => _nsLookupGoogleBusybox = e.toString());

  //     getStatus("195.83.139.7").then((status) => setState(
  //         () => _statusPublic = status.isEmpty ? "Nothing to show" : status));
  //     getStatus("10.163.0.2").then((status) => setState(
  //         () => _statusGateway = status.isEmpty ? "Nothing to show" : status));

  //     InternetAddress.lookup("fw-cgcp.emse.fr")
  //         .then((addresses) => addresses.forEach((address) => setState(() =>
  //             _nsLookupEMSE =
  //                 "Host: ${address.host}\nLookup: ${address.address}")))
  //         .catchError((e) => setState(() => _nsLookupEMSE = e.toString()));

  //     InternetAddress.lookup("google.com")
  //         .then((addresses) => addresses.forEach((address) => setState(() =>
  //             _nsLookupGoogle =
  //                 "Host: ${address.host}\nLookup: ${address.address}")))
  //         .catchError((e) => setState(() => _nsLookupGoogle = e.toString()));
  //   } else
  //     setState(() => _alert = AppLoc.of(context).sentenceNotConnected);
  // }
}
