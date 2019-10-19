// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names
// ignore_for_file:always_specify_types, type_annotate_public_apis
// ignore_for_file:always_declare_return_types, prefer_final_locals
// ignore_for_file:always_put_control_body_on_new_line
// ignore_for_file:implicit_dynamic_return
// ignore_for_file:implicit_dynamic_parameter
// ignore_for_file:invalid_assignment
// ignore_for_file:map_value_type_not_assignable

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'messages';

  static m0(enabled) => "${Intl.select(enabled, {
        'true': 'activées.',
        'false': 'désactivées.',
      })}";

  static m1(hours, minutes) =>
      "${hours} heures and ${minutes} minutes restantes";

  static m2(minutes) => "${minutes} minutes restantes";

  static m3(seconds) => "${seconds} secondes restantes";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "AboutLoc_description": MessageLookupByLibrary.simpleMessage(
            "Minitel Toolbox regroupe les outils les plus utiles pour avoir un WiFi sans encombre."),
        "AboutLoc_developper":
            MessageLookupByLibrary.simpleMessage("Développeur"),
        "AboutLoc_lastVestion":
            MessageLookupByLibrary.simpleMessage("Dernière version"),
        "AboutLoc_license": MessageLookupByLibrary.simpleMessage("Licence"),
        "AboutLoc_privacyPolicySubtitle": MessageLookupByLibrary.simpleMessage(
            "Aucune donnée est partagée et stockée à votre insu. Les données collectées sont celles que vous nous fournissez (diagnostique) et ne sont jamais sauvegardées. "),
        "AboutLoc_privacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Politique de confidentalité"),
        "AboutLoc_title":
            MessageLookupByLibrary.simpleMessage("À propos de Minitel Toolbox"),
        "AboutLoc_website":
            MessageLookupByLibrary.simpleMessage("Site Internet"),
        "AgendaLoc_emptyAgenda0": MessageLookupByLibrary.simpleMessage(
            "Ben alors ? On n\'a pas cours ?"),
        "AgendaLoc_emptyAgenda1":
            MessageLookupByLibrary.simpleMessage("Ça sent le barbecue...."),
        "AgendaLoc_emptyAgenda2":
            MessageLookupByLibrary.simpleMessage("Libeeeeertééé !"),
        "AgendaLoc_emptyAgenda3":
            MessageLookupByLibrary.simpleMessage("Chatteux va !"),
        "AgendaLoc_emptyAgenda4": MessageLookupByLibrary.simpleMessage(
            "Passe plus de temps avec la famille !\n(au lieu de regarder les prochains cours)"),
        "AgendaLoc_emptyAgenda5": MessageLookupByLibrary.simpleMessage(
            "L\'application compte plus de 10 000 lignes de codes...\n\n(avec 30 000 additions et 20 000 délétions)"),
        "AgendaLoc_emptyAgenda6": MessageLookupByLibrary.simpleMessage(
            "L\'application est développé avec Flutter et avec ❤️"),
        "AgendaLoc_emptyAgenda7":
            MessageLookupByLibrary.simpleMessage("Minitel gère !"),
        "AgendaLoc_emptyAgenda8":
            MessageLookupByLibrary.simpleMessage("Freeeeeeedom !"),
        "AgendaLoc_emptyAgenda9":
            MessageLookupByLibrary.simpleMessage("The sad panda sit alone."),
        "AgendaLoc_title": MessageLookupByLibrary.simpleMessage("Agenda"),
        "AppListLoc_portal": MessageLookupByLibrary.simpleMessage("Portail"),
        "AppListLoc_printer":
            MessageLookupByLibrary.simpleMessage("Imprimante"),
        "DiagnoseLoc_arpContent1": MessageLookupByLibrary.simpleMessage(
            "Affiche les adresses MAC de tous les appareils connectés au téléphone.\n\nLa Passerelle devrait être affiché et l\'adresse MAC doit être 00-0d-b4-10-99-e1.\n\nSi l\'adresse MAC de la passerelle ne correspond pas à celui de la passerelle, on a affaire à une ARP poisonning : \n"),
        "DiagnoseLoc_arpContent2": MessageLookupByLibrary.simpleMessage(
            "Le voleur d\'IP de la passerelle répond à la réponse ARP envoyé en broadcast par la victime, plus rapidement que la passerelle.\n\n"),
        "DiagnoseLoc_arpContent3": MessageLookupByLibrary.simpleMessage(
            "Une solution temporaire (uniquement lorsque le WiFi est allumé) est :"),
        "DiagnoseLoc_header":
            MessageLookupByLibrary.simpleMessage("Diagnostique"),
        "DiagnoseLoc_httpContent": MessageLookupByLibrary.simpleMessage(
            "Si une erreur 4xx ou 5xx apparait, veuillez le signaler à Minitel."),
        "DiagnoseLoc_ipaContent": MessageLookupByLibrary.simpleMessage(
            "Donne des informations utiles sur le matériel.\n\nInformations utiles:\n- Status\n- Adresse IP\n- Adresse MAC"),
        "DiagnoseLoc_nsLookupContent1": MessageLookupByLibrary.simpleMessage(
            "S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS.\n"),
        "DiagnoseLoc_nsLookupContent2": MessageLookupByLibrary.simpleMessage(
            "Pour les appareils portable, redémarrez le Wifi.\nVoici des solutions proposées:"),
        "DiagnoseLoc_pingDNSContent": MessageLookupByLibrary.simpleMessage(
            "Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet."),
        "DiagnoseLoc_pingGatewayContent": MessageLookupByLibrary.simpleMessage(
            "La passerelle ignore normalement les pings. Cependant, si un ping est reçu, quelqu\'un a probablement pris sont IP. Mais, rien est certain."),
        "DiagnoseLoc_pingLoContent1": MessageLookupByLibrary.simpleMessage(
            "Vérifie si le logiciel TCP/IP fonctionne.\n"),
        "DiagnoseLoc_pingLoContent2": MessageLookupByLibrary.simpleMessage(
            "Devrait être toujours positif."),
        "DiagnoseLoc_pingLocalContent1": MessageLookupByLibrary.simpleMessage(
            "Ping à un ordinateur local (10.163.0.5, qui est le serveur Minitel et devrait être toujours allumé).\n\nSi les paquets sont perdus, ceci sont les scenarios les plus probable:\n    1.  Vous n\'avez pas d\'IP."),
        "DiagnoseLoc_pingLocalContent2": MessageLookupByLibrary.simpleMessage(
            " (Voir ip a, et alertez immediatement à Minitel)\n"),
        "DiagnoseLoc_pingLocalContent3": MessageLookupByLibrary.simpleMessage(
            "    2.  Vous n\'êtes pas connecté au réseau local.\n    3.  Le serveur (10.163.0.5) est déconnecté. (vous pouvez ping 10.163.0.10)\n    4.  Un switch de la Maison des Elèves est déconnecté.\n    5.  Un switch de la résidence est déconnecté."),
        "DiagnoseLoc_reactionContent": MessageLookupByLibrary.simpleMessage(
            "S\'il n\'y a plus de réseau, contactez Minitel et utilisez la suite diagnostique dans la page \"Signaler Minitel\""),
        "DiagnoseLoc_reactionHeader":
            MessageLookupByLibrary.simpleMessage("Comment devrais-je réagir?"),
        "DiagnoseLoc_tracerouteContent": MessageLookupByLibrary.simpleMessage(
            "Affiche le chemin et les délais des paquets vers un serveur Google.\nUtile pour voir les causes de lag."),
        "DocsLoc_minitel": MessageLookupByLibrary.simpleMessage(
            "L’asso réseau de la rez’ : si tu as besoin de matériel (câbles, ordi,...), de poser des ques-tions sur le fonctionnement des machines à l’école ou si tu rencontres des problèmes avec ton ordinateur, c’est à nous qu’il faut s’adresser !\n\nL’une des occupations principales de Minitel est l’entretien du réseau Internet de la résidence : cela se traduit par un effort constant dans l’amélioration (nouveaux équipements, monitoring...) du débit et de la fiabilité de ta connexion.\n\nNous te proposons également tout au long de l’année des formations variées qui pourront t’aider lors des cours, ou bien simplement satisfaire ta curiosité en informatique !\n\nEnfin, nous attachons une grande importance à l’animation de la vie étudiante du campus ! Pour cela, nous organisons plusieurs événements informatiques, comme la Nuit de l’Info ou encore des tournois de jeux vidéo !\n\nSi tu souhaites en savoir plus à propos de l’asso et de la vie numérique de la rez’, n’hésite pas à contacter l’un des membres de Minitel : nous serons ravis de pouvoir t’aider et répondre à toutes tes questions"),
        "DocsLoc_title": MessageLookupByLibrary.simpleMessage("Documentation"),
        "DualbootLoc_changeLinuxContent": MessageLookupByLibrary.simpleMessage(
            "    •  Généralement, on ne change pas de Linux. S\'il manque de la customization, cherchez \"Comment customiser un Display Manager(DM), ou un Window Manager (WM)\". Cherchez \"Comment customiser un terminal\" et testez les configs sur une VM\n    •  Envie de hacker ? Les outils de Kali Linux sont téléchargeables indépendaments de l\'OS\n    •  LTS ? Généralement les LTS sont beaucoup plus stables\n    •  Egalement, 80 % des utilisateurs de Ubuntu préfèrent réinstaller que faire un dist-upgrade.\n"),
        "DualbootLoc_changeLinuxHeader": MessageLookupByLibrary.simpleMessage(
            "Changez de GNU/Linux ou pas...\n"),
        "DualbootLoc_customizeContent": MessageLookupByLibrary.simpleMessage(
            "    •  Première fois ? Lubuntu LTS (au pire Kubuntu) ou Linux Mint\n    •  Deuxième fois ? Connaissez la différence entre KDE, Gnome, XFCE, LXDE, MATE, awesomewm...Et allez voir r/unixporn\n    •  Quelque chose de stylé et déjà fait ? MX Linux, deepin, Linux Lite, Elementary OS, Pop!_OS, ...\n    •  Envie de customizer à mort ? Arch Linux, Alpine, Manjaro, Debian\n    •  Quelque chose de professionel ? CentOS\n    •  Un simple server ? OpenSUSE\n    •  15 MB ? Alpine, Tiny Core (docker only)\n    •  Raspberry PI ? Raspbian\n    •  Pentest ONLY ? Kali Linux\n    •  Envie de se suicider ? \"Free Software Fondation OS\"\n    •  Pire que la mort ? Linux From Scratch\n    •  Faire ressuciter un Android en serveur Linux ? postmarketOS\n\n"),
        "DualbootLoc_customizeHeader": MessageLookupByLibrary.simpleMessage(
            "La customization n\'est pas limitée. Observez quelles distributions convient le mieux :\n"),
        "DualbootLoc_header":
            MessageLookupByLibrary.simpleMessage("L\'art du Dual Boot"),
        "DualbootLoc_infos": MessageLookupByLibrary.simpleMessage(
            "Seules les grandes phases sont montrées. Pour plus d\'informations :"),
        "DualbootLoc_installContent": MessageLookupByLibrary.simpleMessage(
            "    •  Langue, Timezone, Network...\n    •  Configuration du disque manuel (conseillé)\n    •  Dans l\'ordre : \n           •  \"/dev/sda1\" monté sur \"/\" en ext4, Taille de la partition Linux\n           •  \"/dev/sda2\" étant le SWAP, Taille = 1.5 * RAM si hibernation, sinon Taille = 1 / 4 * RAM\n    •  Le GRUB (boot loader) doit être installé à côté de Windows ! (en MBR, sinon ignorez)\n    •  Vérifiez et confirmez les partitions (regardez si windows est toujours là 🙂)\n    •  Etc (attendez la fin de l\'installation)...\n    •  (UEFI) Changez l\'ordre de boot UEFI dans le BIOS\n\n"),
        "DualbootLoc_installHeader": MessageLookupByLibrary.simpleMessage(
            "Installer Linux (booter sur la clé en changeant l\'ordre de boot sur le BIOS ou via une touche de clavier (F11? Suppr? Insert? F1? F2? F12?)) :\n"),
        "DualbootLoc_issue1Content": MessageLookupByLibrary.simpleMessage(
            "Généralement, si l\'ordinateur est équipée d\'une gestion graphique hybride, Linux n\'arrivera pas à boot.\nSolution : \n    •  Ajoutez \"nomodeset\" dans les options avancées de boot\n    •  Enlevez également \"quiet splash\" pour la lisibilité\n\nEx:"),
        "DualbootLoc_issue2Content1": MessageLookupByLibrary.simpleMessage(
            "    Par défaut, Linux va tourner avec Intel. Ce qui est très mauvais si vous voulez miner de l\'ethereum ou faire du Machine Learning.\n"),
        "DualbootLoc_issue2Content2": MessageLookupByLibrary.simpleMessage(
            "    •  Téléchargez les pilotes de NVIDIA sur le site officiel de NVIDIA.\n    •  (Téléchargez CUDA si nécessaire, sans pilotes, sans openGL)\n    •  Passer en TTY via Ctrl + Alt + F1, Ctrl + Alt + F2 ... "),
        "DualbootLoc_issue2Content3": MessageLookupByLibrary.simpleMessage(
            "Si jamais le port HDMI ne marche plus en BIOS Legacy sur Windows :"),
        "DualbootLoc_prepContent": MessageLookupByLibrary.simpleMessage(
            "    •  Windows\n    •  Clé USB 4 Go\n    •  Connaitre le type de BIOS : UEFI ou Legacy\n    •  Désactiver le Secure Boot\n    •  Désactiver le Fast Boot\n    •  Préparer une partition vide de minimum 50 Go\n    •  Avec Rufus, flashez une image sur la clé (FAT32, mettre à jour syslinux, mode ISO), en MBR\n\n"),
        "DualbootLoc_prepHeader":
            MessageLookupByLibrary.simpleMessage("Préparations :\n"),
        "DualbootLoc_risksContent": MessageLookupByLibrary.simpleMessage(
            "    •  Linux est plus stable, mais les mises à jours de distributions sont plus fragiles (80 % des utilisateurs de Ubuntu préfère réinstaller que mettre à jour)\n    •  Les pilotes sont les premières causes de crash brutal (NVIDIA, Realtek...)\n    •  Une mauvaise config du BIOS peut également vous être fatal\n\n"),
        "DualbootLoc_risksHeader": MessageLookupByLibrary.simpleMessage(
            "Prenez conscience des risques d\'installer Linux :\n"),
        "ImprimanteLoc_header":
            MessageLookupByLibrary.simpleMessage("Configurer l\'imprimante"),
        "ImprimanteLoc_linuxContent1": MessageLookupByLibrary.simpleMessage(
            "    -  Ajoutez smb://192.168.130.2/imprimantes-gcp aux imprimantes réseaux\n    -  Pilote: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd"),
        "ImprimanteLoc_linuxContent2": MessageLookupByLibrary.simpleMessage(
            "    -  Accedez à http://localhost:631/admin (nom de compte et mot de passe linux)\n    -  Onglet \"Administration\"\n    -  \"Add Printer\"\n    -  Type SMB, addresse smb://192.168.130.2/imprimantes-gcp\n    -  Utilisez le fichier PPD : https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd\n    -  Configurez la suite et ça devrait-être ok"),
        "ImprimanteLoc_pukContent": MessageLookupByLibrary.simpleMessage(
            "Utilisez l\'application de Minitel > Apps > Imprimante"),
        "ImprimanteLoc_windowsContent": MessageLookupByLibrary.simpleMessage(
            "    -  Ouvrir \\\\192.168.130.2 avec l\'explorer Windows\n    -  Mettre prenom.nom et mot de passe (testez également EMSE2000\\prenom.nom)\n    -  Double-cliquer sur \"imprimantes-gpc\""),
        "LoginLoc_domainNameContent1": MessageLookupByLibrary.simpleMessage(
            "Choisir entre fw-cgcp.emse.fr, 10.163.0.2 et 195.83.139.7\n"),
        "LoginLoc_domainNameContent2": MessageLookupByLibrary.simpleMessage(
            "Si le réseau local supporte un DNS, tel que 192.168.130.33 (DSI) ou 10.163.0.6 (Minitel), vous pouvez tenter fw-cgcp.emse.fr.\nSi le réseau est celui de Minitel (WiFi Minitel), utilisez 10.163.0.2\n"),
        "LoginLoc_domainNameContent3": MessageLookupByLibrary.simpleMessage(
            "Généralement, 195.83.139.7 convient dans 90 % des cas.\nIl s\'agit de l\'addresse IP publique du portail, et est autorisé par la passerelle.\n"),
        "LoginLoc_header":
            MessageLookupByLibrary.simpleMessage("Authentification"),
        "MailLoc_header":
            MessageLookupByLibrary.simpleMessage("Importation des mails Sogo"),
        "MailLoc_mailContent1": MessageLookupByLibrary.simpleMessage(
            "Avec votre application mail préférée, utilisez la configuration manuelle et remplissez les champs correspondant."),
        "MailLoc_mailContent2": MessageLookupByLibrary.simpleMessage(
            "Email : prenom.nom@etu.emse.fr\nMot de passe : ton mot de passe école\n\nServeur entrant : IMAP\nNom d\'hote : messel.emse.fr\nPort : 993\nSécurité : ssl/tls\nMéthode d\'authentification : mot de passe normal\nIdentifiant : prenom.nom (⚠️ sans le @etu.emse.fr)\n\nServeur sortant :\nNom d\'hôte : messel.emse.fr\nPort : 465\nSécurité : ssl/tls\nMéthode d\'authentification : mot de passe normal\nIdentifiant : prenom.nom (⚠️ sans le @etu.emse.fr)"),
        "NewsLoc_seeFacebook":
            MessageLookupByLibrary.simpleMessage("Voir sur Facebook ..."),
        "NewsLoc_title": MessageLookupByLibrary.simpleMessage("Nouveautés"),
        "NotificationSettingsLoc_early1":
            MessageLookupByLibrary.simpleMessage("Notifier "),
        "NotificationSettingsLoc_early2":
            MessageLookupByLibrary.simpleMessage(" minutes avant le cours."),
        "NotificationSettingsLoc_enabled1":
            MessageLookupByLibrary.simpleMessage("Les notifications sont "),
        "NotificationSettingsLoc_enabled2": m0,
        "NotificationSettingsLoc_range1":
            MessageLookupByLibrary.simpleMessage("Notifier les cours des "),
        "NotificationSettingsLoc_range2":
            MessageLookupByLibrary.simpleMessage(" prochains jours."),
        "NotificationSettingsLoc_save":
            MessageLookupByLibrary.simpleMessage("Sauvegarder"),
        "NotificationSettingsLoc_title":
            MessageLookupByLibrary.simpleMessage("Paramètres de notifications"),
        "PortalLoc_authTime":
            MessageLookupByLibrary.simpleMessage("Durée d\'authentification "),
        "PortalLoc_autoLogin": MessageLookupByLibrary.simpleMessage(
            "Se connecter automatiquement"),
        "PortalLoc_domainNameHeader":
            MessageLookupByLibrary.simpleMessage("Nom de domaine / IP"),
        "PortalLoc_login": MessageLookupByLibrary.simpleMessage("Se connecter"),
        "PortalLoc_password":
            MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "PortalLoc_rememberMe":
            MessageLookupByLibrary.simpleMessage("Se souvenir "),
        "PortalLoc_statusInHM": m1,
        "PortalLoc_statusInMinutes": m2,
        "PortalLoc_statusInSeconds": m3,
        "PortalLoc_title":
            MessageLookupByLibrary.simpleMessage("Authentification"),
        "PortalLoc_usernameHint":
            MessageLookupByLibrary.simpleMessage("prenom.nom"),
        "PortalLoc_usernameLabel":
            MessageLookupByLibrary.simpleMessage("Nom d\'utilisateur"),
        "ReportingLoc_chamberHint":
            MessageLookupByLibrary.simpleMessage("Numero de chambre"),
        "ReportingLoc_chamberLabel":
            MessageLookupByLibrary.simpleMessage("Chambre"),
        "ReportingLoc_forceName":
            MessageLookupByLibrary.simpleMessage("Nom ET Prénom"),
        "ReportingLoc_idHint":
            MessageLookupByLibrary.simpleMessage("Nom Prénom"),
        "ReportingLoc_idLabel":
            MessageLookupByLibrary.simpleMessage("Identité"),
        "ReportingLoc_notEmpty":
            MessageLookupByLibrary.simpleMessage("Ne doit pas être vide"),
        "ReportingLoc_share": MessageLookupByLibrary.simpleMessage("Partager"),
        "ReportingLoc_slack":
            MessageLookupByLibrary.simpleMessage("Notifier sur Slack"),
        "ReportingLoc_title":
            MessageLookupByLibrary.simpleMessage("Signaler Minitel"),
        "ReportingLoc_titleHint":
            MessageLookupByLibrary.simpleMessage("J\'ai plus internet !"),
        "ReportingLoc_titleLabel":
            MessageLookupByLibrary.simpleMessage("Titre"),
        "TutorialLoc_content1": MessageLookupByLibrary.simpleMessage(
            "1. Connectez-vous à \'WiFi Minitel\'"),
        "TutorialLoc_content2": MessageLookupByLibrary.simpleMessage(
            "2. Lancez la suite de diagnostique en appuyant sur le bouton, et attendez 1 minute."),
        "TutorialLoc_content3": MessageLookupByLibrary.simpleMessage(
            "3. Remplissez votre rapport. N\'oubliez pas un moyen de communication (chambre, mail, messenger ...)"),
        "TutorialLoc_content4": MessageLookupByLibrary.simpleMessage(
            "4. Connectez-vous sur un réseau où il y a Internet."),
        "TutorialLoc_content5":
            MessageLookupByLibrary.simpleMessage("5. Envoyez le rapport."),
        "TutorialLoc_example": MessageLookupByLibrary.simpleMessage(
            "Exemple : \nTitre: Pas Internet depuis Lundi.\nDescription: Je perds fréquemment la connexion lorsque je suis sur Ethernet. Le Wifi, c\'est ok."),
        "TutorialLoc_header": MessageLookupByLibrary.simpleMessage(
            "Comment signaler sans internet ?"),
        "TutorialLoc_notice": MessageLookupByLibrary.simpleMessage(
            "REMARQUE : Il est recommandé d\'installer le Root et Busybox."),
        "VMLoc_customizeContent": MessageLookupByLibrary.simpleMessage(
            "    -  Utile pour avoir une sandbox et faire plein de tests.\n    -  Utile pour s\'entraîner à Linux (WM, DM, pilotes, installations...), sans faire péter son dual boot.\n    -  Utile pour faire un VPS.\n    -  Utile pour faire un compilateur avec un environnement dédié et protégé.\n\n"),
        "VMLoc_customizeHeader": MessageLookupByLibrary.simpleMessage(
            "Une VM c\'est donc fait pour être trafiqué à mort :\n"),
        "VMLoc_definitionContent": MessageLookupByLibrary.simpleMessage(
            "    Une Machine dont les composants sont émulées.\n    Une Machine qui est strictement isolée de l\'hôte.\n    Comme les composants sont émulées, les chances de crash d\'une VM sont largement moins faibles\n\n"),
        "VMLoc_definitionHeader":
            MessageLookupByLibrary.simpleMessage("Une VM, c\'est :\n"),
        "VMLoc_envContent": MessageLookupByLibrary.simpleMessage(
            "    -  Pour Linux : Docker, (Container Linux, c-à-d. environnement dédié par application) (Notez que ça marche aussi sur Windows parce que ça tourne une VM Linux sur Hyper-V en arrière plan.)\n    -  Pour Windows : Windows Subsystem for Linux 1 (Kernel Linux natif. Attention, le matériel n\'est pas émulé !)\n    -  Pour Windows : Windows Subsystem for Linux 2 (+ Docker) (Kernel Linux dans une micro-VM. Extrêmement rapide et RAM dynamiquement alloué.)\n"),
        "VMLoc_envHeader": MessageLookupByLibrary.simpleMessage(
            "Si il s\'agit d\'avoir un simple environnement de développement :\n"),
        "VMLoc_hypervisorContent": MessageLookupByLibrary.simpleMessage(
            "    1.  [Leader] Hyper-V (type 1, Windows, si possible)\n    2.  [Visionary] KVM (type 1, Linux, 👍 Android)\n    3.  [Leader] VMWare Workstation (type 2, 👍 pour les réseaux, GNS3 et tout le reste)\n    4.  [Niche Player] VirtualBox (type 2)\n    5.  [Leader] VMware ESXi (type 1, pour les professionnels)\n\n"),
        "VMLoc_hypervisorHeader": MessageLookupByLibrary.simpleMessage(
            "Voici l\'ordre de préférence d\'un Hyperviseur :\n"),
        "VMLoc_installContent": MessageLookupByLibrary.simpleMessage(
            "    -  Création d\'un disque virtuel > 20 Go\n    -  Insertion d\'une image Linux dans le port CD émulé\n    -  Installation de Linux (similaire à un dual boot)\n    -  Configuration d\'un accès SSH/telnet/RDP\n"),
        "VMLoc_installHeader": MessageLookupByLibrary.simpleMessage(
            "Cela va sans dire qu\'il est inutile pour une VM d\'avoir une interface graphique.\nTrès souvent, une connexion SSH est mise en place au lieu d\'utiliser l\'interface graphique ou TTY.\n\nGénéralement, l\'installation d\'une VM est rapide et simple :\n"),
        "VMLoc_vmTypeContent": MessageLookupByLibrary.simpleMessage(
            "    -  Type I : Bare Metal, l\'OS est lui-même l\'hyperviseur.\n    -  Type II : Hosted, l\'hyperviseur est hébergé par l\'OS hôte.\n\n"),
        "VMLoc_vmTypeHeader": MessageLookupByLibrary.simpleMessage(
            "Certains hyperviseurs (VirtualBox, VMWare, Hyper-V) sont même équipés de fonctions d\'installation rapide.\n\nCela permet également de s\'entraîner aux dual boot 😄.\n\nTypes de VM :\n"),
        "forceDark":
            MessageLookupByLibrary.simpleMessage("Forcer le thème sombre")
      };
}
