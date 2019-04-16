import 'package:auto_login_flutter/components/cards.dart';
import 'package:auto_login_flutter/localizations.dart';
import 'package:auto_login_flutter/styles/text_style.dart';
import 'package:flutter/material.dart';

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
  final _titleFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();

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
    return const DocCard(
      elevation: 4,
      children: const <Widget>[
        const Header("Contacts"),
        const Header("Facebook: Minitel Ismin", level: 2),
        const Header("G*: Contact Admin", level: 2),
        const Header("Mail: minitelismin@gmail.com", level: 2),
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
          child: Container(
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
        Header(AppLoc.of(context).sentenceReportingTitle),
        Header(AppLoc.of(context).sentenceReportingNOTE, level: 2),
        Header(AppLoc.of(context).sentenceReportingSubTitle1, level: 2),
        Header(AppLoc.of(context).sentenceReportingSubtitle2, level: 2),
        Header(AppLoc.of(context).sentenceReportingSubtitle3, level: 2),
        Paragraph(AppLoc.of(context).sentenceReportingParagraph),
        Header(AppLoc.of(context).sentenceReportingSubtitle4, level: 2),
        Header(AppLoc.of(context).sentenceReportingSubtitle5, level: 2),
      ],
    );
  }
}
