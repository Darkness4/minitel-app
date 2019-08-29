import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/funcs/url_launch.dart';
import 'package:minitel_toolbox/core/services/diagnosis_api.dart';
import 'package:minitel_toolbox/core/services/webhook_api.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ButtonState { None, Loading, Done }
enum ReportTarget { Slack, Mail, Share }

class ReportingViewModel extends ChangeNotifier {
  /// Diagnosis used to capture and store data
  final DiagnosisAPI _diagnosisAPI;

  /// Webhook API called for hadling Slack communications
  final WebhookAPI _webhookAPI;

  /// Percentage of completion of the circle
  final ValueNotifier<double> percentageDiagnoseProgress =
      ValueNotifier<double>(0.0);

  /// State of diagnosis
  ButtonState diagnosisState = ButtonState.None;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController roomController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final FocusNode titleFocusNode = FocusNode();
  final FocusNode descriptionFocusNode = FocusNode();
  final FocusNode roomFocusNode = FocusNode();
  final FocusNode nameFocusNode = FocusNode();

  ReportingViewModel({
    @required WebhookAPI webhookAPI,
    @required DiagnosisAPI diagnosisAPI,
  })  : _webhookAPI = webhookAPI,
        _diagnosisAPI = diagnosisAPI;

  Future<DateTime> get _timeout async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String dateTimeout =
        prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(dateTimeout);
  }

  /// Initiate diagnosis
  Future<void> diagnose() async {
    if (diagnosisState != ButtonState.Loading) {
      // Lock
      diagnosisState = ButtonState.Loading;
      notifyListeners();

      // Animate button
      final Timer timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => percentageDiagnoseProgress.value += 1 / 60,
      );

      // Refersh ONE second after launching diagnose
      Future<void>.delayed(const Duration(seconds: 2), notifyListeners);

      // Diagnose
      await _diagnosisAPI.diagnose();

      // Kill timer
      timer.cancel();
      percentageDiagnoseProgress.value = 0.0;

      // Unlock
      diagnosisState = ButtonState.Done;
      notifyListeners();
    }
  }

  Future<void> reportTo(ReportTarget target,
      {BuildContext context,
      String channel = "minitel_toolbox_notifications"}) async {
    if (formKey.currentState.validate()) {
      final String body = "---Report ${DateTime.now().toString()}---\n\n"
          "Chambre: ${roomController.text}\n"
          "ID: ${nameController.text}\n"
          "Titre: ${titleController.text}\n"
          "Description: ${descriptionController.text}\n\n"
          "*Diagnosis*\n"
          "${await _diagnosisAPI.diagnosis.toStringAsync()}";

      switch (target) {
        case ReportTarget.Share:
          await Share.share(body);
          break;
        case ReportTarget.Mail:
          await LaunchURL.launchURL(
              "mailto:minitelismin@gmail.com?subject=${titleController.text}&body=$body");
          break;
        case ReportTarget.Slack:
          final DateTime timeout = await _timeout;
          String status;

          if (formKey.currentState.validate()) {
            if (DateTime.now().isAfter(timeout)) {
              status = await _webhookAPI.report(
                "*Chambre ${roomController.text}*\n"
                "*ID : ${nameController.text}*\n"
                "*${titleController.text}*\n"
                "_${descriptionController.text}_\n\n",
                attachments: await _diagnosisAPI.diagnosis.toMapAsync(),
                channel: channel,
              );
              if (status == "ok") {
                await _setTimeout();
              }
            } else {
              status = "Wait until ${timeout.hour}:${timeout.minute}";
            }
          }
          if (status != null) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(status),
              ),
            );
          }
          break;
      }
    }
  }

  /// SetTimeout to not abuse [reportToSlack]
  Future<void> _setTimeout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }
}
