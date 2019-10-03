import 'package:intl/intl.dart';

class DocsLoc {
  final String localeName;
  final DiagnoseLoc diagnose;
  final LoginLoc login;
  final DualbootLoc dualboot;
  final ImprimanteLoc imprimante;
  final MailLoc mail;
  final VMLoc vm;
  DocsLoc(this.localeName)
      : diagnose = DiagnoseLoc(localeName),
        login = LoginLoc(localeName),
        dualboot = DualbootLoc(localeName),
        imprimante = ImprimanteLoc(localeName),
        mail = MailLoc(localeName),
        vm = VMLoc(localeName);

  String get title => Intl.message(
        'Documentation',
        name: 'DocsLoc_title',
        locale: localeName,
      );

  String get minitel => Intl.message(
        "L’asso réseau de la rez’ : si tu as besoin de matériel "
        "(câbles, ordi,...), de poser des ques-tions sur le fonctionnement "
        "des machines à l’école ou si tu rencontres des problèmes avec ton "
        "ordinateur, c’est à nous qu’il faut s’adresser !\n\n"
        "L’une des occupations principales de Minitel est l’entretien du "
        "réseau Internet de la résidence : cela se traduit par un effort "
        "constant dans l’amélioration (nouveaux équipements, monitoring...) "
        "du débit et de la fiabilité de ta connexion.\n\n"
        "Nous te proposons également tout au long de l’année des "
        "formations variées qui pourront t’aider lors des cours, ou bien "
        "simplement satisfaire ta curiosité en informatique !\n\n"
        "Enfin, nous attachons une grande importance à l’animation de la vie "
        "étudiante du campus ! Pour cela, nous organisons plusieurs "
        "événements informatiques, comme la Nuit de l’Info ou encore des "
        "tournois de jeux vidéo !\n\n"
        "Si tu souhaites en savoir plus à propos de l’asso et de la vie "
        "numérique de la rez’, n’hésite pas à contacter l’un des membres de "
        "Minitel : nous serons ravis de pouvoir t’aider et répondre à toutes "
        "tes questions",
        name: 'DocsLoc_minitel',
        locale: localeName,
      );
}

class DiagnoseLoc {
  final String localeName;
  const DiagnoseLoc(this.localeName);

  String get header => Intl.message(
        "Diagnostique",
        name: 'DiagnoseLoc_header',
        locale: localeName,
      );

  String get ipaContent => Intl.message(
        "Donne des informations utiles sur le matériel.\n\n"
        "Informations utiles:\n"
        "- Status\n"
        "- Adresse IP\n"
        "- Adresse MAC",
        name: 'DiagnoseLoc_ipaContent',
        locale: localeName,
      );

  String get arpContent1 => Intl.message(
        "Affiche les adresses MAC de tous les appareils "
        "connectés au téléphone.\n\n"
        "La Passerelle devrait être affiché et l\'adresse"
        " MAC doit être 00-0d-b4-10-99-e1.\n\n"
        "Si l'adresse MAC de la passerelle ne correspond pas "
        "à celui de la passerelle, on a affaire à une ARP "
        "poisonning : \n",
        name: 'DiagnoseLoc_arpContent1',
        locale: localeName,
      );

  String get arpContent2 => Intl.message(
        "Le voleur d'IP de la passerelle répond à la réponse "
        "ARP envoyé en broadcast par la victime, plus "
        "rapidement que la passerelle.\n\n",
        name: 'DiagnoseLoc_arpContent2',
        locale: localeName,
      );

  String get arpContent3 => Intl.message(
        "Une solution temporaire (uniquement lorsque le "
        "WiFi est allumé) est :",
        name: 'DiagnoseLoc_arpContent3',
        locale: localeName,
      );

  String get tracerouteContent => Intl.message(
        "Affiche le chemin et les délais des paquets vers un serveur Google.\n"
        "Utile pour voir les causes de lag.",
        name: 'DiagnoseLoc_tracerouteContent',
        locale: localeName,
      );

  String get pingLoContent1 => Intl.message(
        "Vérifie si le logiciel TCP/IP fonctionne.\n",
        name: 'DiagnoseLoc_pingLoContent1',
        locale: localeName,
      );

  String get pingLoContent2 => Intl.message(
        "Devrait être toujours positif.",
        name: 'DiagnoseLoc_pingLoContent2',
        desc: "Le ping loopback devrait être toujours positif.",
        locale: localeName,
      );

