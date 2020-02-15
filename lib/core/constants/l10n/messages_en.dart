// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  static m0(enabled) => "${Intl.select(enabled, {
        'true': 'enabled.',
        'false': 'disabled.',
      })}";

  static m1(hours, minutes) => "${hours} hours and ${minutes} minutes left";

  static m2(minutes) => "${minutes} minutes left";

  static m3(seconds) => "${seconds} seconds left";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function>{
        "AboutLoc_description": MessageLookupByLibrary.simpleMessage(
            "Minitel Toolbox includes the most useful tools to have a trouble-free WiFi."),
        "AboutLoc_developper":
            MessageLookupByLibrary.simpleMessage("Developer"),
        "AboutLoc_lastVestion":
            MessageLookupByLibrary.simpleMessage("Lastest version"),
        "AboutLoc_license": MessageLookupByLibrary.simpleMessage("License"),
        "AboutLoc_privacyPolicySubtitle": MessageLookupByLibrary.simpleMessage(
            "No data is shared and stored without your knowledge. The data collected is the data you provide us (diagnostic) and is never saved."),
        "AboutLoc_privacyPolicyTitle":
            MessageLookupByLibrary.simpleMessage("Privacy Policy"),
        "AboutLoc_title":
            MessageLookupByLibrary.simpleMessage("About Minitel Toolbox"),
        "AboutLoc_website": MessageLookupByLibrary.simpleMessage("Website"),
        "AgendaLoc_emptyAgenda0":
            MessageLookupByLibrary.simpleMessage("Well ? No class ?"),
        "AgendaLoc_emptyAgenda1":
            MessageLookupByLibrary.simpleMessage("\'smells like a barbecue..."),
        "AgendaLoc_emptyAgenda2":
            MessageLookupByLibrary.simpleMessage("Freeedom !"),
        "AgendaLoc_emptyAgenda3":
            MessageLookupByLibrary.simpleMessage("Lucky m8 !"),
        "AgendaLoc_emptyAgenda4": MessageLookupByLibrary.simpleMessage(
            "Spend more time with the family!\n(instead of watching the next classes)"),
        "AgendaLoc_emptyAgenda5": MessageLookupByLibrary.simpleMessage(
            "The application has more than 10,000 lines of code...\n\n(with 40,000 additions and 30,000 deletions)"),
        "AgendaLoc_emptyAgenda6": MessageLookupByLibrary.simpleMessage(
            "The application is developed with Flutter and ❤️"),
        "AgendaLoc_emptyAgenda7":
            MessageLookupByLibrary.simpleMessage("Minitel is the best!"),
        "AgendaLoc_emptyAgenda8":
            MessageLookupByLibrary.simpleMessage("Freeeeeeedom !"),
        "AgendaLoc_emptyAgenda9":
            MessageLookupByLibrary.simpleMessage("The sad panda sit alone."),
        "AgendaLoc_title": MessageLookupByLibrary.simpleMessage("Calendar"),
        "AppListLoc_portal": MessageLookupByLibrary.simpleMessage("Portal"),
        "AppListLoc_printer": MessageLookupByLibrary.simpleMessage("Printer"),
        "DiagnoseLoc_arpContent1": MessageLookupByLibrary.simpleMessage(
            "Displays the MAC addresses of all devices connected to the phone. The Gateway should be displayed and the MAC address should be 00-0d-b4-10-99-e1. If the MAC address of the gateway does not match that of the gateway, we are dealing with a fisonning ARP: \n"),
        "DiagnoseLoc_arpContent2": MessageLookupByLibrary.simpleMessage(
            "The gateway\'s IP thief responds to the ARP response sent by the victim on broadcast, faster than the gateway.\n\n"),
        "DiagnoseLoc_arpContent3": MessageLookupByLibrary.simpleMessage(
            "A temporary solution (only when WiFi is on) is:"),
        "DiagnoseLoc_header": MessageLookupByLibrary.simpleMessage("Diagnosis"),
        "DiagnoseLoc_httpContent": MessageLookupByLibrary.simpleMessage(
            "If a 4xx or 5xx error appears, please report it to Minitel."),
        "DiagnoseLoc_ipaContent": MessageLookupByLibrary.simpleMessage(
            "Gives useful information about the hardware.\n\nUseful information:\n- Status\n- IP Address\n- MAC Address"),
        "DiagnoseLoc_nsLookupContent1": MessageLookupByLibrary.simpleMessage(
            "If there is no answer, but the DNS ping works, your device has a DNS cache problem.\n"),
        "DiagnoseLoc_nsLookupContent2": MessageLookupByLibrary.simpleMessage(
            "For portable devices, restart Wi-Fi.\nHere are some solutions:"),
        "DiagnoseLoc_pingDNSContent": MessageLookupByLibrary.simpleMessage(
            "If one of the DNS (except 10.163.0.6) answers, you are connected to the Internet."),
        "DiagnoseLoc_pingGatewayContent": MessageLookupByLibrary.simpleMessage(
            "The gateway normally ignores pings. However, if a ping is received, someone probably took his IP. But, nothing is certain."),
        "DiagnoseLoc_pingLoContent1": MessageLookupByLibrary.simpleMessage(
            "Checks if the TCP/IP software is working.\n"),
        "DiagnoseLoc_pingLoContent2":
            MessageLookupByLibrary.simpleMessage("Should always be positive."),
        "DiagnoseLoc_pingLocalContent1": MessageLookupByLibrary.simpleMessage(
            "Ping to a local computer (10.163.0.5, which is the Minitel server and should always be on).\n\nIf the packets are lost, these are the most likely scenarios:\n    1.  You don\'t have an IP."),
        "DiagnoseLoc_pingLocalContent2": MessageLookupByLibrary.simpleMessage(
            " (See ip a, and alert Minitel immediately)\n"),
        "DiagnoseLoc_pingLocalContent3": MessageLookupByLibrary.simpleMessage(
            "    2.  You are not connected to the local network.\n    3.  The server (10.163.0.5) is disconnected. (you can ping 10.163.0.10)\n    4.  A switch from the Student House is disconnected.\n    5.  A switch from the residence is disconnected."),
        "DiagnoseLoc_reactionContent": MessageLookupByLibrary.simpleMessage(
            "If there is no longer a network, contact Minitel and use the diagnostic suite on the \"Report to Minitel\" page"),
        "DiagnoseLoc_reactionHeader":
            MessageLookupByLibrary.simpleMessage("How should I react?"),
        "DiagnoseLoc_tracerouteContent": MessageLookupByLibrary.simpleMessage(
            "Displays the path and delays of packets to a Google server.\nUseful to see the causes of lag."),
        "DocsLoc_minitel": MessageLookupByLibrary.simpleMessage(
            "The network association of the residence: if you need equipment (cables, computer,...), to ask questions about the functioning of the machines at school or if you have problems with your computer, it is us that you should contact!\n\nOne of Minitel\'s main activities is the maintenance of the home\'s Internet network: this means a constant effort to improve (new equipment, monitoring...) the speed and reliability of your connection.\n\nWe also offer you various training courses throughout the year that can help you during the courses, or simply satisfy your curiosity in computer science!\n\nFinally, we attach great importance to the animation of student life on campus! To do this, we organize several computer events, such as the Nuit de l\'Info or video game tournaments!\n\nIf you would like to know more about the association and the digital life of the residence, do not hesitate to contact one of the Minitel members: we will be happy to help you and answer all your questions."),
        "DocsLoc_title": MessageLookupByLibrary.simpleMessage("Documentation"),
        "DualbootLoc_changeLinuxContent": MessageLookupByLibrary.simpleMessage(
            "    •  Generally, we don\'t change Linux. If customization is missing, look for \"How to customize a Display Manager (DM), or a Window Manager (WM)\". Look for \"How to customize a terminal\" and test the configurations on a VM.\n    •  Want to hack? Kali Linux tools are downloadable independently of the OS\n    •  LTS? In general, LTSs are much more stable\n    •  Also, 80% of Ubuntu users prefer to reinstall rather than do a dist-upgrade.\n"),
        "DualbootLoc_changeLinuxHeader": MessageLookupByLibrary.simpleMessage(
            "Change GNU/Linux or not....\n"),
        "DualbootLoc_customizeContent": MessageLookupByLibrary.simpleMessage(
            "    •  First time? Lubuntu LTS (at worst Kubuntu) or Linux Mint\n    •  Second time? Know the difference between KDE, Gnome, XFCE, LXDE, MATE, awesomewm...And check out r/unixporn\n    •  Something stylish and already done? MX Linux, deepin, Linux Lite, Elementary OS, Pop!_OS, ...\n    •  Want to customize to death? Arch Linux, Alpine, Manjaro, Debian\n    •  Something professional? CentOS\n    •  A simple server? OpenSUSE\n    •  15 MB ? Alpine, Tiny Core (docker only)\n    •  Raspberry PI ? Raspbian\n    •  Pentest ONLY ? Kali Linux\n    •  Want to commit suicide? \"Free Software Fondation OS\"\n    •  Worse than death ? Linux From Scratch\n    •  Bringing an Android back to life as a Linux server? postmarketOS\n\n"),
        "DualbootLoc_customizeHeader": MessageLookupByLibrary.simpleMessage(
            "Customization is not limited. Observe which distributions are most appropriate:\n"),
        "DualbootLoc_header":
            MessageLookupByLibrary.simpleMessage("The art of Dual Boot"),
        "DualbootLoc_infos": MessageLookupByLibrary.simpleMessage(
            "Only the main phases are shown. For more information:"),
        "DualbootLoc_installContent": MessageLookupByLibrary.simpleMessage(
            "    •  Language, Timezone, Network...\n    •  Manual disc configuration (recommended)\n    •  In this order : \n           •  \"/dev/sda1\" mount on \"/\" with ext4, Partition Size Linux\n           •  \"/dev/sda2\" is the SWAP, Size = 1.5 * RAM with hibernation, otherwise Size = 1 / 4 * RAM\n    •  The GRUB (bootloader) must be installed alongside Windows ! (in MBR, else ignore)\n    •  Check and confirm the partitions (check if windows is still there 🙂)\n    •  Etc (wait until the installation is complete)...\n    •  (UEFI) Change the UEFI boot order in the BIOS\n\n"),
        "DualbootLoc_installHeader": MessageLookupByLibrary.simpleMessage(
            "Install Linux (boot on the key by changing the boot order on the BIOS or via a keyboard key (F11? Delete? Insert? F1? F2? F12?)) :\n"),
        "DualbootLoc_issue1Content": MessageLookupByLibrary.simpleMessage(
            "Generally, if the computer is equipped with hybrid graphics management, Linux will not boot.\nSolution : \n    •  Add \"nomodeset\" in the advanced boot options\n    •  Also remove \"quiet splash\" for readability\n\nEx:"),
        "DualbootLoc_issue2Content1": MessageLookupByLibrary.simpleMessage(
            "    By default, Linux will run with Intel. Which is very bad if you want to mine ethereum or do Machine Learning.\n"),
        "DualbootLoc_issue2Content2": MessageLookupByLibrary.simpleMessage(
            "    •  Download NVIDIA drivers from the official NVIDIA website.\n    •  (Download CUDA if necessary, without drivers, without openGL)\n    •  Switch to TTY via Ctrl + Alt + F1, Ctrl + Alt + F2 ... "),
        "DualbootLoc_issue2Content3": MessageLookupByLibrary.simpleMessage(
            "If the HDMI port no longer works in BIOS Legacy on Windows:"),
        "DualbootLoc_prepContent": MessageLookupByLibrary.simpleMessage(
            "    •  Windows\n    •  USB Key 4 GB\n    •  Know the type of BIOS : UEFI ou Legacy\n    •  Disable Secure Boot\n    •  Prepare an empty partition of at least 50 GB\n    •  With Rufus, flash an image on the key (FAT32, update syslinux, ISO mode), in MBR\n\n"),
        "DualbootLoc_prepHeader":
            MessageLookupByLibrary.simpleMessage("Preparations :\n"),
        "DualbootLoc_risksContent": MessageLookupByLibrary.simpleMessage(
            "    •  Linux is more stable, but distribution updates are more fragile (80% of Ubuntu users prefer to reinstall rather than update)\n    •  Drivers are the first causes of sudden crashes (NVIDIA, Realtek...)\n    •  A wrong BIOS configuration can also be fatal for you\n\n"),
        "DualbootLoc_risksHeader": MessageLookupByLibrary.simpleMessage(
            "Be aware of the risks of installing Linux:\n"),
        "ImprimanteLoc_header":
            MessageLookupByLibrary.simpleMessage("Configuring the printer"),
        "ImprimanteLoc_linuxContent1": MessageLookupByLibrary.simpleMessage(
            "    -  Add smb://192.168.130.2/imprimantes-gcp to network printers\n    -  Driver: https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd"),
        "ImprimanteLoc_linuxContent2": MessageLookupByLibrary.simpleMessage(
            "    -  Go to http://localhost:631/admin (linux account name and password)\n    -  The tab \"Administration\"\n    -  \"Add Printer\"\n    -  Type SMB, address smb://192.168.130.2/imprimantes-gcp\n    -  Use the PPD file : https://www.openprinting.org/download/PPD/Ricoh/PS/Ricoh-MP_C3004_PS.ppd\n    -  Configure the rest and it should be okay"),
        "ImprimanteLoc_pukContent": MessageLookupByLibrary.simpleMessage(
            "Use the Minitel application > Apps > Printer"),
        "ImprimanteLoc_windowsContent": MessageLookupByLibrary.simpleMessage(
            "    -  Open \\\\192.168.130.2 with Windows Explorer\n    -  Enter full name and password (also test EMSE2000\\firstname.lastname)\n    -  Double-click on \"imprimantes-gpc\""),
        "LoginLoc_domainNameContent1": MessageLookupByLibrary.simpleMessage(
            "Choose between fw-cgcp.emse.fr, 10.163.0.2 and 195.83.139.7\n"),
        "LoginLoc_domainNameContent2": MessageLookupByLibrary.simpleMessage(
            "If the local network supports a DNS, such as 192.168.130.33 (DSI) or 10.163.0.6 (Minitel), you can try fw-cgcp.emse.fr.\nIf the network is Minitel (WiFi Minitel), use 10.163.0.2\n"),
        "LoginLoc_domainNameContent3": MessageLookupByLibrary.simpleMessage(
            "Generally, 195.83.139.7 is suitable in 90% of cases.\nThis is the public IP address of the portal, and is authorized by the gateway.\n"),
        "LoginLoc_header":
            MessageLookupByLibrary.simpleMessage("Authentication"),
        "MailLoc_header":
            MessageLookupByLibrary.simpleMessage("Importing Sogo emails"),
        "MailLoc_mailContent1": MessageLookupByLibrary.simpleMessage(
            "With your favorite email application, use the manual configuration and fill in the corresponding fields."),
        "MailLoc_mailContent2": MessageLookupByLibrary.simpleMessage(
            "Email: firstname.lastname@etu.emse.fr\nPassword: your school password\n\nIncoming server: IMAP\nHost name: messel.emse.fr\nPort: 993\nSecurity: ssl/tls\nAuthentication method: standard password\nIdentifier: firstname.lastname (⚠️ without @etu.emse.fr)\n\nOutgoing server:\nHost name: messel.emse.fr\nPort: 465\nSecurity: ssl/tls\nuthentication method: standard password\nIdentifier: firstname.lastname (⚠️ without @etu.emse.fr)"),
        "NewsLoc_seeTwitter":
            MessageLookupByLibrary.simpleMessage("See on Twitter ..."),
        "NewsLoc_title": MessageLookupByLibrary.simpleMessage("News"),
        "NotificationSettingsLoc_early1":
            MessageLookupByLibrary.simpleMessage("Notify "),
        "NotificationSettingsLoc_early2":
            MessageLookupByLibrary.simpleMessage(" minutes before the course."),
        "NotificationSettingsLoc_enabled1":
            MessageLookupByLibrary.simpleMessage("The notifications are "),
        "NotificationSettingsLoc_enabled2": m0,
        "NotificationSettingsLoc_range1": MessageLookupByLibrary.simpleMessage(
            "Notify the courses for the next "),
        "NotificationSettingsLoc_range2":
            MessageLookupByLibrary.simpleMessage(" days."),
        "NotificationSettingsLoc_save":
            MessageLookupByLibrary.simpleMessage("Save"),
        "NotificationSettingsLoc_title":
            MessageLookupByLibrary.simpleMessage("Notification settings"),
        "PortalLoc_authTime":
            MessageLookupByLibrary.simpleMessage("Authentication time "),
        "PortalLoc_autoLogin":
            MessageLookupByLibrary.simpleMessage("Login automatically"),
        "PortalLoc_domainNameHeader":
            MessageLookupByLibrary.simpleMessage("Domain name / IP "),
        "PortalLoc_login": MessageLookupByLibrary.simpleMessage("Login"),
        "PortalLoc_password": MessageLookupByLibrary.simpleMessage("Password"),
        "PortalLoc_rememberMe":
            MessageLookupByLibrary.simpleMessage("Remember me "),
        "PortalLoc_statusInHM": m1,
        "PortalLoc_statusInMinutes": m2,
        "PortalLoc_statusInSeconds": m3,
        "PortalLoc_title":
            MessageLookupByLibrary.simpleMessage("Authentication"),
        "PortalLoc_usernameHint":
            MessageLookupByLibrary.simpleMessage("firstname.lastname"),
        "PortalLoc_usernameLabel":
            MessageLookupByLibrary.simpleMessage("Username"),
        "ReportingLoc_chamberHint":
            MessageLookupByLibrary.simpleMessage("Room number"),
        "ReportingLoc_chamberLabel":
            MessageLookupByLibrary.simpleMessage("Room"),
        "ReportingLoc_idHint":
            MessageLookupByLibrary.simpleMessage("Last name First name"),
        "ReportingLoc_idLabel":
            MessageLookupByLibrary.simpleMessage("Identity"),
        "ReportingLoc_isNotValidUid": MessageLookupByLibrary.simpleMessage(
            "The username must be in the format \'firstname.lastname\'."),
        "ReportingLoc_mustOnlyBeNumbers":
            MessageLookupByLibrary.simpleMessage("Must only contain numbers."),
        "ReportingLoc_notEmpty":
            MessageLookupByLibrary.simpleMessage("Must not be empty"),
        "ReportingLoc_share": MessageLookupByLibrary.simpleMessage("Share"),
        "ReportingLoc_slack":
            MessageLookupByLibrary.simpleMessage("Notify on Slack"),
        "ReportingLoc_title":
            MessageLookupByLibrary.simpleMessage("Report to Minitel"),
        "ReportingLoc_titleHint": MessageLookupByLibrary.simpleMessage(
            "I don\'t have internet anymore!"),
        "ReportingLoc_titleLabel":
            MessageLookupByLibrary.simpleMessage("Title"),
        "TutorialLoc_content1": MessageLookupByLibrary.simpleMessage(
            "1. Log in to \'WiFi Minitel\'."),
        "TutorialLoc_content2": MessageLookupByLibrary.simpleMessage(
            "2. Start the diagnostic sequence by pressing the button, and wait 1 minute."),
        "TutorialLoc_content3": MessageLookupByLibrary.simpleMessage(
            "3. Fill out your report. Do not forget a means of communication (room, mail, messenger...)"),
        "TutorialLoc_content4": MessageLookupByLibrary.simpleMessage(
            "4. Connect to a network where there is Internet."),
        "TutorialLoc_content5":
            MessageLookupByLibrary.simpleMessage("5. Send the report."),
        "TutorialLoc_example": MessageLookupByLibrary.simpleMessage(
            "Example: \nTitle: Not Internet since Monday. \nDescription: I frequently lose the connection when I\'m on Ethernet. Wifi is okay."),
        "TutorialLoc_header": MessageLookupByLibrary.simpleMessage(
            "How to report without the Internet?"),
        "TutorialLoc_notice": MessageLookupByLibrary.simpleMessage(
            "NOTE: It is recommended to install the Root and Busybox."),
        "VMLoc_customizeContent": MessageLookupByLibrary.simpleMessage(
            "    -  Useful for having a sandbox and doing lots of tests.\n    -  Useful for training on Linux (WM, DM, drivers, installations...), without blowing up your dual boot.\n    -  Useful for making a VPS.\n    -  Useful for using a compiler with a dedicated and protected environment.\n\n"),
        "VMLoc_customizeHeader": MessageLookupByLibrary.simpleMessage(
            "A VM is therefore made to be tampered to death:\n"),
        "VMLoc_definitionContent": MessageLookupByLibrary.simpleMessage(
            "    A Machine whose components are emulated.\n    A Machine that is strictly isolated from the host.\n    As the components are emulated, the chances of a VM crash are much lower.\n\n"),
        "VMLoc_definitionHeader":
            MessageLookupByLibrary.simpleMessage("A VM is:\n"),
        "VMLoc_envContent": MessageLookupByLibrary.simpleMessage(
            "    -  For Linux: Docker, (Container Linux, cioè ambiente dedicato per applicazione) (Note that it also works on Windows because it runs a Linux VM on Hyper-V in the background.)\n    -  For Windows: Windows Subsystem for Linux 1 (Kernel Linux native, be careful, the hardware is not emulated!)\n    -  For Windows: Windows Subsystem for Linux 2 (+ Docker) (Kernel Linux in a micro-VM. Extremely fast and dynamically allocated RAM.)\n"),
        "VMLoc_envHeader": MessageLookupByLibrary.simpleMessage(
            "If it is a question of having a simple development environment:\n"),
        "VMLoc_hypervisorContent": MessageLookupByLibrary.simpleMessage(
            "    1.  [Leader] Hyper-V (type 1, Windows, if possible)\n    2.  [Visionary] KVM (type 1, Linux, 👍 Android)\n    3.  [Leader] VMWare Workstation (type 2, 👍 for networks, GNS3 and everything else)\n    4.  [Niche Player] VirtualBox (type 2)\n    5.  [Leader] VMware ESXi (type 1, for professionals)\n\n"),
        "VMLoc_hypervisorHeader": MessageLookupByLibrary.simpleMessage(
            "Here is the order of preference of a Hypervisor:\n"),
        "VMLoc_installContent": MessageLookupByLibrary.simpleMessage(
            "    -  Creating a virtual disk > 20 GB\n    -  Inserting a Linux image into the emulated CD port\n    -  Linux installation (similar to a dual boot)\n    -  Configuring SSH/telnet/RDP access\n"),
        "VMLoc_installHeader": MessageLookupByLibrary.simpleMessage(
            "It goes without saying that it is useless for a VM to have a graphical interface.\nVery often, an SSH connection is set up instead of using the graphical user interface or TTY.\n\nGenerally, the installation of a VM is quick and easy:\n"),
        "VMLoc_vmTypeContent": MessageLookupByLibrary.simpleMessage(
            "    -  Type I : Bare Metal, the OS is itself the hypervisor.\n    -  Type II : Hosted, the hypervisor is hosted by the host OS.\n\n"),
        "VMLoc_vmTypeHeader": MessageLookupByLibrary.simpleMessage(
            "Some hypervisors (VirtualBox, VMWare, Hyper-V) are even equipped with quick installation functions.\n\nThis also allows you to practice dual boot 😄.\n\nTypes of VMs:\n"),
        "forceDark": MessageLookupByLibrary.simpleMessage("Force Dark Theme")
      };
}
