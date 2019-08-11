/// Named Path of each Routes
class RoutePaths {
  static const String Authentication = '/';
  static const String Reporting = '/reporting';
  static const String Docs = '/docs';
  static const String Calendar = '/calendar';
  static const String About = '/about';
  static const String Feedback = 'feedback';
  static const String News = '/news';
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
  static const String localDNSIP = "192.168.0.6";

  /// Stormshield IP
  static const String stormshieldIP = "195.83.139.7";

  /// Stormshield named address
  static const String stormshield = "fw-cgcp.emse.fr";
}

/// Some texts constants
///
/// This will probably be used if the app get intl.
class Texts {
  static const List<String> agendaVide = [
    "Ben alors ? On n'a pas cours ?",
    "Ça sent le barbecue....",
    "Libeeeeertééé !",
    "Chatteux va !",
    "Passe plus de temps avec la famille !\n(au lieu de regarder les prochains cours)",
    "L'application compte plus de 10 000 lignes de codes...\n\n(avec 30 000 additions et 20 000 délétions)",
    "L'application est développé avec Flutter et avec ❤️",
    "Minitel gère !",
    "Freeeeeeedom !",
    "The sad panda sit alone.",
  ];
}
