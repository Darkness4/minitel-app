// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a it locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'it';

  static m0(enabled) => "${Intl.select(enabled, {
        'true': 'abilitate.',
        'false': 'disabilitate.',
      })}";

  static m1(hours, minutes) => "${hours} ore e ${minutes} minuti rimanenti";

  static m2(minutes) => "${minutes} minuti rimanenti";

  static m3(seconds) => "${seconds} secondi rimanenti";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "AboutLoc_description": MessageLookupByLibrary.simpleMessage(
            "Minitel Toolbox include gli strumenti più utili per avere un WiFi senza problemi."),
        "AboutLoc_developper":
            MessageLookupByLibrary.simpleMessage("Sviluppatore"),
        "AboutLoc_lastVestion":
            MessageLookupByLibrary.simpleMessage("Ultima versione"),
        "AboutLoc_license": MessageLookupByLibrary.simpleMessage("Licenza"),
        "AboutLoc_privacyPolicySubtitle": MessageLookupByLibrary.simpleMessage(
            "Nessun dato viene condiviso e memorizzato a tua insaputa. I dati raccolti sono i dati che ci fornite (diagnostica) e non vengono mai salvati."),
        "AboutLoc_privacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Informativa sulla privacy"),
        "AboutLoc_title": MessageLookupByLibrary.simpleMessage(
            "Informazioni su Minitel Toolbox"),
        "AboutLoc_website": MessageLookupByLibrary.simpleMessage("Sito web"),
        "AgendaLoc_emptyAgenda0":
            MessageLookupByLibrary.simpleMessage("Allora? Niente lezione?"),
        "AgendaLoc_emptyAgenda1":
            MessageLookupByLibrary.simpleMessage("\'odora di barbecue ..."),
        "AgendaLoc_emptyAgenda2":
            MessageLookupByLibrary.simpleMessage("Libertà!"),
        "AgendaLoc_emptyAgenda3":
            MessageLookupByLibrary.simpleMessage("Vai fortunato!"),
        "AgendaLoc_emptyAgenda4": MessageLookupByLibrary.simpleMessage(
            "Passa più tempo con la famiglia!\n(invece di guardare le prossime lezioni) "),
        "AgendaLoc_emptyAgenda5": MessageLookupByLibrary.simpleMessage(
            "L\'applicazione ha più di 10.000 righe di codice...\n\n (con 40.000 aggiunte e 30.000 soppressioni)"),
        "AgendaLoc_emptyAgenda6": MessageLookupByLibrary.simpleMessage(
            "L\'applicazione è sviluppata con Flutter e ❤️"),
        "AgendaLoc_emptyAgenda7":
            MessageLookupByLibrary.simpleMessage("Minitel è il migliore!"),
        "AgendaLoc_emptyAgenda8":
            MessageLookupByLibrary.simpleMessage("Libeeeeertà!"),
        "AgendaLoc_emptyAgenda9":
            MessageLookupByLibrary.simpleMessage("The sad panda sit alone."),
        "AgendaLoc_title": MessageLookupByLibrary.simpleMessage("Agenda"),
        "AppListLoc_portal": MessageLookupByLibrary.simpleMessage("Portale"),
        "AppListLoc_printer": MessageLookupByLibrary.simpleMessage("Stampante"),
        "NewsLoc_seeTwitter":
            MessageLookupByLibrary.simpleMessage("Vedi su Twitter ..."),
        "NewsLoc_title": MessageLookupByLibrary.simpleMessage("Notizie"),
        "NotificationSettingsLoc_early1":
            MessageLookupByLibrary.simpleMessage("Notifica "),
        "NotificationSettingsLoc_early2":
            MessageLookupByLibrary.simpleMessage(" minuti prima del corso."),
        "NotificationSettingsLoc_enabled1":
            MessageLookupByLibrary.simpleMessage("Le notifiche sono "),
        "NotificationSettingsLoc_enabled2": m0,
        "NotificationSettingsLoc_range1": MessageLookupByLibrary.simpleMessage(
            "Comunica i prezzi per i prossimi "),
        "NotificationSettingsLoc_range2":
            MessageLookupByLibrary.simpleMessage(" giorni."),
        "NotificationSettingsLoc_save":
            MessageLookupByLibrary.simpleMessage("Salva"),
        "NotificationSettingsLoc_title":
            MessageLookupByLibrary.simpleMessage("Impostazioni di notifica"),
        "PortalLoc_authTime":
            MessageLookupByLibrary.simpleMessage("Tempo di autenticazione "),
        "PortalLoc_autoLogin":
            MessageLookupByLibrary.simpleMessage("Accedi automaticamente"),
        "PortalLoc_domainNameHeader":
            MessageLookupByLibrary.simpleMessage("Nome dominio / IP "),
        "PortalLoc_login": MessageLookupByLibrary.simpleMessage("Accesso"),
        "PortalLoc_password": MessageLookupByLibrary.simpleMessage("Password"),
        "PortalLoc_rememberMe":
            MessageLookupByLibrary.simpleMessage("Ricordati di me "),
        "PortalLoc_statusInHM": m1,
        "PortalLoc_statusInMinutes": m2,
        "PortalLoc_statusInSeconds": m3,
        "PortalLoc_title":
            MessageLookupByLibrary.simpleMessage("Autenticazione"),
        "PortalLoc_usernameHint":
            MessageLookupByLibrary.simpleMessage("nome.cognome"),
        "PortalLoc_usernameLabel":
            MessageLookupByLibrary.simpleMessage("Nome utente"),
        "ReportingLoc_chamberHint":
            MessageLookupByLibrary.simpleMessage("Numero di Camera"),
        "ReportingLoc_chamberLabel":
            MessageLookupByLibrary.simpleMessage("Camera"),
        "ReportingLoc_idHint":
            MessageLookupByLibrary.simpleMessage("Cognome nome"),
        "ReportingLoc_idLabel":
            MessageLookupByLibrary.simpleMessage("Identità"),
        "ReportingLoc_isNotValidUid": MessageLookupByLibrary.simpleMessage(
            "Il nome utente deve essere nel formato \'nome.cognome\'."),
        "ReportingLoc_mustOnlyBeNumbers":
            MessageLookupByLibrary.simpleMessage("Deve contenere solo numeri."),
        "ReportingLoc_notEmpty":
            MessageLookupByLibrary.simpleMessage("Non deve essere vuoto"),
        "ReportingLoc_share":
            MessageLookupByLibrary.simpleMessage("Condividere"),
        "ReportingLoc_slack":
            MessageLookupByLibrary.simpleMessage("Notifica su gioco"),
        "ReportingLoc_title":
            MessageLookupByLibrary.simpleMessage("Segnala a Minitel"),
        "ReportingLoc_titleHint":
            MessageLookupByLibrary.simpleMessage("Non ho più internet!"),
        "ReportingLoc_titleLabel":
            MessageLookupByLibrary.simpleMessage("Titolo"),
        "TutorialLoc_content1": MessageLookupByLibrary.simpleMessage(
            "1. Accedi a \"WiFi Minitel\"."),
        "TutorialLoc_content2": MessageLookupByLibrary.simpleMessage(
            "2. Avviare la sequenza diagnostica premendo il pulsante e attendere 1 minuto."),
        "TutorialLoc_content3": MessageLookupByLibrary.simpleMessage(
            "3. Compila il tuo rapporto. Non dimenticare un mezzo di comunicazione (stanza, posta, messenger ...)"),
        "TutorialLoc_content4": MessageLookupByLibrary.simpleMessage(
            "4. Connettersi a una rete in cui è presente Internet."),
        "TutorialLoc_content5":
            MessageLookupByLibrary.simpleMessage("5. Invia il rapporto."),
        "TutorialLoc_example": MessageLookupByLibrary.simpleMessage(
            "Esempio:\nTitolo: Non Internet da lunedì.\nDescrizione: perdo spesso la connessione quando sono su Ethernet. Wifi è ok."),
        "TutorialLoc_header": MessageLookupByLibrary.simpleMessage(
            "Come segnalare senza Internet?"),
        "TutorialLoc_notice": MessageLookupByLibrary.simpleMessage(
            "NOTA: si consiglia di installare Root e Busybox."),
        "forceDark": MessageLookupByLibrary.simpleMessage("Forza Tema Oscuro")
      };
}
