import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/components/drawer.dart';
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
            SuperCard(
              children: <Widget>[
                Header("Gateway Login"),
                Header("Domain name / IP", level: 2),
                Paragraph(
                  "Choose between fw-cgcp.emse.fr and 172.17.0.1\n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Paragraph(
                    "If your local network is WiFi MINITEL, use 172.17.0.1.\n"
                        "Otherwise, you can try fw-cgcp.emse.fr."),
              ],
            ),
            SuperCard(children: <Widget>[
              Header("Diagnosis"),
              Header("Permission Coarse Location", level: 2),
              Paragraph(
                "    Indicates whether you have authorized the localization of your SSID.",
              ),
              Header("Ping Loopback", level: 2),
              Paragraph(
                  "    Verify if the TCP/IP software works. Should be always positive."),
              Header("Ping Local", level: 2),
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      text:
                      "    Ping to a local computer (172.17.0.5, which is the Minitel Server and should be always on).\n\n"
                          "If the packets are lost, these are the most possible scenarios:\n",
                      children: <TextSpan>[
                        TextSpan(text: "    1.  You have no IP."),
                        TextSpan(
                            text: " (Report this immediatly to Minitel)\n",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                            "    2.  You are not connected to the local Network.\n"
                                "    3.  The server (172.17.0.5) has been shutdown. (you can ping 172.17.0.1, 172.17.0.10)\n"),
                      ])),
              Header("HTTP Gateway Response", level: 2),
              Paragraph(
                  "HTTP GET https://172.17.0.1/auth/\nIt should display the same result as \"Gateway Login Status\".\n\n"
                      "    OS Error are mostly caused if the phone cannot connect to the gateway 172.17.0.1."),
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
                "    If a 4xx error occurs, please report it to the developers.",
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
              Header("How should i react?", level: 3),
              Paragraph(
                  "    If you have an OS error, the Gateway has a problem and you should report it to the DSI."),
              Paragraph(
                  "    If you have a 4xx HTTP error, the diagnostic tool has a problem and you should report it to the developpers."),
              Paragraph(
                  "    If you have a 5xx HTTP error, the Gateway has a problem  and you should report it to the DSI."),
              Paragraph(
                "    A share button exists to send 90% of the needed informations for a full repair.\n"
                    "    172.17.0.10 is equipped with an admin report.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Header("Ping Gateway", level: 2),
              Paragraph(
                  "    This information does nothing. The gateway ignores pings. However, if a ping is received, someone is probably taking his IP. But none of this is certain."),
              Header("Ping DNS", level: 2),
              Paragraph(
                "    DNS 1: 192.168.130.33\n"
                    "    DNS 2: 192.168.130.3\n"
                    "    DNS 3: 8.8.8.8\n"
                    "    DNS 4: 1.1.1.1\n"
                    "    DNS 5: 172.17.0.6\n",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Paragraph(
                  "    If one of the DNS (besides 172.17.0.6) responds, you are connected to the internet."),

              Header("NSLookup", level: 2),
              Paragraph(
                  "    If there is no answer in one of them, but the DNS ping worked, your computer probably has a DNS cache problem."),
              Paragraph(
                "    These are the best fixes:",
                style: TextStyle(fontWeight: FontWeight.bold),),
              LogCard(
                  "ipconfig /flushdns", title: "cmd.exe (Admin)    (Windows)"),
              LogCard("sudo systemd-resolve --flush-caches",
                  title: "bash    (Ubuntu and Debian-based)"),
              LogCard(
                  "sudo systemctl restart nscd", title: "bash    (Arch Linux)"),
              LogCard("sudo systemctl restart dnsmasq",
                  title: "bash    (Linux in general)"),
              LogCard("sudo systemctl restart named",
                  title: "bash    (Linux Traditional)"),
              LogCard("sudo killall -HUP mDNSResponder",
                  title: "Terminal    (OSX Yosemite and later, Mavericks, Mountain Lion and Lion)"),
              LogCard("sudo discoveryutil mdnsflushcache",
                  title: "Terminal    (OSX Yosemite v10.10 through v10.10.3)"),
              LogCard("sudo dscacheutil -flushcache",
                  title: "Terminal    (OSX Snow Leopard)"),
              Paragraph(
                "    For portable devices, restart the Wifi.",
                style: TextStyle(fontWeight: FontWeight.bold),),
            ]),
          ],
        ),
      ),
      drawer: MainDrawer(),
    );
  }
}
