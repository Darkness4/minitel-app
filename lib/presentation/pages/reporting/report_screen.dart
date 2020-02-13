import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/launch_url.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:minitel_toolbox/presentation/blocs/report_status/report_status_bloc.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/shared/text_styles.dart';
import 'package:minitel_toolbox/presentation/widgets/cards/doc_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? MinitelColors.reportPrimaryColor
            : Theme.of(context).primaryColor,
      ),
      child: Scrollbar(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            const _ReportCard(),
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
        OutlineButton(
          textColor: Theme.of(context).accentColor,
          onPressed: LaunchURL.messengerMarcNGUYEN,
          child: const Text(
            "Facebook: Minitel Ismin",
            style: MinitelTextStyles.mdH3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        OutlineButton(
          textColor: Theme.of(context).accentColor,
          onPressed: LaunchURL.mailToMinitel,
          child: const Text(
            "Mail: minitelismin@gmail.com",
            style: MinitelTextStyles.mdH3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Text(
          "G*: Contact Admin",
          style: MinitelTextStyles.mdH3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

/// This is the form needed to be filled.
class _ReportCard extends StatefulWidget {
  const _ReportCard({Key key}) : super(key: key);

  @override
  __ReportCardState createState() => __ReportCardState();
}

class __ReportCardState extends State<_ReportCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final FocusScopeNode _formNode = FocusScopeNode();

  ReportStatusBloc _reportStatusBloc;

  @override
  void initState() {
    _reportStatusBloc = context.bloc<ReportStatusBloc>();

    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _roomController.addListener(_onRoomChanged);
    _nameController.addListener(_onNameChanged);
    super.initState();
  }

  void _onTitleChanged() {
    _reportStatusBloc.add(TitleChanged(title: _titleController.text));
  }

  void _onRoomChanged() {
    _reportStatusBloc.add(RoomChanged(room: _roomController.text));
  }

  void _onDescriptionChanged() {
    _reportStatusBloc
        .add(DescriptionChanged(description: _descriptionController.text));
  }

  void _onNameChanged() {
    _reportStatusBloc.add(NameChanged(name: _nameController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: FocusScope(
            node: _formNode,
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        key: const Key(Keys.reportRoom),
                        controller: _roomController,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textInputAction: TextInputAction.next,
                        inputFormatters: <TextInputFormatter>[
                          WhitelistingTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLoc.of(context).reporting.chamberLabel,
                          hintText: AppLoc.of(context).reporting.chamberHint,
                        ),
                        autovalidate: true,
                        onFieldSubmitted: (_) => _formNode.nextFocus(),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLoc.of(context).reporting.notEmpty;
                          } else if (value.containsNoNumbers) {
                            return AppLoc.of(context)
                                .reporting
                                .mustOnlyBeNumbers;
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        key: const Key(Keys.reportName),
                        controller: _nameController,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          labelText: AppLoc.of(context).reporting.idLabel,
                          hintText: AppLoc.of(context).reporting.idHint,
                        ),
                        autovalidate: true,
                        onFieldSubmitted: (_) => _formNode.nextFocus(),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return AppLoc.of(context).reporting.notEmpty;
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  key: const Key(Keys.reportTitle),
                  controller: _titleController,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: AppLoc.of(context).reporting.titleLabel,
                    hintText: AppLoc.of(context).reporting.titleHint,
                  ),
                  onFieldSubmitted: (_) => _formNode.nextFocus(),
                  autovalidate: true,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return AppLoc.of(context).reporting.notEmpty;
                    }
                    return null;
                  },
                ),
                const Divider(),
                TextFormField(
                  key: const Key(Keys.reportDescription),
                  controller: _descriptionController,
                  maxLines: null,
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  maxLength: 500,
                  decoration: const InputDecoration(
                    labelText: "Description",
                  ),
                  onFieldSubmitted: (_) => _formNode.unfocus(),
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
        BoxMdH(AppLoc.of(context).reporting.tutorial.header, 1),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.notice,
          style: Theme.of(context).textTheme.subtitle1,
        )),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.content1,
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.content2,
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.content3,
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.example,
          style: Theme.of(context).textTheme.bodyText2,
        )),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.content4,
          style: MinitelTextStyles.mdH3,
        )),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.content5,
          style: MinitelTextStyles.mdH3,
        )),
      ],
    );
  }
}