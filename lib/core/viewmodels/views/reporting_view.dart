import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/core/services/http_webhook.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ButtonState { None, Loading, Done }

class ReportingModel extends ChangeNotifier {
  final Diagnosis _diagnosis = Diagnosis();
  final WebhookAPI _webhook;

  ButtonState diagnosisState = ButtonState.None;

  String report = "";

  ReportingModel({
    @required WebhookAPI webhook,
  }) : _webhook = webhook;

  Future<DateTime> get _timeout async {
    final prefs = await SharedPreferences.getInstance();
    final dateTimeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(dateTimeout);
  }

  Future diagnose(AnimationController animationController,
      ValueNotifier<double> percentageDiagnoseProgress) async {
    if (!animationController.isDismissed) animationController.reverse();
    if (diagnosisState != ButtonState.Loading) {
      diagnosisState = ButtonState.Loading;
      notifyListeners();
      Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => percentageDiagnoseProgress.value += 1 / 60,
      );
      report = await _diagnosis.diagnose();
      diagnosisState = ButtonState.Done;
      notifyListeners();
    }
  }

  Future<String> reportToSlack(
      String title, String description, String channel) async {
    DateTime timeout = await _timeout;
    String status;
    if (DateTime.now().isAfter(timeout)) {
      status = await _webhook.report(
        "_${description}_\n\n"
        "*Diagnosis*\n"
        "$report",
        title: title,
        channel: channel,
      );
      if (status == "ok") _setTimeout();
    } else {
      status = "Wait until ${timeout.hour}:${timeout.minute}";
    }
    return status;
  }

  Future<void> _setTimeout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }
}
