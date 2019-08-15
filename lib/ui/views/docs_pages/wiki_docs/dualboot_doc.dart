import 'package:flutter/material.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class DualBootDoc extends StatelessWidget {
  const DualBootDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          const BoxMdH("L'art du Dual Boot", 1),
          const Text(
            "Seules les grandes phases sont montrées. Pour plus d'informations :",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Center(
            child: RaisedButton(
              child: const Text("Full Tutorial Dual Boot"),
              onPressed: LaunchURL.dualBootTutorial,
            ),
          ),
          const Text.rich(
            TextSpan(
              style: MinitelTextStyles.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "Prenez conscience des risques d'installer Linux :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "    •  Linux est plus stable, mais les mises à jours de distributions sont plus fragiles (80 % des utilisateurs de Ubuntu préfère réinstaller que mettre à jour)\n"
                          "    •  Les pilotes sont les premières causes de crash brutal (NVIDIA, Realtek...)\n"
                          "    •  Une mauvaise config du BIOS peut également vous être fatal\n\n",
                      style: MinitelTextStyles.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text:
                      "La customization n'est pas limitée. Observez quelles distributions convient le mieux :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
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
                      style: MinitelTextStyles.body1,
                    )
                  ],
                ),
                TextSpan(
                  text: "Préparations :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text: "    •  Windows\n"
                          "    •  Clé USB 4 Go\n"
                          "    •  Connaitre le type de BIOS : UEFI ou Legacy\n"
                          "    •  Désactiver le Secure Boot\n"
                          "    •  Désactiver le Fast Boot\n"
                          "    •  Préparer une partition vide de minimum 50 Go\n"
                          "    •  Avec Rufus, flashez une image sur la clé (FAT32, mettre à jour syslinux, mode ISO), en MBR\n\n",
                      style: MinitelTextStyles.body1,
                    )
                  ],
                ),
                TextSpan(
                  text:
                      "Installer Linux (booter sur la clé en changeant l'ordre de boot sur le BIOS ou via une touche de clavier (F11? Suppr? Insert? F1? F2? F12?)) :\n",
                  style: MinitelTextStyles.body2,
                  children: <TextSpan>[
                    TextSpan(
                      text: "    •  Langue, Timezone, Network...\n"
                          "    •  Configuration du disque manuel (conseillé)\n"
                          "    •  Dans l'ordre : \n"
                          "           •  \"/dev/sda1\" monté sur \"/\" en ext4, Taille de la partition Linux\n"
                          "           •  \"/dev/sda2\" étant le SWAP, Taille = 1.5 * RAM si hibernation, sinon Taille = 1 / 4 * RAM\n"
                          "    •  Le GRUB (boot loader) doit être installé à côté de Windows ! (en MBR, sinon ignorez)\n"
                          "    •  Vérifiez et confirmez les partitions (regardez si windows est toujours là 🙂)\n"
                          "    •  Etc (attendez la fin de l'installation)...\n"
                          "    •  (UEFI) Changez l'ordre de boot UEFI dans le BIOS\n\n",
                      style: MinitelTextStyles.body1,
                    )
                  ],
                ),
                TextSpan(
                  text: "Known Issue : NVIDIA + Intel Graphics:\n",
                  style: MinitelTextStyles.body2,
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Généralement, si l'ordinateur est équipée d'une gestion graphique hybride, Linux n'arrivera pas à boot.\n"
                          "Solution : \n"
                          "    •  Ajoutez \"nomodeset\" dans les options avancées de boot\n"
                          "    •  Enlevez également \"quiet splash\" pour la lisibilité\n"
                          "\nEx:",
                      style: MinitelTextStyles.body1,
                    )
                  ],
                ),
              ],
            ),
          ),
          const LogCard(
            "linux /boot/vmlinuz-2.6.31-9 root=UUID=904bf39-9234 ro nomodeset\n",
            title: "GNU GRUB",
          ),
          const Text.rich(
            TextSpan(
              text: "Known Issue : Post-Install (NVIDIA + Intel Graphics) :\n",
              style: MinitelTextStyles.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "    Par défaut, Linux va tourner avec Intel. Ce qui "
                      "est très mauvais si vous voulez miner de l'ethereum ou "
                      "faire du Machine Learning.\n",
                  style: MinitelTextStyles.body1,
                ),
                TextSpan(
                  text:
                      "    •  Téléchargez les pilotes de NVIDIA sur le site officiel de NVIDIA.\n"
                      "    •  (Téléchargez CUDA si nécessaire, sans pilotes, sans openGL)\n"
                      "    •  Passer en TTY via Ctrl + Alt + F1, Ctrl + Alt + F2 ... ",
                  style: MinitelTextStyles.body1,
                ),
              ],
            ),
          ),
          const LogCard(
            "sudo service lightdm stop  # ou gdm, gdm3, lxdm",
            title: "Shell - Arrêtez le Display Manager",
          ),
          const LogCard(
            "sudo nano /etc/init/gpu-manager.conf  # Ce n'est pas grave si il n'existe pas",
            title: "Shell - Commentez tout le contenu",
          ),
          const LogCard(
            "sudo prime-select nvidia   # Ce n'est pas grave si cela ne marche pas",
            title: "Shell - Sélectionner la carte NVIDIA",
          ),
          const LogCard(
            "sudo nano /etc/modprobe.d/blacklist-nouveau.conf",
            title: "Shell - Blacklistez les pilotes non officiels de NVIDIA",
          ),
          const LogCard(
            """blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off""",
            title: "nano /etc/modprobe.d/blacklist-nouveau.conf",
          ),
          const LogCard(
            """sudo update-initramfs -u""",
            title: "Shell - Mettez à jour les configs",
          ),
          const LogCard(
            "sudo bash ./NVIDIA-*.run --no-opengl-files",
            title: "Shell - Installez les pilotes NVIDIA",
          ),
          const LogCard(
            "sudo bash ./cuda_*_linux.run  # Sans OpenGL, avec CUDA Toolkit",
            title: "Shell - Installez CUDA (si machine learning)",
          ),
          const Text(
              "Si jamais le port HDMI ne marche plus en BIOS Legacy sur Windows :"),
          const LogCard(
            "sudo nano /etc/default/grub",
            title: "Shell - Changez le Grub",
          ),
          const LogCard(
            """GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_HIDDEN_TIMEOUT=5
GRUB_HIDDEN_TIMEOUT_QUIET=false
GRUB_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT=\"\"
GRUB_TERMINAL=console""",
            title: "nano /etc/default/grub - Changez le Grub",
          ),
          const LogCard(
            "sudo update-grub",
            title: "Shell - Mettre à jour le Grub",
          ),
          const Text.rich(
            TextSpan(
              text: "Changez de GNU/Linux ou pas...\n",
              style: MinitelTextStyles.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "    •  Généralement, on ne change pas de Linux. S'il "
                      "manque de la customization, cherchez \"Comment "
                      "customiser un Display Manager(DM), ou un Window "
                      "Manager (WM)\". Cherchez \"Comment customiser un "
                      "terminal\" et testez les configs sur une VM\n"
                      "    •  Envie de hacker ? Les outils de Kali Linux sont "
                      "téléchargeables indépendaments de l'OS\n"
                      "    •  LTS ? Généralement les LTS sont beaucoup plus stables\n"
                      "    •  Egalement, 80 % des utilisateurs de Ubuntu préfèrent"
                      " réinstaller que faire un dist-upgrade.\n",
                  style: MinitelTextStyles.body1,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