  String get pingLocalContent1 => Intl.message(
        "Ping à un ordinateur local (10.163.0.5, qui est le "
        "serveur Minitel et devrait être toujours allumé).\n\n"
        "Si les paquets sont perdus, ceci sont les scenarios les plus probable:\n"
        "    1.  Vous n\'avez pas d\'IP.",
        name: 'DiagnoseLoc_pingLocalContent1',
        locale: localeName,
      );

  String get pingLocalContent2 => Intl.message(
        " (Voir ip a, et alertez immediatement à Minitel)\n",
        name: 'DiagnoseLoc_pingLocalContent2',
        locale: localeName,
      );

  String get pingLocalContent3 => Intl.message(
        "    2.  Vous n\'êtes pas connecté au réseau local.\n"
        "    3.  Le serveur (10.163.0.5) est déconnecté. (vous pouvez ping 10.163.0.10)\n"
        "    4.  Un switch de la Maison des Elèves est déconnecté.\n"
        "    5.  Un switch de la résidence est déconnecté.",
        name: 'DiagnoseLoc_pingLocalContent3',
        locale: localeName,
      );

  String get httpContent => Intl.message(
        "Si une erreur 4xx ou 5xx apparait, veuillez le signaler à Minitel.",
        name: 'DiagnoseLoc_httpContent',
        locale: localeName,
      );

  String get reactionHeader => Intl.message(
        "Comment devrais-je réagir?",
        name: 'DiagnoseLoc_reactionHeader',
        locale: localeName,
      );

  String get reactionContent => Intl.message(
        "S'il n'y a plus de réseau, contactez Minitel et "
        "utilisez la suite diagnostique dans la page"
        " \"Signaler Minitel\"",
        name: 'DiagnoseLoc_reactionContent',
        locale: localeName,
      );

  String get pingGatewayContent => Intl.message(
        "La passerelle ignore normalement les pings."
        " Cependant, si un ping est reçu, quelqu\'un a probablement"
        " pris sont IP. Mais, rien est certain.",
        name: 'DiagnoseLoc_pingGatewayContent',
        locale: localeName,
      );

  String get pingDNSContent => Intl.message(
        "Si un des DNS (sauf 10.163.0.6) répond, vous êtes connecté à Internet.",
        name: 'DiagnoseLoc_pingDNSContent',
        locale: localeName,
      );

  String get nsLookupContent1 => Intl.message(
        "S\'il n\'y a aucune réponse, mais le ping DNS fonctionne, votre appareil a un problème de cache DNS.\n",
        name: 'DiagnoseLoc_nsLookupContent1',
        locale: localeName,
      );

  String get nsLookupContent2 => Intl.message(
        "Pour les appareils portable, redémarrez le Wifi.\n"
        "Voici des solutions proposées:",
        name: 'DiagnoseLoc_nsLookupContent2',
        locale: localeName,
      );
}

class LoginLoc {
  final String localeName;
  const LoginLoc(this.localeName);

  String get header => Intl.message(
        "Authentification",
        name: 'LoginLoc_header',
        locale: localeName,
      );

  String get domainNameContent1 => Intl.message(
        "Choisir entre fw-cgcp.emse.fr, 10.163.0.2 et 195.83.139.7\n",
        name: 'LoginLoc_domainNameContent1',
        locale: localeName,
      );

  String get domainNameContent2 => Intl.message(
        "Si le réseau local supporte un DNS, tel que "
        "192.168.130.33 (DSI) ou 10.163.0.6 (Minitel), vous "
        "pouvez tenter fw-cgcp.emse.fr.\n"
        "Si le réseau est celui de Minitel (WiFi Minitel), "
        "utilisez 10.163.0.2\n",
        name: 'LoginLoc_domainNameContent2',
        locale: localeName,
      );

  String get domainNameContent3 => Intl.message(
        "Généralement, 195.83.139.7 convient dans 90 % des cas.\n"
        "Il s'agit de l'addresse IP publique du portail, et est "
        "autorisé par la passerelle.\n",
        name: 'LoginLoc_domainNameContent3',
        locale: localeName,
      );
}

class DualbootLoc {
  final String localeName;
  const DualbootLoc(this.localeName);

  String get header => Intl.message(
        "L'art du Dual Boot",
        name: 'DualbootLoc_header',
        locale: localeName,
      );
  String get infos => Intl.message(
        "Seules les grandes phases sont montrées. Pour plus d'informations :",
        name: 'DualbootLoc_infos',
        locale: localeName,
      );

  String get risksHeader => Intl.message(
        "Prenez conscience des risques d'installer Linux :\n",
        name: 'DualbootLoc_risksHeader',
        locale: localeName,
      );

