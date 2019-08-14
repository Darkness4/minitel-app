import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';

class VirtMachineDoc extends StatelessWidget {
  const VirtMachineDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          BoxMdH("Virtual Machines", 1),
          Text.rich(
            TextSpan(
              style: MinitelTextStyles.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "Une VM, c'est :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "    Une Machine dont les composants sont émulées.\n",
                      style: MinitelTextStyles.body1,
                    ),
                    TextSpan(
                      text:
                          "    Une Machine qui est strictement isolée de l'hôte.\n",
                      style: MinitelTextStyles.body1,
                    ),
                    TextSpan(
                      text:
                          "    Comme les composants sont émulées, les chances de "
                          "crash d'une VM sont largement moins faibles\n\n",
                      style: MinitelTextStyles.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text: "Une VM c'est donc fait pour être trafiqué à mort :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "    -  Utile pour avoir une sandbox et faire plein de tests.\n"
                          "    -  Utile pour s'entraîner à Linux (WM, DM, pilotes, installations...), sans faire péter son dual boot.\n"
                          "    -  Utile pour faire un VPS.\n"
                          "    -  Utile pour faire un compilateur avec un environnement dédié et protégé.\n\n",
                    ),
                  ],
                ),
                TextSpan(
                  text: "Une VM c'est donc pas fait pour programmer.\n\n"
                      "Généralement, une VM a généralement un unique objectif.\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "Exemple: VM1 = Alpine DHCP, VM2 = Alpine DNS, VM3 = GUI Test, VM4 = Router IOSv.\n\n",
                      style: MinitelTextStyles.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text:
                      "Cela va sans dire qu'il est inutile pour une VM d'avoir une interface graphique.\n"
                      "Très souvent, une connexion SSH est mise en place au lieu d'utiliser l'interface graphique ou TTY.\n\n"
                      "Généralement, l'installation d'une VM est rapide et simple :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text: "    -  Création d'un disque virtuel > 20 Go\n"
                          "    -  Insertion d'une image Linux dans le port CD émulé\n"
                          "    -  Installation de Linux (similaire à un dual boot)\n"
                          "    -  Configuration d'un accès SSH/telnet/RDP\n",
                    ),
                  ],
                ),
                TextSpan(
                  text:
                      "Certains hyperviseurs (VirtualBox, VMWare, Hyper-V) sont même équipés de fonctions d'installation rapide.\n\n"
                      "Cela permet également de vous entraîner aux installations dual boot 😄.\n\n"
                      "Types de VM :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "    -  Type I : Bare Metal, l'OS est lui-même l'hyperviseur.\n"
                          "    -  Type II : Hosted, l'hyperviseur est hébergé par l'OS hôte.\n\n",
                      style: MinitelTextStyles.body1,
                    ),
                  ],
                ),
                TextSpan(
                  text: "Voici l'ordre de préférence d'un Hyperviseur :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "    1.  [Leader] Hyper-V (type 1, Windows, si possible)\n"
                          "    2.  [Visionary] KVM (type 1, Linux, 👍 Android)\n"
                          "    3.  [Leader] VMWare Workstation (type 2, 👍 pour les réseaux, GNS3 et tout le reste)\n"
                          "    4.  [Niche Player] VirtualBox (type 2)\n"
                          "    5.  [Leader] VMware ESXi (type 1, pour les professionnels)\n\n",
                    ),
                  ],
                ),
                TextSpan(
                  text:
                      "Si il s'agit d'avoir un simple environnement de développement :\n",
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "    -  Pour Linux : Docker, (Container Linux, c-à-d. environnement dédié par application) (Notez que ça marche aussi sur Windows parce que ça tourne une VM Linux sur Hyper-V en arrière plan.)\n"
                          "    -  Pour Windows : Windows Subsystem for Linux 1 (Kernel Linux natif. Attention, le matériel n'est pas émulé !)\n"
                          "    -  Pour Windows : Windows Subsystem for Linux 2 (+ Docker) (Kernel Linux dans une micro-VM. Extrêmement rapide et RAM dynamiquement alloué.)\n",
                      style: MinitelTextStyles.body1,
                    ),
                  ],
                ),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
