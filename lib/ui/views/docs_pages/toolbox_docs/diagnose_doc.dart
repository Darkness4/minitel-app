import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class DiagnoseDoc extends StatelessWidget {
  const DiagnoseDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BoxMdH(AppLoc.of(context).docs.diagnose.header, 1),
              const BoxMdH("ip a", 2),
              Text(
                AppLoc.of(context).docs.diagnose.ipaContent,
                style: Theme.of(context).textTheme.body1,
              ),
              const BoxMdH("Address Resolution Protocol", 2),
              Text.rich(
                TextSpan(
                  text: AppLoc.of(context).docs.diagnose.arpContent1,
                  style: Theme.of(context).textTheme.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.diagnose.arpContent2,
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: AppLoc.of(context).docs.diagnose.arpContent3,
                      style: MinitelTextStyles.mdH5,
                    ),
                  ],
                ),
              ),
              const LogCard("arp -s 10.163.0.2 00-0d-b4-10-99-e1",
                  title: "cmd.exe (Admin)    (Windows)"),
              const LogCard("arp -s 10.163.0.2 00:0d:b4:10:99:e1",
                  title: "Shell    (Linux)"),
              const BoxMdH("Traceroute", 2),
              Text(
                AppLoc.of(context).docs.diagnose.tracerouteContent,
                style: Theme.of(context).textTheme.body1,
              ),
              const BoxMdH("Ping Loopback", 2),
              Text.rich(TextSpan(
                text: AppLoc.of(context).docs.diagnose.pingLoContent1,
                style: Theme.of(context).textTheme.body1,
                children: <TextSpan>[
                  TextSpan(
                    text: AppLoc.of(context).docs.diagnose.pingLoContent2,
                    style: MinitelTextStyles.mdH5,
                  ),
                ],
              )),
              const BoxMdH("Ping Local", 2),
              Text.rich(
                TextSpan(
                  text: AppLoc.of(context).docs.diagnose.pingLocalContent1,
                  style: Theme.of(context).textTheme.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.diagnose.pingLocalContent2,
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: AppLoc.of(context).docs.diagnose.pingLocalContent3,
                      style: Theme.of(context).textTheme.body1,
                    )
                  ],
                ),
              ),
              const BoxMdH("HTTP Gateway Response", 2),
              Text(
                AppLoc.of(context).docs.diagnose.httpContent,
                style: MinitelTextStyles.mdH5.apply(color: Colors.red),
              ),
              const BoxMdH("HTTP Codes", 3),
              const Text.rich(
                TextSpan(
                  text: "1xx Informational response\n",
                  style: MinitelTextStyles.mdH4,
                  children: <TextSpan>[
                    TextSpan(
                      text: "2xx Success\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "3xx Redirection\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "    301 Moved Permanently\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "4xx Client errors\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "    400 Bad Request\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    401 Unauthorized\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    403 Forbidden\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "5xx Server errors\n",
                      style: MinitelTextStyles.mdH4,
                    ),
                    TextSpan(
                      text: "    500 Internal Server Error\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    502 Bad Gateway\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    503 Service Unavailable\n",
                      style: MinitelTextStyles.mdH5,
                    ),
                    TextSpan(
                      text: "    504 Gateway Timeout",
                      style: MinitelTextStyles.mdH5,
                    ),
                  ],
                ),
              ),
              BoxMdH(AppLoc.of(context).docs.diagnose.reactionHeader, 2),
              Text(
                AppLoc.of(context).docs.diagnose.reactionContent,
                style: MinitelTextStyles.mdH5,
              ),
              const BoxMdH("Ping Gateway", 2),
              Text(
                AppLoc.of(context).docs.diagnose.pingGatewayContent,
                style: Theme.of(context).textTheme.body1,
              ),
              const BoxMdH("Ping DNS", 2),
              const Text.rich(
                TextSpan(
                  text: "DNS 1: 192.168.130.33\n"
                      "DNS 2: 192.168.130.3\n"
                      "DNS 3: 8.8.8.8\n"
                      "DNS 4: 1.1.1.1\n"
                      "DNS 5: 10.163.0.6",
                  style: MinitelTextStyles.mdH5,
                ),
              ),
              Text(
                AppLoc.of(context).docs.diagnose.pingDNSContent,
                style: Theme.of(context).textTheme.body1,
              ),
              const BoxMdH("NSLookup", 2),
              Text.rich(
                TextSpan(
                  text: AppLoc.of(context).docs.diagnose.nsLookupContent1,
                  style: Theme.of(context).textTheme.body1,
                  children: <TextSpan>[
                    TextSpan(
                      text: AppLoc.of(context).docs.diagnose.nsLookupContent2,
                      style: MinitelTextStyles.mdH5,
                    ),
                  ],
                ),
              ),
              const LogCard("ipconfig /flushdns",
                  title: "cmd.exe (Admin)    (Windows)"),
              const LogCard("sudo systemd-resolve --flush-caches",
                  title: "Shell    (Ubuntu and Debian-based)"),
              const LogCard("sudo systemctl restart nscd",
                  title: "Shell    (Arch Linux)"),
              const LogCard("sudo systemctl restart dnsmasq",
                  title: "Shell    (Linux in general)"),
              const LogCard("sudo systemctl restart named",
                  title: "Shell    (Linux Traditional)"),
              const LogCard("sudo killall -HUP mDNSResponder",
                  title:
                      "Terminal    (OSX Yosemite and later, Mavericks, Mountain Lion and Lion)"),
              const LogCard("sudo discoveryutil mdnsflushcache",
                  title: "Terminal    (OSX Yosemite v10.10 through v10.10.3)"),
              const LogCard("sudo dscacheutil -flushcache",
                  title: "Terminal    (OSX Snow Leopard)"),
            ],
          ),
        ),
      ),
    );
  }
}