  String get risksContent => Intl.message(
        "    •  Linux est plus stable, mais les mises à jours de distributions sont plus fragiles (80 % des utilisateurs de Ubuntu préfère réinstaller que mettre à jour)\n"
        "    •  Les pilotes sont les premières causes de crash brutal (NVIDIA, Realtek...)\n"
        "    •  Une mauvaise config du BIOS peut également vous être fatal\n\n",
        name: 'DualbootLoc_risksContent',
        locale: localeName,
      );

  String get customizeHeader => Intl.message(
        "La customization n'est pas limitée. Observez quelles distributions convient le mieux :\n",
        name: 'DualbootLoc_customizeHeader',
        locale: localeName,
      );

  String get customizeContent => Intl.message(
        "    •  Première fois ? Lubuntu LTS (au pire Kubuntu) ou Linux Mint\n"
        "    •  Deuxième fois ? Connaissez la différence entre KDE, Gnome, XFCE, LXDE, MATE, awesomewm...Et allez voir r/unixporn\n"
        "    •  Quelque chose de stylé et déjà fait ? MX Linux, deepin, Linux Lite, Elementary OS, Pop!_OS, ...\n"
        "    •  Envie de customizer à mort ? Arch Linux, Alpine, Manjaro, Debian\n"
        "    •  Quelque chose de professionel ? CentOS\n"
        "    •  Un simple server ? OpenSUSE\n"
        "    •  15 MB ? Alpine, Tiny Core (docker only)\n"
        "    •  Raspberry PI ? Raspbian\n"
        "    •  Pentest ONLY ? Kali Linux\n"
        "    •  Envie de se suicider ? \"Free Software Fondation OS\"\n"
        "    •  Pire que la mort ? Linux From Scratch\n"
        "    •  Faire ressuciter un Android en serveur Linux ? postmarketOS\n\n",
        name: 'DualbootLoc_customizeContent',
        locale: localeName,
      );
  String get prepHeader => Intl.message(
        "Préparations :\n",
        name: 'DualbootLoc_prepHeader',
        locale: localeName,
      );
  String get prepContent => Intl.message(
        "    •  Windows\n"
        "    •  Clé USB 4 Go\n"
        "    •  Connaitre le type de BIOS : UEFI ou Legacy\n"
        "    •  Désactiver le Secure Boot\n"
        "    •  Désactiver le Fast Boot\n"
        "    •  Préparer une partition vide de minimum 50 Go\n"
        "    •  Avec Rufus, flashez une image sur la clé (FAT32, mettre à jour syslinux, mode ISO), en MBR\n\n",
        name: 'DualbootLoc_prepContent',
        locale: localeName,
      );
  String get installHeader => Intl.message(
        "Installer Linux (booter sur la clé en changeant l'ordre de boot sur le BIOS ou via une touche de clavier (F11? Suppr? Insert? F1? F2? F12?)) :\n",
        name: 'DualbootLoc_installHeader',
        locale: localeName,
      );
  String get installContent => Intl.message(
        "    •  Langue, Timezone, Network...\n"
        "    •  Configuration du disque manuel (conseillé)\n"
        "    •  Dans l'ordre : \n"
        "           •  \"/dev/sda1\" monté sur \"/\" en ext4, Taille de la partition Linux\n"
        "           •  \"/dev/sda2\" étant le SWAP, Taille = 1.5 * RAM si hibernation, sinon Taille = 1 / 4 * RAM\n"
        "    •  Le GRUB (boot loader) doit être installé à côté de Windows ! (en MBR, sinon ignorez)\n"
        "    •  Vérifiez et confirmez les partitions (regardez si windows est toujours là 🙂)\n"
        "    •  Etc (attendez la fin de l'installation)...\n"
        "    •  (UEFI) Changez l'ordre de boot UEFI dans le BIOS\n\n",
        name: 'DualbootLoc_installContent',
        locale: localeName,
      );
  String get issue1Content => Intl.message(
        "Généralement, si l'ordinateur est équipée d'une gestion graphique hybride, Linux n'arrivera pas à boot.\n"
        "Solution : \n"
        "    •  Ajoutez \"nomodeset\" dans les options avancées de boot\n"
        "    •  Enlevez également \"quiet splash\" pour la lisibilité\n"
        "\nEx:",
        name: 'DualbootLoc_issue1Content',
        locale: localeName,
      );
  String get issue2Content1 => Intl.message(
        "    Par défaut, Linux va tourner avec Intel. Ce qui "
        "est très mauvais si vous voulez miner de l'ethereum ou "
        "faire du Machine Learning.\n",
        name: 'DualbootLoc_issue2Content1',
        locale: localeName,
      );
  String get issue2Content2 => Intl.message(
        "    •  Téléchargez les pilotes de NVIDIA sur le site officiel de NVIDIA.\n"
        "    •  (Téléchargez CUDA si nécessaire, sans pilotes, sans openGL)\n"
        "    •  Passer en TTY via Ctrl + Alt + F1, Ctrl + Alt + F2 ... ",
        name: 'DualbootLoc_issue2Content2',
        locale: localeName,
      );

