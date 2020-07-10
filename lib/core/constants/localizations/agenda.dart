import 'package:intl/intl.dart';

class AgendaLoc {
  final String localeName;
  AgendaLoc(this.localeName);
  List<String> get cases => <String>[
        emptyAgenda0,
        emptyAgenda1,
        emptyAgenda2,
        emptyAgenda3,
        emptyAgenda4,
        emptyAgenda5,
        emptyAgenda6,
        emptyAgenda7,
        emptyAgenda8,
        emptyAgenda9,
      ];

  String get emptyAgenda0 => Intl.message(
        "Ben alors ? On n'a pas cours ?",
        name: 'AgendaLoc_emptyAgenda0',
        locale: localeName,
      );

  String get emptyAgenda1 => Intl.message(
        'Ça sent le barbecue....',
        name: 'AgendaLoc_emptyAgenda1',
        locale: localeName,
      );

  String get emptyAgenda2 => Intl.message(
        'Libeeeeertééé !',
        name: 'AgendaLoc_emptyAgenda2',
        locale: localeName,
      );
  String get emptyAgenda3 => Intl.message(
        'Chatteux va !',
        name: 'AgendaLoc_emptyAgenda3',
        locale: localeName,
      );
  String get emptyAgenda4 => Intl.message(
        'Passe plus de temps avec la famille !\n(au lieu de regarder les prochains cours)',
        name: 'AgendaLoc_emptyAgenda4',
        locale: localeName,
      );
  String get emptyAgenda5 => Intl.message(
        "L'application compte plus de 10 000 lignes de codes...\n\n(avec 30 000 additions et 20 000 délétions)",
        name: 'AgendaLoc_emptyAgenda5',
        locale: localeName,
      );
  String get emptyAgenda6 => Intl.message(
        "L'application est développé avec Flutter et avec ❤️",
        name: 'AgendaLoc_emptyAgenda6',
        locale: localeName,
      );
  String get emptyAgenda7 => Intl.message(
        'Minitel gère !',
        name: 'AgendaLoc_emptyAgenda7',
        locale: localeName,
      );
  String get emptyAgenda8 => Intl.message(
        'Freeeeeeedom !',
        name: 'AgendaLoc_emptyAgenda8',
        locale: localeName,
      );
  String get emptyAgenda9 => Intl.message(
        'The sad panda sit alone.',
        name: 'AgendaLoc_emptyAgenda9',
        locale: localeName,
      );
  NotificationSettingsLoc get notificationSettings =>
      NotificationSettingsLoc(localeName);
  String get title => Intl.message(
        'Agenda',
        name: 'AgendaLoc_title',
        locale: localeName,
      );
}

class NotificationSettingsLoc {
  final String localeName;
  const NotificationSettingsLoc(this.localeName);

  String get early1 => Intl.message(
        'Notifier ',
        name: 'NotificationSettingsLoc_early1',
        desc: '[] X minutes avant le cours',
        locale: localeName,
      );

  String get early2 => Intl.message(
        ' minutes avant le cours.',
        name: 'NotificationSettingsLoc_early2',
        desc: 'Notifier X []',
        locale: localeName,
      );

  String get enabled1 => Intl.message(
        'Les notifications sont ',
        name: 'NotificationSettingsLoc_enabled1',
        desc: '[] activées.',
        locale: localeName,
      );

  String get range1 => Intl.message(
        'Notifier les cours des ',
        name: 'NotificationSettingsLoc_range1',
        desc: '[] X prochains jours.',
        locale: localeName,
      );

  String get range2 => Intl.message(
        ' prochains jours.',
        name: 'NotificationSettingsLoc_range2',
        desc: 'Notifier les cours des X []',
        locale: localeName,
      );

  String get save => Intl.message(
        'Sauvegarder',
        name: 'NotificationSettingsLoc_save',
        locale: localeName,
      );

  String get title => Intl.message(
        'Paramètres de notifications',
        name: 'NotificationSettingsLoc_title',
        locale: localeName,
      );

  String enabled2(bool enabled) => Intl.select(
        enabled,
        <bool, String>{true: 'activées.', false: 'désactivées.'},
        name: 'NotificationSettingsLoc_enabled2',
        args: <bool>[enabled],
        desc: 'Les notifications sont []',
        locale: localeName,
      );
}
