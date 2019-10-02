import 'package:intl/intl.dart';

class PortalLoc {
  final String localeName;
  final AppListLoc apps;
  PortalLoc(this.localeName) : apps = AppListLoc(localeName);

  String get title => Intl.message(
        'Authentification',
        name: 'PortalLoc_title',
        locale: localeName,
      );

  String get autoLogin => Intl.message(
        "Se connecter automatiquement",
        name: 'PortalLoc_autoLogin',
        locale: localeName,
      );
  String get login => Intl.message(
        "Se connecter",
        name: 'PortalLoc_login',
        locale: localeName,
      );
  String get rememberMe => Intl.message(
        "Se souvenir ",
        name: 'PortalLoc_rememberMe',
        locale: localeName,
      );
  String get password => Intl.message(
        "Mot de passe",
        name: 'PortalLoc_password',
        locale: localeName,
      );

  String get domainNameHeader => Intl.message(
        "Nom de domaine / IP",
        name: 'PortalLoc_domainNameHeader',
        locale: localeName,
      );

  String get usernameLabel => Intl.message(
        "Nom d'utilisateur",
        name: 'PortalLoc_usernameLabel',
        locale: localeName,
      );

  String get usernameHint => Intl.message(
        "prenom.nom",
        name: 'PortalLoc_usernameHint',
        locale: localeName,
      );

  String get authTime => Intl.message(
        "Durée d\'authentification ",
        name: 'PortalLoc_authTime',
        locale: localeName,
      );
}

class AppListLoc {
  final String localeName;
  AppListLoc(this.localeName);
  String get printer => Intl.message(
        "Imprimante",
        name: 'AppListLoc_printer',
        locale: localeName,
      );

  String get portal => Intl.message(
        "Portail",
        name: 'AppListLoc_portal',
        locale: localeName,
      );
}
