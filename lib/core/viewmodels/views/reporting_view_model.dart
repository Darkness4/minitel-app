import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:minitel_toolbox/core/models/diagnosis.dart';
import 'package:minitel_toolbox/core/services/http_gateway.dart';
import 'package:minitel_toolbox/core/services/http_webhook.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ButtonState { None, Loading, Done }

class ReportingViewModel extends ChangeNotifier {
  /// Diagnosis used to capture and store data
  final Diagnosis diagnosis;

  /// Webhook API called for hadling Slack communications
  final WebhookAPI _webhook;

  /// Percentage of completion of the circle
  final ValueNotifier<double> percentageDiagnoseProgress =
      ValueNotifier<double>(0.0);

  ButtonState diagnosisState = ButtonState.None;

  ReportingViewModel({
    @required WebhookAPI webhook,
    @required GatewayAPI gatewayAPI,
  })  : _webhook = webhook,
        diagnosis = Diagnosis(gatewayAPI: gatewayAPI);

  Future<DateTime> get _timeout async {
    final prefs = await SharedPreferences.getInstance();
    final dateTimeout = prefs.getString('timeout') ?? "0000-00-00 00:00:00.000";
    return DateTime.parse(dateTimeout);
  }

  Future diagnose() async {
    if (diagnosisState != ButtonState.Loading) {
      diagnosisState = ButtonState.Loading;
      notifyListeners();
      Timer timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer t) => percentageDiagnoseProgress.value += 1 / 60,
      );
      await diagnosis.diagnose();
      timer.cancel();
      percentageDiagnoseProgress.value = 0.0;
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
        "${diagnosis.report.toString()}",
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
