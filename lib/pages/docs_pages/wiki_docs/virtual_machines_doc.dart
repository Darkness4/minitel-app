import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:flutter/material.dart';

class VirtMachineDoc extends StatelessWidget {
  const VirtMachineDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Text(
            "Virtual Machines",
            style: Theme.of(context).textTheme.display1,
          ),
          Text.rich(
            TextSpan(
              text: "Une VM, c'est :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "    Une Machine dont les composants sont émulées.\n",
                  style: Theme.of(context).textTheme.body1,
                ),
                TextSpan(
                  text:
                      "    Une Machine qui est strictement isolée de l'hôte.\n",
                  style: Theme.of(context).textTheme.body1,
                ),
                TextSpan(
                  text: "    Comme les composants sont émulées, les chances de "
                      "crash d'une VM sont largement moins faibles qu'un "
                      "système réel pour deux raisons:\n"
                      "    -  Les pilotes sont toujours à jour\n"
                      "    -  Le matériel est toujours fonctionnel\n",
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Une VM c'est donc fait pour être trafiqué à mort :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text:
                      "    -  Utile pour avoir une sandbox et faire plein de tests.\n"
                      "    -  Utile pour customizer l'interface graphique.\n"
                      "    -  Utile pour faire des VM de VM de Docker de Docker.\n"
                      "    -  Utile pour faire un VPS.\n",
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
          Text(
            "Une VM c'est donc PAS fait pour calculer.\n",
            style: Theme.of(context).textTheme.body2,
          ),
          Text(
            "Généralement, une VM a généralement un unique objectif.\n",
            style: Theme.of(context).textTheme.body2,
          ),
          Text(
            "Exemple: VM1 = Alpine DHCP, VM2 = Alpine DNS, VM3 = Switch, VM4 = Router IOSv.\n",
          ),
          Text(
            "Cela va sans dire qu'une VM n'est pas censé avoir d'interface graphique sauf pour customizer l'interface.\n",
            style: Theme.of(context).textTheme.body2,
          ),
          Text.rich(
            TextSpan(
              text:
                  "Généralement, l'installation d'une VM est rapide et simple :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "    -  Création d'un disque virtuel > 20 Go\n"
                      "    -  Insertion d'une image Linux dans le port CD émulé\n"
                      "    -  Installation de Linux classique (proche d'un dual boot)\n"
                      "    -  Configuration d'un accès SSH/telnet/RDP\n",
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
          Text(
            "Cela peut permettre de vous entraîner aux installations dual boot 😄.\n",
            style: Theme.of(context).textTheme.body1,
          ),
          Text.rich(
            TextSpan(
              text: "Gardez donc en tête :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "    -  Maltraitez votre VM\n"
                      "    -  Tuez plein de VM\n"
                      "    -  N'aimez pas de VM\n"
                      "    -  Sinon, aimez une VM, puis trompez-la\n"
                      "    -  Installez 50 VMs\n",
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Les types :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text:
                      "    -  Type I : Bare Metal, l'OS est lui-même l'hyperviseur.\n"
                      "    -  Type II : Hosted, l'hyperviseur est hébergé par l'OS hôte.\n",
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Voici l'ordre de préférence d'un Hyperviseur :\n",
              style: Theme.of(context).textTheme.body2,
              children: <TextSpan>[
                TextSpan(
                  text: "    1.  Hyper-V (type 1, Windows, et si possible)\n"
                      "    2.  KVM (type 1, Linux, pour émuler un appareil Android)\n"
                      "    3.  VMWare Workstation (type 2, pour les réseaux, GNS3 et tout le reste)\n"
                      "    4.  VirtualBox (type 2, parce que Hyper-V, ça marche pas et vous savez pas cr*cker VMWare)\n"
                      "    5.  VMware ESXi (type 1, pour les professionnels)",
                  style: Theme.of(context).textTheme.body2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
