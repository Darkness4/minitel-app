class AssetPaths {
  static const String TemplateICS = 'assets/template.ics';
  static const String LogoMinitelWhite = 'assets/img/logo_minitel_white.png';
  static const String LogoMinitel = 'assets/img/logo_minitel.png';
  static const String Icon = 'assets/icon/icon.png';
  static const String DocNetwork = 'assets/img/network.jpg';
  static const String DocLecteurReseau = 'assets/img/Lecteur-reseau.png';
  static const String DocImprimanteLinux = 'assets/img/Linux.png';
  static const String Slack = 'assets/img/Slack_Mark_Monochrome_White.png';
  static const String Facebook = 'assets/icon/f_logo.png';
  static const String Github = 'assets/icon/GitHub-Mark.png';
  static const String EMSE = 'assets/img/logo_emse.png';
  static const String Sogo = 'assets/img/mail.png';
}

/// Content of the report after a diagnosis.
class DiagnosisContent extends Iterable<String> {
  static const String ip = "IP";
  static const String ipAddr = "ip addr";
  static const String arp = "Address Resolution Protocol (SU + Busy)";
  static const String tracertGoogle = "Traceroute Google (Superuser)";
  static const String tracertGoogleDNS = "Traceroute Google DNS (Superuser)";
  static const String pingLo = "Ping Loopback";
  static const String pingLocal = "Ping Local";
  static const String pingGate = "Ping Gateway";
  static const String pingDNS1 = "Ping DNS 1";
  static const String pingDNS2 = "Ping DNS 2";
  static const String pingDNS3 = "Ping DNS 3";
  static const String pingDNS4 = "Ping DNS 4";
  static const String pingDNS5 = "Ping DNS 5";
  static const String nsLookupEMSE = "NSLookup EMSE";
  static const String nsLookupEMSEBusy = "NSLookup EMSE (SU + Busy)";
  static const String nsLookupGoogle = "NSLookup Google";
  static const String nsLookupGoogleBusy = "NSLookup Google (SU + Busy)";
  static const String httpPortalPublic = "HTTP Portal Response Public";
  static const String httpPortalGateway = "HTTP Portal Response Gateway";

  /// Make able to loop through [DiagnosisContent]
  ///
  /// Exemple:
  /// ```
  /// for (String content in DiagnosisContent())
  /// ```
  @override
  Iterator<String> get iterator => <String>[
        ip,
        ipAddr,
        arp,
        tracertGoogle,
        tracertGoogleDNS,
        pingLo,
        pingLocal,
        pingGate,
        pingDNS1,
        pingDNS2,
        pingDNS3,
        pingDNS4,
        pingDNS5,
        nsLookupEMSE,
        nsLookupEMSEBusy,
        nsLookupGoogle,
        nsLookupGoogleBusy,
        httpPortalPublic,
        httpPortalGateway,
      ].iterator;
}

/// Path of documentation
enum DocsPageId { Home, Wiki, Toolbox }

/// All the IP used in the app.
class MyIPAdresses {
  /// Google named address
  static const String google = "google.com";

  /// Google DNS IP
  static const String googleDNSIP = "8.8.8.8";

  /// Localhost IP for Internet Protocal v4 test
  static const String localhostIP = "127.0.0.1";

  /// Local Server IP for local ping
  static const String proliantIP = "10.163.0.5";

  /// Main Gateway IP
  static const String gatewayIP = "10.163.0.2";

  /// EMSE ISMIN DNS 1 IP
  static const String emseIsminDNS1IP = "192.168.130.3";

  /// EMSE ISMIN DNS 2 IP
  static const String emseIsminDNS2IP = "192.168.130.33";

  /// Cloudflare DNS IP
  static const String cloudflareDNSIP = "1.1.1.1";

  /// Local DNS IP
  static const String localDNSIP = "10.163.0.6";

  /// Stormshield IP
  static const String stormshieldIP = "195.83.139.7";

  /// Stormshield named address
  static const String stormshield = "fw-cgcp.emse.fr";
}

/// Named Path of each Routes
class RoutePaths {
  static const String Authentication = '/';
  static const String Reporting = '/reporting';
  static const String Docs = '/docs';
  static const String Agenda = '/agenda';
  static const String About = '/about';
  static const String Feedback = 'feedback';
  static const String News = '/news';
}
