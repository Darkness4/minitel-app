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
  final WebhookAPI _webhookAPI;

  /// Percentage of completion of the circle
  final ValueNotifier<double> percentageDiagnoseProgress =
      ValueNotifier<double>(0.0);

  /// State of diagnosis
  ButtonState diagnosisState = ButtonState.None;

  ReportingViewModel({
    @required WebhookAPI webhookAPI,
    @required GatewayAPI gatewayAPI,
  })  : _webhookAPI = webhookAPI,
        diagnosis = Diagnosis(gatewayAPI: gatewayAPI);

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
      Future<void>.delayed(const Duration(seconds: 1), notifyListeners);

      // Diagnose
      await diagnosis.diagnose();

      // Kill timer
      timer.cancel();
      percentageDiagnoseProgress.value = 0.0;

      // Unlock
      diagnosisState = ButtonState.Done;
      notifyListeners();
    }
  }

  /// Send to slack
  Future<String> reportToSlack(String title, String description,
      {String channel = "minitel_toolbox_notifications"}) async {
    final DateTime timeout = await _timeout;
    String status;

    if (DateTime.now().isAfter(timeout)) {
      status = await _webhookAPI.report(
        "*$title*\n"
        "_${description}_\n\n",
        attachments: await diagnosis.reportAll,
        channel: channel,
      );
      if (status == "ok") {
        await _setTimeout();
      }
    } else {
      status = "Wait until ${timeout.hour}:${timeout.minute}";
    }
    return status;
  }

  /// SetTimeout to not abuse [reportToSlack]
  Future<void> _setTimeout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'timeout', DateTime.now().add(const Duration(minutes: 5)).toString());
  }
}
