class AssetPaths {
  static const String TemplateICS = 'assets/template.ics';
  static const String LogoMinitelWhite = 'assets/img/logo_minitel_white.webp';
  static const String LogoMinitel = 'assets/img/logo_minitel.webp';
  static const String Icon = 'assets/icon/icon.png';
  static const String DocNetwork = 'assets/img/network.webp';
  static const String DocLecteurReseau = 'assets/img/Lecteur-reseau.webp';
  static const String DocImprimanteLinux = 'assets/img/Linux.webp';
  static const String Slack = 'assets/img/Slack_Mark_Monochrome_White.webp';
  static const String Twitter = 'assets/icon/Twitter_Logo_Blue.png';
  static const String Github = 'assets/icon/GitHub-Mark.webp';
  static const String EMSE = 'assets/img/logo_emse.webp';
  static const String Promethee = 'assets/img/logo_alcuin.png';
  static const String Campus = 'assets/img/Moodle-Logo-RGB.png';
  static const String Sogo = 'assets/img/mail.webp';
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

  /// Stormshield named address
  static const String emseImprimanteIP = "192.168.130.2";

  /// Local DNS IP
  static const String localDNSIP = "10.163.0.6";

  /// Stormshield IP
  static const String stormshieldIP = "195.83.139.7";

  /// Stormshield named address
  static const String stormshield = "fw-cgcp.emse.fr";
}
