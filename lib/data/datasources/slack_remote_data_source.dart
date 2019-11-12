import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/constants/api_constants.dart';
import 'package:http/http.dart' as http;

abstract class SlackRemoteDataSource {
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
  Future<String> report(
    String text, {
    Map<String, String> attachments,
    String channel = "projet_flutter_notif",
    String botName = "Flutter Reporter Bot",
  });
}

/// Slack Incomming Webhook API
class SlackRemoteDataSourceImpl implements SlackRemoteDataSource {
  final http.Client client;

  const SlackRemoteDataSourceImpl({@required this.client});

  @override
  Future<String> report(
    String text, {
    Map<String, String> attachments,
    String channel = "projet_flutter_notif",
    String botName = "Flutter Reporter Bot",
  }) async {
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

    final response = await client.post(
        "https://hooks.slack.com/services/${ApiConstants.webhook}",
        body: json.encode(data),
        headers: {HttpHeaders.contentTypeHeader: "application/json"});

    return response.body;
  }
}
