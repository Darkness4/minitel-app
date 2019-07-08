import 'package:flutter/material.dart';
import 'package:minitel_toolbox/ui/shared/text_styles.dart';
import 'package:minitel_toolbox/ui/widgets/cards.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class ReportTab extends StatefulWidget {
  final String channel;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  const ReportTab(
      {Key key,
      this.channel: "projet_flutter_notif",
      @required this.titleController,
      @required this.descriptionController})
      : super(key: key);

  @override
  ReportTabState createState() => ReportTabState();
}

class ReportTabState extends State<ReportTab> {
  final FocusNode _titleFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Scrollbar(
        child: ListView(children: <Widget>[
          _ReportCard(
              titleController: widget.titleController,
              titleFocusNode: _titleFocusNode,
              descriptionFocusNode: _descriptionFocusNode,
              descriptionController: widget.descriptionController),
          const _TutorialCard(),
          const _ContactsCard(),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _descriptionFocusNode.dispose();
    _titleFocusNode.dispose();
    super.dispose();
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
        BoxMdH("Contacts", 1),
        FlatButton(
          textColor: Colors.blueAccent,
          child: Text(
            "Facebook: Minitel Ismin",
            style: MinitelTextStyles.mdH3.apply(color: Colors.blueAccent),
          ),
          onPressed: () =>
              _launchURL("https://www.messenger.com/t/100012919189214"),
          color: Colors.lightBlue[100],
        ),
        FlatButton(
          textColor: Colors.blueAccent,
          child: Text(
            "Mail: minitelismin@gmail.com (non recommandée)",
            style: MinitelTextStyles.mdH3.apply(color: Colors.blueAccent),
          ),
          onPressed: () => _launchURL("mailto: minitelismin@gmail.com"),
          color: Colors.lightBlue[100],
        ),
        Text(
          "G*: Contact Admin",
          style: MinitelTextStyles.mdH3,
        ),
      ],
    );
  }
}

/// This is the form needed to be filled.
class _ReportCard extends StatelessWidget {
  final TextEditingController _titleController;
  final FocusNode _titleFocusNode;
  final FocusNode _descriptionFocusNode;
  final TextEditingController _descriptionController;

  const _ReportCard({
    Key key,
    @required TextEditingController titleController,
    @required FocusNode titleFocusNode,
    @required FocusNode descriptionFocusNode,
    @required TextEditingController descriptionController,
  })  : _titleController = titleController,
        _titleFocusNode = titleFocusNode,
        _descriptionFocusNode = descriptionFocusNode,
        _descriptionController = descriptionController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                TextField(
                  controller: _titleController,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  focusNode: _titleFocusNode,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: "Title",
                    hintText: "Room number : Short description.",
                  ),
                  onSubmitted: (term) {
                    _titleFocusNode.unfocus();
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                ),
                TextField(
                  controller: _descriptionController,
                  maxLines: null,
                  focusNode: _descriptionFocusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: "Description",
                    hintText: "Describe your issue.",
                  ),
                  onSubmitted: (term) => _descriptionFocusNode.unfocus(),
                ),
              ],
            ),
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
    return DocCard(
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
          "3. Remplissez votre rapport.",
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
