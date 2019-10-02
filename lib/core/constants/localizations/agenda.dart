import 'package:intl/intl.dart';

class AgendaLoc {
  final String localeName;
  final NotificationSettingsLoc notificationSettings;
  AgendaLoc(this.localeName)
      : notificationSettings = NotificationSettingsLoc(localeName);
}

class NotificationSettingsLoc {
  final String localeName;
  const NotificationSettingsLoc(this.localeName);

  String get title => Intl.message(
        "Paramètres de notifications",
        name: 'NotificationSettingsLoc_title',
        locale: localeName,
      );

  String get enabled1 => Intl.message(
        "Les notifications sont ",
        name: 'NotificationSettingsLoc_enabled1',
        desc: '[] activées.',
        locale: localeName,
      );

  String enabled2(bool enabled) => Intl.select(
        enabled,
        <Object, String>{true: 'activées.', false: 'désactivées.'},
        name: 'NotificationSettingsLoc_enabled2',
        args: <Object>[enabled],
        desc: 'Les notifications sont []',
        locale: localeName,
      );

  String get early1 => Intl.message(
        "Notifier ",
        name: 'NotificationSettingsLoc_early1',
        desc: '[] X minutes avant le cours',
        locale: localeName,
      );

  String get early2 => Intl.message(
        " minutes avant le cours.",
        name: 'NotificationSettingsLoc_early2',
        desc: 'Notifier X []',
        locale: localeName,
      );

  String get range1 => Intl.message(
        "Notifier les cours des ",
        name: 'NotificationSettingsLoc_range1',
        desc: '[] X prochains jours.',
        locale: localeName,
      );

  String get range2 => Intl.message(
        " prochains jours.",
        name: 'NotificationSettingsLoc_range2',
        desc: 'Notifier les cours des X []',
        locale: localeName,
      );

  String get save => Intl.message(
        "Sauvegarder",
        name: 'NotificationSettingsLoc_save',
        locale: localeName,
      );
}
