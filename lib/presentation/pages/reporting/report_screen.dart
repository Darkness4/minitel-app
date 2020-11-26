import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:minitel_toolbox/core/constants/launch_url.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/validators/validators.dart';
import 'package:minitel_toolbox/presentation/cubits/reporting/report_status/report_status_cubit.dart';
import 'package:minitel_toolbox/presentation/shared/app_colors.dart';
import 'package:minitel_toolbox/presentation/shared/keys.dart';
import 'package:minitel_toolbox/presentation/pages/reporting/report_widgets/doc_card.dart';

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
          children: const <Widget>[
            _ReportCard(),
            _TutorialCard(),
            _ContactsCard(),
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
      children: <Widget>[
        Text(
          'Contacts',
          style: Theme.of(context).textTheme.headline5,
        ),
        OutlineButton(
          textColor: Theme.of(context).accentColor,
          onPressed: LaunchURLConstants.messengerMarcNGUYEN,
          child: Text(
            'Facebook: Minitel Ismin',
            style: Theme.of(context).textTheme.button,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        OutlineButton(
          textColor: Theme.of(context).accentColor,
          onPressed: LaunchURLConstants.mailToMinitel,
          child: Text(
            'Mail: minitelismin@gmail.com',
            style: Theme.of(context).textTheme.button,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          'G*: Contact Admin',
          style: Theme.of(context).textTheme.button,
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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _roomController;
  TextEditingController _nameController;
  FocusScopeNode _formNode;

  ReportStatusCubit _reportStatusCubit;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _roomController = TextEditingController();
    _nameController = TextEditingController();
    _formNode = FocusScopeNode();
    _reportStatusCubit = context.read<ReportStatusCubit>();

    _titleController.addListener(_onTitleChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _roomController.addListener(_onRoomChanged);
    _nameController.addListener(_onNameChanged);
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _roomController.dispose();
    _nameController.dispose();
    _formNode.dispose();
    super.dispose();
  }

  void _onTitleChanged() {
    _reportStatusCubit.titleChanged(_titleController.text);
  }

  void _onRoomChanged() {
    _reportStatusCubit.roomChanged(_roomController.text);
  }

  void _onDescriptionChanged() {
    _reportStatusCubit.descriptionChanged(_descriptionController.text);
  }

  void _onNameChanged() {
    _reportStatusCubit.nameChanged(_nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
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
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: AppLoc.of(context).reporting.chamberLabel,
                          hintText: AppLoc.of(context).reporting.chamberHint,
                        ),
                        autovalidateMode: AutovalidateMode.always,
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
                        autovalidateMode: AutovalidateMode.always,
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
                  autovalidateMode: AutovalidateMode.always,
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
                    labelText: 'Description',
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
      children: <Widget>[
        MarkdownBody(
          data: '''
# ${AppLoc.of(context).reporting.tutorial.header}

*${AppLoc.of(context).reporting.tutorial.notice}*

**${AppLoc.of(context).reporting.tutorial.content1}**

**${AppLoc.of(context).reporting.tutorial.content2}**

**${AppLoc.of(context).reporting.tutorial.content3}**

${AppLoc.of(context).reporting.tutorial.example}

**${AppLoc.of(context).reporting.tutorial.content4}**

**${AppLoc.of(context).reporting.tutorial.content5}**
''',
        ),
      ],
    );
  }
}
