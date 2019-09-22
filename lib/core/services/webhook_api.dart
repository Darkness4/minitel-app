import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/constants/api_constants.dart';

/// Slack Incomming Webhook API
class WebhookAPI {
  final HttpClient _client = HttpClient();

  /// Report data to the Slack of Minitel
  ///
  /// Send a POST data to the Webhook of the Slack of Minitel by using [HttpClientRequest].
  ///
  /// You can use [report] like this:
  ///
  /// ```
  /// String status = await report(
  ///   "Text",
  ///   attachments: {"attachment 1": "attachment content"},
  ///   channel: "projet_flutter_notif",
  ///   botName: "Flutter Reporter Bot",
  /// );
  /// ```
  Future<String> report(String text,
      {Map<String, String> attachments,
      String channel = "projet_flutter_notif",
      String botName = "Flutter Reporter Bot"}) async {
    final List<Map<String, String>> _attachments = <Map<String, String>>[];

    if (attachments != null) {
      attachments.forEach(
          (String key, String value) => _attachments.add(<String, String>{
                "fallback": key,
                "title": key,
                "text": value,
                "footer": "Slack API",
              }));
    }

    final Map<String, dynamic> data = <String, dynamic>{
      'text': "*--Report ${DateTime.now()}--*\n"
          "$text\n",
      'username': botName,
      "attachments": _attachments,
      'icon_url':
          'https://raw.githubusercontent.com/dart-lang/logos/master/flutter/logo%2Btext/vertical/default.png',
      'channel': "DE8PA0Z1C", // Marc : DE8PA0Z1C
    };

    final HttpClientRequest request = await _client.postUrl(
        Uri.parse("https://hooks.slack.com/services/${ApiConstants.webhook}"))
      ..headers.contentType =
          ContentType("application", "json", charset: "utf-8")
      ..write(json.encode(data));
    final HttpClientResponse response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}
