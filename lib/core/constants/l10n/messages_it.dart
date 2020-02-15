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
        "DiagnoseLoc_arpContent1": MessageLookupByLibrary.simpleMessage(
            "Visualizza gli indirizzi MAC di tutti i dispositivi collegati al telefono. Il Gateway deve essere visualizzato e l\'indirizzo MAC deve essere 00-0d-b4-10-99-e1. Se l\'indirizzo MAC del gateway non corrisponde a quello del gateway, si tratta di un fisonning ARP: \n"),
        "DiagnoseLoc_arpContent2": MessageLookupByLibrary.simpleMessage(
            "Il ladro di IP del gateway risponde alla risposta ARP inviata dalla vittima in trasmissione, più velocemente del gateway.\n\n"),
        "DiagnoseLoc_arpContent3": MessageLookupByLibrary.simpleMessage(
            "Una soluzione temporanea (solo quando il WiFi è attivo) lo è:"),
        "DiagnoseLoc_header": MessageLookupByLibrary.simpleMessage("Diagnosi"),
        "DiagnoseLoc_httpContent": MessageLookupByLibrary.simpleMessage(
            "Se appare un errore 4xx o 5xx, si prega di segnalarlo a Minitel."),
        "DiagnoseLoc_ipaContent": MessageLookupByLibrary.simpleMessage(
            "Fornisce informazioni utili sull\'hardware.\n\nInformazioni utili:\n- Stato\n- Indirizzo IP\n- Indirizzo MAC"),
        "DiagnoseLoc_nsLookupContent1": MessageLookupByLibrary.simpleMessage(
            "Se non c\'è risposta, ma il ping DNS funziona, il dispositivo ha un problema di cache DNS.\n"),
        "DiagnoseLoc_nsLookupContent2": MessageLookupByLibrary.simpleMessage(
            "Per i dispositivi portatili, riavviare il Wi-Fi.\nEcco alcune soluzioni::"),
        "DiagnoseLoc_pingDNSContent": MessageLookupByLibrary.simpleMessage(
            "Se uno dei DNS (eccetto 10.163.0.6) risponde, si è connessi a Internet."),
        "DiagnoseLoc_pingGatewayContent": MessageLookupByLibrary.simpleMessage(
            "Il gateway normalmente ignora i ping. Tuttavia, se viene ricevuto un ping, probabilmente qualcuno ha preso il suo IP. Ma nulla è certo."),
        "DiagnoseLoc_pingLoContent1": MessageLookupByLibrary.simpleMessage(
            "Controlla se il software TCP/IP funziona.\n"),
        "DiagnoseLoc_pingLoContent2": MessageLookupByLibrary.simpleMessage(
            "Dovrebbe essere sempre positivo."),
        "DiagnoseLoc_pingLocalContent1": MessageLookupByLibrary.simpleMessage(
            "Ping a un computer locale (10.163.0.5, che è il server Minitel e dovrebbe essere sempre attivo).\n\nSe i pacchetti vengono persi, questi sono gli scenari più probabili:\n    1.  Non hai un IP."),
        "DiagnoseLoc_pingLocalContent2": MessageLookupByLibrary.simpleMessage(
            " (Vedere ip a, e avvisare immediatamente Minitel)\n"),
        "DiagnoseLoc_pingLocalContent3": MessageLookupByLibrary.simpleMessage(
            "    2.  Non si è connessi alla rete locale.\n    3.  Il server (10.163.0.5) è scollegato. (è possibile eseguire il ping 10.163.0.10)\n    4.  Un interruttore della Casa dello Studente è scollegato.\n    5.  Un interruttore dall\'abitazione è scollegato."),
        "DiagnoseLoc_reactionContent": MessageLookupByLibrary.simpleMessage(
            "Se non c\'è più una rete, contattare Minitel e utilizzare la suite diagnostica nella pagina \"Segnala a Minitel\"."),
        "DiagnoseLoc_reactionHeader":
            MessageLookupByLibrary.simpleMessage("Come dovrei reagire?"),
        "DiagnoseLoc_tracerouteContent": MessageLookupByLibrary.simpleMessage(
            "Visualizza il percorso e i ritardi dei pacchetti su un server di Google.\nUtile per vedere le cause del ritardo."),
        "DocsLoc_minitel": MessageLookupByLibrary.simpleMessage(
            "L\'associazione di rete della residenza: se avete bisogno di attrezzature (cavi, computer,.....), per porre domande sul funzionamento delle macchine a scuola o se avete problemi con il vostro computer, siamo noi che dovete contattare!\n\nUna delle principali attività di Minitel è la manutenzione della rete Internet di casa: questo significa uno sforzo costante per migliorare (nuove apparecchiature, monitoraggio....) la velocità e l\'affidabilità della vostra connessione.\n\nVi offriamo anche vari corsi di formazione durante tutto l\'anno che possono aiutarvi durante i corsi, o semplicemente soddisfare la vostra curiosità informatica!\n\nInfine, attribuiamo grande importanza all\'animazione della vita studentesca nel campus! Per fare questo, organizziamo diversi eventi informatici, come il Nuit de l\'Info o i tornei di videogiochi!\n\nSe volete saperne di più sull\'associazione e sulla vita digitale della residenza, non esitate a contattare uno dei soci Minitel: saremo lieti di aiutarvi e rispondere a tutte le vostre domande."),
        "DocsLoc_title": MessageLookupByLibrary.simpleMessage("Documentazione"),
        "DualbootLoc_changeLinuxContent": MessageLookupByLibrary.simpleMessage(
            "    •  In generale, non cambiamo Linux. Se manca la personalizzazione, cercare \"Come personalizzare un Display Manager (DM), o un Window Manager (WM)\". Cercare \"Come personalizzare un terminale\" e testare le configurazioni su una macchina virtuale.\n    •  Vuoi hackerare? Gli strumenti di Kali Linux sono scaricabili indipendentemente dal sistema operativo\n    •  LTS? In generale, gli LTS sono molto più stabili\n    •  Inoltre, l\'80% degli utenti Ubuntu preferisce reinstallare piuttosto che fare un dist-upgrade.\n"),
        "DualbootLoc_changeLinuxHeader": MessageLookupByLibrary.simpleMessage(
            "Cambia GNU / Linux o no ...\n"),
        "DualbootLoc_customizeContent": MessageLookupByLibrary.simpleMessage(
            "    •  Prima volta? Lubuntu LTS (nel peggiore dei casi Kubuntu) o Linux Mint\n    •  La seconda volta? Conoscere la differenza tra KDE, Gnome, XFCE, LXDE, MATE, awesomewm...E controlla r/unixporn\n    •  Qualcosa di elegante e già fatto? MX Linux, deepin, Linux Lite, sistema operativo elementare, Pop!_OS, ...\n    •  Vuoi personalizzare a morte? Arch Linux, Alpine, Manjaro, Debian\n    •  Qualcosa di professionale? CentOS\n    •  Un semplice server? OpenSUSE\n    •  15 MB ? Alpine, Tiny Core (docker only)\n    •  Raspberry PI ? Raspbian\n    •  Pentest ONLY ? Kali Linux\n    •  Vuoi suicidarti? \"Free Software Fondation OS\"\n    •  Peggio della morte? Linux From Scratch\n    •  Riportare in vita un Android come server Linux? postmarketOS\n\n"),
        "DualbootLoc_customizeHeader": MessageLookupByLibrary.simpleMessage(
            "La personalizzazione non è limitata. Osservare quali distribuzioni sono più appropriate:\n"),
        "DualbootLoc_header":
            MessageLookupByLibrary.simpleMessage("L\'arte di Dual Boot"),
        "DualbootLoc_infos": MessageLookupByLibrary.simpleMessage(
            "Vengono mostrate solo le fasi principali. Per ulteriori informazioni:"),
        "DualbootLoc_installContent": MessageLookupByLibrary.simpleMessage(
            "    •  Lingua, fuso orario, rete ...\n    •  Configurazione manuale del disco (consigliata)\n    •  In questo ordine:\n    •  \"/dev/sda1\" mount on \"/\" con ext4, Partition Size Linux\n    •  \"/dev/sda2\" è lo SWAP, Dimensione = 1.5 * RAM con ibernazione, altrimenti Dimensione = 1/4 * RAM\n    •  Il GRUB (bootloader) deve essere installato insieme a Windows! (in MBR, altrimenti ignora)\n    •  Controlla e conferma le partizioni (controlla se windows è ancora lì 🙂)\n    •  Etc (attendi fino al completamento dell\'installazione) ...\n    •  (UEFI) Cambia l\'ordine di boot UEFI nel BIOS\n\n"),
        "DualbootLoc_installHeader": MessageLookupByLibrary.simpleMessage(
            "Installare Linux (avviare con la chiavetta cambiando l\'ordine di boot sul BIOS o tramite un tasto della tastiera (F11? Cancellare? Inserire? Inserire? F1? F2? F12? F12?):\n"),
        "DualbootLoc_issue1Content": MessageLookupByLibrary.simpleMessage(
            "Generalmente, se il computer è dotato di gestione grafica ibrida, Linux non si avvia.\nSoluzione:\n    •  Aggiungi \"nomodeset\" nelle opzioni di boot avanzate\n    •  Rimuovi anche \"quiet splash\" per leggibilità\n\nEs:"),
        "DualbootLoc_issue2Content1": MessageLookupByLibrary.simpleMessage(
            "    Generalmente, Linux funziona con Intel. Il che è molto negativo se si vuole estrarre l\'etereo o fare Machine Learning.\n"),
        "DualbootLoc_issue2Content2": MessageLookupByLibrary.simpleMessage(
            "    •  Scaricare i driver NVIDIA dal sito Web ufficiale di NVIDIA.\n    •  (Scarica CUDA se necessario, senza driver, senza openGL)\n    •  Passa a TTY tramite Ctrl + Alt + F1, Ctrl + Alt + F2 ... "),
        "DualbootLoc_issue2Content3": MessageLookupByLibrary.simpleMessage(
            "Se la porta HDMI non funziona più in BIOS Legacy su Windows:"),
        "DualbootLoc_prepContent": MessageLookupByLibrary.simpleMessage(
            "    •  Windows\n    •  Chiavetta USB 4 GB\n    •  Conosci il tipo di BIOS: UEFI ou Legacy\n    •  Disattivare Secure Boot\n    •  Preparare una partizione vuota di almeno 50 GB\n    •  Con Rufus, aggiorna un\'immagine sulla chiavetta (FAT32, update syslinux, modalità ISO), in MBR\n\n"),
        "DualbootLoc_prepHeader":
            MessageLookupByLibrary.simpleMessage("Preparazioni:\n"),
        "DualbootLoc_risksContent": MessageLookupByLibrary.simpleMessage(
            "    •  Linux è più stabile, ma gli aggiornamenti della distribuzione sono più fragili (l\'80% degli utenti Ubuntu preferisce reinstallare piuttosto che aggiornare).\n    •  I driver sono le prime cause di crash improvvisi (NVIDIA, Realtek...)\n    •  Una configurazione errata del BIOS può anche essere fatale per voi\n\n"),
        "DualbootLoc_risksHeader": MessageLookupByLibrary.simpleMessage(
            "Essere consapevoli dei rischi dell\'installazione di Linux:\n"),
        "ImprimanteLoc_header": MessageLookupByLibrary.simpleMessage(
            "Configurazione della stampante"),
        "ImprimanteLoc_linuxContent1": MessageLookupByLibrary.simpleMessage(
            "    -  Aggiungi smb://192.168.130.2/imprimantes-gcp alle stampanti di rete\n    -  Driver: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd"),
        "ImprimanteLoc_linuxContent2": MessageLookupByLibrary.simpleMessage(
            "    -  Vai a http://localhost:631/admin (nome account e password linux)\n    -  La scheda \"Amministrazione\"\n    -  \"Aggiungi stampante\"\n    -  Tipo SMB, indirizzo smb://192.168.130.2/imprimantes-gcp\n    -  Usa il PPD file: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd\n    -  Configura il resto e dovrebbe andare bene"),
        "ImprimanteLoc_pukContent": MessageLookupByLibrary.simpleMessage(
            "Usa l\'applicazione Minitel > Apps > Stampante"),
        "ImprimanteLoc_windowsContent": MessageLookupByLibrary.simpleMessage(
            "    -  Aperto \\192.168.130.2 con Windows Explorer\n    -  Inserisci nome e password (prova anche EMSE2000\nnome.cognome)\n    -  Fai doppio clic su \"imprimantes-gpc\""),
        "LoginLoc_domainNameContent1": MessageLookupByLibrary.simpleMessage(
            "Scegliere tra fw-cgcp.emse.fr, 10.163.0.2 e 195.83.139.7\n"),
        "LoginLoc_domainNameContent2": MessageLookupByLibrary.simpleMessage(
            "Se la rete locale supporta un DNS, come 192.168.130.33 (DSI) o 10.163.0.6 (Minitel), si può provare fw-cgcp.emse.fr.\nSe la rete è Minitel (WiFi Minitel), utilizzare 10.163.0.2\n"),
        "LoginLoc_domainNameContent3": MessageLookupByLibrary.simpleMessage(
            "In generale, 195.83.139.139.7 è adatto nel 90% dei casi.\nQuesto è l\'indirizzo IP pubblico del portale ed è autorizzato dal gateway.\n"),
        "LoginLoc_header":
            MessageLookupByLibrary.simpleMessage("Autenticazione"),
        "MailLoc_header":
            MessageLookupByLibrary.simpleMessage("Importare e-mail Sogo"),
        "MailLoc_mailContent1": MessageLookupByLibrary.simpleMessage(
            "Con la tua applicazione e-mail preferita, usa la configurazione manuale e compila i campi corrispondenti."),
        "MailLoc_mailContent2": MessageLookupByLibrary.simpleMessage(
            "E-mail: firstname.lastname@etu.emse.fr\nPassword: password della scuola\nServer in entrata: IMAP\nNome host: messel.emse.fr\nPorta: 993\nSicurezza: ssl / tls\nMetodo di autenticazione: password standard\nIdentificatore: firstname.lastname (⚠️ senza @etu.emse.fr)\nServer in uscita: Nome host: messel.emse.fr\nPorta: 465\nSicurezza: ssl / tls\nMetodo di autenticazione: password standard\nIdentificatore: firstname.lastname (⚠️ senza @etu.emse.fr)"),
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
        "VMLoc_customizeContent": MessageLookupByLibrary.simpleMessage(
            "    -  Utile per avere una sandbox e fare molti test.\n    -  Utile per la formazione su Linux (WM, DM, driver, installazioni ...), senza far esplodere il dual boot.\n    -  Utile per creare un VPS.\n    -  Utile per l\'utilizzo di un compilatore con un ambiente dedicato e protetto.\n\n"),
        "VMLoc_customizeHeader": MessageLookupByLibrary.simpleMessage(
            "Una VM è quindi fatta per essere manomessa a morte:\n"),
        "VMLoc_definitionContent": MessageLookupByLibrary.simpleMessage(
            "    Una macchina i cui componenti sono emulati.\nUna macchina che è strettamente isolata dall\'host.\n    Man mano che i componenti vengono emulati, le probabilità di un incidente VM sono molto più basse.\n\n"),
        "VMLoc_definitionHeader":
            MessageLookupByLibrary.simpleMessage("Una VM è:\n"),
        "VMLoc_envContent": MessageLookupByLibrary.simpleMessage(
            "    -  Per Linux: Docker, (Container Linux, ovvero ambiente dedicato per applicazione) (Si noti che funziona anche su Windows perché esegue una macchina virtuale Linux su Hyper-V in background.)\n    -  Per Windows: Windows Subsystem for Linux 1 (Kernel Nativo Linux, attenzione, l\'hardware non viene emulato!)\n    -  Per Windows: Windows Subsystem for Linux 2 (+ Docker) (Kernel Linux in una micro-VM. RAM estremamente veloce e allocata dinamicamente.)\n"),
        "VMLoc_envHeader": MessageLookupByLibrary.simpleMessage(
            "Se si tratta di avere un ambiente di sviluppo semplice:\n"),
        "VMLoc_hypervisorContent": MessageLookupByLibrary.simpleMessage(
            "    1.  [Leader] Hyper-V (tipo 1, Windows, se possibile)\n    2.  [Visionario] KVM (tipo 1, Linux, 👍 Android)\n    3.  [Leader] VMWare Workstation (tipo 2, 👍 per reti, GNS3 e tutto il resto altro)\n    4.  [Niche Player] VirtualBox (tipo 2)\n    5.  [Leader] VMware ESXi (tipo 1, per professionisti)\n\n"),
        "VMLoc_hypervisorHeader": MessageLookupByLibrary.simpleMessage(
            "Ecco l\'ordine di preferenza di un hypervisor:\n"),
        "VMLoc_installContent": MessageLookupByLibrary.simpleMessage(
            "    -  Creazione di un disco virtuale > 20 GB\n    -  Inserimento di un\'immagine Linux nella porta del CD emulato\n    -  Installazione di Linux (simile a un dual boot)\n    -  Configurazione dell\'accesso SSH / telnet / RDP\n"),
        "VMLoc_installHeader": MessageLookupByLibrary.simpleMessage(
            "Va da sé che è inutile per una VM avere un\'interfaccia grafica.\nMolto spesso, invece di utilizzare l\'interfaccia grafica utente o il TTY, viene impostata una connessione SSH.\n\nIn generale, l\'installazione di una macchina virtuale è semplice e veloce:\n"),
        "VMLoc_vmTypeContent": MessageLookupByLibrary.simpleMessage(
            "    -  Tipo I: Bare Metal, il sistema operativo è esso stesso l\'hypervisor.\n    -  Tipo II: Hosted, l\'hypervisor è ospitato dal sistema operativo host.\n\n"),
        "VMLoc_vmTypeHeader": MessageLookupByLibrary.simpleMessage(
            "Alcuni hypervisor (VirtualBox, VMWare, Hyper-V) sono persino dotati di funzioni di installazione rapida.\n\nQuesto permette anche di praticare il dual boot 😄.\n\nTipi di macchine virtuali:\n"),
        "forceDark": MessageLookupByLibrary.simpleMessage("Forza Tema Oscuro")
      };
}
