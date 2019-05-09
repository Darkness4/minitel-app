import 'package:flutter/material.dart';
import 'package:minitel_toolbox/components/cards.dart';

class MinitelDoc extends StatelessWidget {
  const MinitelDoc({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DocCard(
        children: <Widget>[
          Text(
            "Minitel",
            style: Theme.of(context).textTheme.display2,
          ),
          Image.asset('assets/icon/icon.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
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
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
