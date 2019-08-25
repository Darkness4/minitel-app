import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/viewmodels/views/reporting_view_model.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/docs_widgets.dart';

class ReportTab extends StatelessWidget {
  final ReportingViewModel model;

  const ReportTab({
    @required this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            _ReportCard(model: model),
            const _TutorialCard(),
            const _ContactsCard(),
          ],
        ),
      ),
    );
  }
}

/// Shows all possible ways of communication to Minitel.
class _ContactsCard extends StatelessWidget {
  const _ContactsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DocCard(
      elevation: 4,
      children: <Widget>[
        const BoxMdH("Contacts", 1),
        FlatButton(
          textColor: Colors.blueAccent,
          onPressed: LaunchURL.messengerMarcNGUYEN,
          color: Colors.lightBlue[100],
          child: Text(
            "Facebook: Minitel Ismin",
            style: MinitelTextStyles.mdH3.apply(color: Colors.blueAccent),
          ),
        ),
        FlatButton(
          textColor: Colors.blueAccent,
          onPressed: LaunchURL.mailToMinitel,
          color: Colors.lightBlue[100],
          child: Text(
            "Mail: minitelismin@gmail.com (non recommandée)",
            style: MinitelTextStyles.mdH3.apply(color: Colors.blueAccent),
          ),
        ),
        const Text(
          "G*: Contact Admin",
          style: MinitelTextStyles.mdH3,
        ),
      ],
    );
  }
}

/// This is the form needed to be filled.
class _ReportCard extends StatelessWidget {
  final ReportingViewModel model;

  const _ReportCard({
    @required this.model,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: model.formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      key: const Key('report_tab/room'),
                      controller: model.roomController,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      focusNode: model.roomFocusNode,
                      textInputAction: TextInputAction.next,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Chambre",
                        hintText: "Numero de chambre",
                      ),
                      autovalidate: true,
                      onFieldSubmitted: (String term) {
                        model.roomFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(model.nameFocusNode);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Ne doit pas être vide';
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      key: const Key('report_tab/name'),
                      controller: model.nameController,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      focusNode: model.nameFocusNode,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        labelText: "Identité",
                        hintText: "Nom Prénom",
                      ),
                      autovalidate: true,
                      onFieldSubmitted: (String term) {
                        model.nameFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(model.titleFocusNode);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Ne doit pas être vide';
                        } else if (!value.contains(' ')) {
                          return 'Nom ET Prénom';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              TextFormField(
                key: const Key('report_tab/title'),
                controller: model.titleController,
                style: const TextStyle(fontWeight: FontWeight.bold),
                focusNode: model.titleFocusNode,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  labelText: "Titre",
                  hintText: "J'ai plus internet !",
                ),
                onFieldSubmitted: (String term) {
                  model.titleFocusNode.unfocus();
                  FocusScope.of(context)
                      .requestFocus(model.descriptionFocusNode);
                },
                autovalidate: true,
                validator: (String value) {
                  if (value.isEmpty) {
                    return 'Ne doit pas être vide';
                  }
                  return null;
                },
              ),
              const Divider(),
              TextFormField(
                key: const Key('report_tab/description'),
                controller: model.descriptionController,
                maxLines: null,
                focusNode: model.descriptionFocusNode,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLength: 500,
                decoration: const InputDecoration(
                  labelText: "Description",
                  hintText: "Décrit ton problème !",
                ),
                onFieldSubmitted: (String term) =>
                    model.descriptionFocusNode.unfocus(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Shows how to fill a report.
class _TutorialCard extends StatelessWidget {
  const _TutorialCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DocCard(
      elevation: 4,
      children: <Widget>[
        BoxMdH("Comment signaler sans internet ?", 1),
        BoxMdBody(Text(
          "REMARQUE : Il est recommandé d\'installer le Root et Busybox.",
          style: MinitelTextStyles.subhead,
        )),
        BoxMdBody(Text(
          "1. Connectez-vous à \'WiFi Minitel\'",
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          "2. Lancez la suite de diagnostique en appuyant sur le bouton, et attendez 1 minute.",
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          "3. Remplissez votre rapport. N'oubliez pas un moyen de communication (chambre, mail, messenger ...)",
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          "Exemple : \nTitre: 2012, pas Internet depuis Lundi.\nDescription: Je perds fréquemment la connexion lorsque je suis sur Ethernet. Le Wifi, c\'est ok.",
          style: MinitelTextStyles.body1,
        )),
        BoxMdBody(Text(
          "4. Connectez-vous sur un réseau où il y a Internet.",
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          "5. Envoyez le rapport.",
          style: MinitelTextStyles.mdH3,
        )),
      ],
    );
  }
}
