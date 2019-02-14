import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';

class DocumentationPage extends StatefulWidget {
  final String title;

  DocumentationPage({Key key, this.title}) : super(key: key);

  @override
  _DocumentationPageState createState() => _DocumentationPageState();
}

class _DocumentationPageState extends State<DocumentationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Scrollbar(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            DocCard(
              children: <Widget>[
                Header(AppLoc.of(context).titleLoginPage),
                Header("${AppLoc.of(context).wordDomain} / IP", level: 2),
                Paragraph(
                  AppLoc.of(context).sentenceDocLogin1,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Paragraph(AppLoc.of(context).sentenceDocLogin2),
              ],
            ),
            DocCard(children: <Widget>[
              Header(AppLoc.of(context).titleDiagnosePage),
              // TODO: Add NSLookup (Busybox), ARP, traceroute, netstat, ifconfig, ip a
              Header("Permission Coarse Location", level: 2),
              Paragraph(
                AppLoc.of(context).sentenceDocDiagnosePerm,
              ),
              Header("Ping Loopback", level: 2),
              Paragraph(AppLoc.of(context).sentenceDocDiagnosePingLo),
              Header("Ping Local", level: 2),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text: AppLoc.of(context).sentenceDocDiagnosePingLocal1,
                      children: <TextSpan>[
                    TextSpan(
                        text: AppLoc.of(context).sentenceDocDiagnosePingLocal2),
                    TextSpan(
                        text: AppLoc.of(context).sentenceDocDiagnosePingLocal3,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: AppLoc.of(context).sentenceDocDiagnosePingLocal4),
                  ])),
              Header("HTTP Gateway Response", level: 2),
              Paragraph(AppLoc.of(context).sentenceDocDiagnoseHTTP1),
              Header("HTTP Codes", level: 3),
              Header("1xx Informational response", level: 4),
              Header("2xx Success", level: 4),
              Header("3xx Redirection", level: 4),
              Text(
                "    301 Moved Permanently",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Header("4xx Client errors", level: 4),
              Text(
                AppLoc.of(context).sentenceDocDiagnoseHTTP2,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              Text(
                "    400 Bad Request",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "    401 Unauthorized",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "    403 Forbidden",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Header("5xx Server errors", level: 4),
              Text(
                "    500 Internal Server Error",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "    502 Bad Gateway",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "    503 Service Unavailable",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                "    504 Gateway Timeout",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Header(AppLoc.of(context).titleHowShouldIReact, level: 3),
              Paragraph(AppLoc.of(context).sentenceDocDiagnoseHTTP3),
              Paragraph(AppLoc.of(context).sentenceDocDiagnoseHTTP4),
              Paragraph(AppLoc.of(context).sentenceDocDiagnoseHTTP5),
              Paragraph(
                AppLoc.of(context).sentenceDocDiagnoseHTTP6,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Header("Ping Gateway", level: 2),
              Paragraph(AppLoc.of(context).sentenceDocDiagnosePingGateway),
              Header("Ping DNS", level: 2),
              Paragraph(
                "    DNS 1: 192.168.130.33\n"
                    "    DNS 2: 192.168.130.3\n"
                    "    DNS 3: 8.8.8.8\n"
                    "    DNS 4: 1.1.1.1\n"
                    "    DNS 5: 172.17.0.6\n",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Paragraph(AppLoc.of(context).sentenceDocDiagnosePingDNS),
              Header("NSLookup", level: 2),
              Paragraph(AppLoc.of(context).sentenceDocDiagnoseNSLookup1),
              Paragraph(
                AppLoc.of(context).sentenceDocDiagnoseNSLookup2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              LogCard("ipconfig /flushdns",
                  title: "cmd.exe (Admin)    (Windows)"),
              LogCard("sudo systemd-resolve --flush-caches",
                  title: "bash    (Ubuntu and Debian-based)"),
              LogCard("sudo systemctl restart nscd",
                  title: "bash    (Arch Linux)"),
              LogCard("sudo systemctl restart dnsmasq",
                  title: "bash    (Linux in general)"),
              LogCard("sudo systemctl restart named",
                  title: "bash    (Linux Traditional)"),
              LogCard("sudo killall -HUP mDNSResponder",
                  title:
                      "Terminal    (OSX Yosemite and later, Mavericks, Mountain Lion and Lion)"),
              LogCard("sudo discoveryutil mdnsflushcache",
                  title: "Terminal    (OSX Yosemite v10.10 through v10.10.3)"),
              LogCard("sudo dscacheutil -flushcache",
                  title: "Terminal    (OSX Snow Leopard)"),
              Paragraph(
                AppLoc.of(context).sentenceDocDiagnoseNSLookup3,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