  String get issue2Content3 => Intl.message(
        "Si jamais le port HDMI ne marche plus en BIOS Legacy sur Windows :",
        name: 'DualbootLoc_issue2Content3',
        locale: localeName,
      );

  String get changeLinuxHeader => Intl.message(
        "Changez de GNU/Linux ou pas...\n",
        name: 'DualbootLoc_changeLinuxHeader',
        locale: localeName,
      );

  String get changeLinuxContent => Intl.message(
        "    •  Généralement, on ne change pas de Linux. S'il "
        "manque de la customization, cherchez \"Comment "
        "customiser un Display Manager(DM), ou un Window "
        "Manager (WM)\". Cherchez \"Comment customiser un "
        "terminal\" et testez les configs sur une VM\n"
        "    •  Envie de hacker ? Les outils de Kali Linux sont "
        "téléchargeables indépendaments de l'OS\n"
        "    •  LTS ? Généralement les LTS sont beaucoup plus stables\n"
        "    •  Egalement, 80 % des utilisateurs de Ubuntu préfèrent"
        " réinstaller que faire un dist-upgrade.\n",
        name: 'DualbootLoc_changeLinuxContent',
        locale: localeName,
      );
}

class ImprimanteLoc {
  final String localeName;
  const ImprimanteLoc(this.localeName);

  String get header => Intl.message(
        "Configurer l'imprimante",
        name: 'ImprimanteLoc_header',
        locale: localeName,
      );

  String get windowsContent => Intl.message(
        """    -  Ouvrir \\\\192.168.130.2 avec l'explorer Windows
    -  Mettre prenom.nom et mot de passe (testez également EMSE2000\\prenom.nom)
    -  Double-cliquer sur \"imprimantes-gpc\"""",
        name: 'ImprimanteLoc_windowsContent',
        locale: localeName,
      );

  String get linuxContent1 => Intl.message(
        """    -  Ajoutez smb://192.168.130.2/imprimantes-gcp aux imprimantes réseaux
    -  Pilote: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd""",
        name: 'ImprimanteLoc_linuxContent1',
        locale: localeName,
      );

  String get linuxContent2 => Intl.message(
        "    -  Accedez à http://localhost:631/admin (nom de compte et mot de passe linux)\n"
        "    -  Onglet \"Administration\"\n"
        "    -  \"Add Printer\"\n"
        "    -  Type SMB, addresse smb://192.168.130.2/imprimantes-gcp\n"
        "    -  Utilisez le fichier PPD : https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd\n"
        "    -  Configurez la suite et ça devrait-être ok",
        name: 'ImprimanteLoc_linuxContent2',
        locale: localeName,
      );

  String get pukContent => Intl.message(
        "Utilisez l'application de Minitel > Apps > Imprimante",
        name: 'ImprimanteLoc_pukContent',
        locale: localeName,
      );
}

class MailLoc {
  final String localeName;
  const MailLoc(this.localeName);

  String get header => Intl.message(
        "Importation des mails Sogo",
        name: 'MailLoc_header',
        locale: localeName,
      );

  String get mailContent1 => Intl.message(
        "Avec votre application mail préférée, utilisez la configuration "
        "manuelle et remplissez les champs correspondant.",
        name: 'MailLoc_mailContent1',
        locale: localeName,
      );

  String get mailContent2 => Intl.message(
        """Email : prenom.nom@etu.emse.fr
Mot de passe : ton mot de passe école

Serveur entrant : IMAP
Nom d'hote : messel.emse.fr
Port : 993
Sécurité : ssl/tls
Méthode d'authentification : mot de passe normal
Identifiant : prenom.nom (⚠️ sans le @etu.emse.fr)

Serveur sortant :
Nom d'hôte : messel.emse.fr
Port : 465
Sécurité : ssl/tls
Méthode d'authentification : mot de passe normal
Identifiant : prenom.nom (⚠️ sans le @etu.emse.fr)""",
        name: 'MailLoc_mailContent2',
        locale: localeName,
      );
}

