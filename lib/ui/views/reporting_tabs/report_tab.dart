import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minitel_toolbox/core/constants/localizations.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/viewmodels/views/reporting_view_model.dart';
import 'package:minitel_toolbox/ui/shared/app_colors.dart';
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
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? MinitelColors.ReportPrimaryColor
            : Theme.of(context).primaryColor,
      ),
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
                      decoration: InputDecoration(
                        labelText: AppLoc.of(context).reporting.chamberLabel,
                        hintText: AppLoc.of(context).reporting.chamberHint,
                      ),
                      autovalidate: true,
                      onFieldSubmitted: (String term) {
                        model.roomFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(model.nameFocusNode);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return AppLoc.of(context).reporting.notEmpty;
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
                      decoration: InputDecoration(
                        labelText: AppLoc.of(context).reporting.idLabel,
                        hintText: AppLoc.of(context).reporting.idHint,
                      ),
                      autovalidate: true,
                      onFieldSubmitted: (String term) {
                        model.nameFocusNode.unfocus();
                        FocusScope.of(context)
                            .requestFocus(model.titleFocusNode);
                      },
                      validator: (String value) {
                        if (value.isEmpty) {
                          return AppLoc.of(context).reporting.notEmpty;
                        } else if (!value.contains(' ')) {
                          return AppLoc.of(context).reporting.forceName;
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
                decoration: InputDecoration(
                  labelText: AppLoc.of(context).reporting.titleLabel,
                  hintText: AppLoc.of(context).reporting.titleHint,
                ),
                onFieldSubmitted: (String term) {
                  model.titleFocusNode.unfocus();
                  FocusScope.of(context)
                      .requestFocus(model.descriptionFocusNode);
                },
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
                key: const Key('report_tab/description'),
                controller: model.descriptionController,
                maxLines: null,
                focusNode: model.descriptionFocusNode,
                textInputAction: TextInputAction.newline,
                keyboardType: TextInputType.multiline,
                maxLength: 500,
                decoration: const InputDecoration(
                  labelText: "Description",
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
    return DocCard(
      elevation: 4,
      children: <Widget>[
        BoxMdH(AppLoc.of(context).reporting.tutorial.header, 1),
        BoxMdBody(Text(
          AppLoc.of(context).reporting.tutorial.notice,
          style: Theme.of(context).textTheme.subhead,
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
          style: Theme.of(context).textTheme.body1,
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