class VMLoc {
  final String localeName;
  const VMLoc(this.localeName);

  String get definitionHeader => Intl.message(
        "Une VM, c'est :\n",
        name: 'VMLoc_definitionHeader',
        locale: localeName,
      );

  String get definitionContent => Intl.message(
        "    Une Machine dont les composants sont émulées.\n"
        "    Une Machine qui est strictement isolée de l'hôte.\n"
        "    Comme les composants sont émulées, les chances de "
        "crash d'une VM sont largement moins faibles\n\n",
        name: 'VMLoc_definitionContent',
        locale: localeName,
      );
  String get customizeHeader => Intl.message(
        "Une VM c'est donc fait pour être trafiqué à mort :\n",
        name: 'VMLoc_customizeHeader',
        locale: localeName,
      );
  String get customizeContent => Intl.message(
        "    -  Utile pour avoir une sandbox et faire plein de tests.\n"
        "    -  Utile pour s'entraîner à Linux (WM, DM, pilotes, installations...), sans faire péter son dual boot.\n"
        "    -  Utile pour faire un VPS.\n"
        "    -  Utile pour faire un compilateur avec un environnement dédié et protégé.\n\n",
        name: 'VMLoc_customizeContent',
        locale: localeName,
      );
  String get installHeader => Intl.message(
        "Cela va sans dire qu'il est inutile pour une VM d'avoir une interface graphique.\n"
        "Très souvent, une connexion SSH est mise en place au lieu d'utiliser l'interface graphique ou TTY.\n\n"
        "Généralement, l'installation d'une VM est rapide et simple :\n",
        name: 'VMLoc_installHeader',
        locale: localeName,
      );
  String get installContent => Intl.message(
        "    -  Création d'un disque virtuel > 20 Go\n"
        "    -  Insertion d'une image Linux dans le port CD émulé\n"
        "    -  Installation de Linux (similaire à un dual boot)\n"
        "    -  Configuration d'un accès SSH/telnet/RDP\n",
        name: 'VMLoc_installContent',
        locale: localeName,
      );
  String get vmTypeHeader => Intl.message(
        "Certains hyperviseurs (VirtualBox, VMWare, Hyper-V) sont même équipés de fonctions d'installation rapide.\n\n"
        "Cela permet également de s'entraîner aux dual boot 😄.\n\n"
        "Types de VM :\n",
        name: 'VMLoc_vmTypeHeader',
        locale: localeName,
      );
  String get vmTypeContent => Intl.message(
        "    -  Type I : Bare Metal, l'OS est lui-même l'hyperviseur.\n"
        "    -  Type II : Hosted, l'hyperviseur est hébergé par l'OS hôte.\n\n",
        name: 'VMLoc_vmTypeContent',
        locale: localeName,
      );
  String get hypervisorHeader => Intl.message(
        "Voici l'ordre de préférence d'un Hyperviseur :\n",
        name: 'VMLoc_hypervisorHeader',
        locale: localeName,
      );
  String get hypervisorContent => Intl.message(
        "    1.  [Leader] Hyper-V (type 1, Windows, si possible)\n"
        "    2.  [Visionary] KVM (type 1, Linux, 👍 Android)\n"
        "    3.  [Leader] VMWare Workstation (type 2, 👍 pour les réseaux, GNS3 et tout le reste)\n"
        "    4.  [Niche Player] VirtualBox (type 2)\n"
        "    5.  [Leader] VMware ESXi (type 1, pour les professionnels)\n\n",
        name: 'VMLoc_hypervisorContent',
        locale: localeName,
      );
  String get envHeader => Intl.message(
        "Si il s'agit d'avoir un simple environnement de développement :\n",
        name: 'VMLoc_envHeader',
        locale: localeName,
      );
  String get envContent => Intl.message(
        "    -  Pour Linux : Docker, (Container Linux, c-à-d. environnement dédié par application) (Notez que ça marche aussi sur Windows parce que ça tourne une VM Linux sur Hyper-V en arrière plan.)\n"
        "    -  Pour Windows : Windows Subsystem for Linux 1 (Kernel Linux natif. Attention, le matériel n'est pas émulé !)\n"
        "    -  Pour Windows : Windows Subsystem for Linux 2 (+ Docker) (Kernel Linux dans une micro-VM. Extrêmement rapide et RAM dynamiquement alloué.)\n",
        name: 'VMLoc_envContent',
        locale: localeName,
      );
}
