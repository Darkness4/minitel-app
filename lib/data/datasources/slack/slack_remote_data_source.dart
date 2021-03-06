import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:http/http.dart' as http;
import 'package:minitel_toolbox/core/datetime/datetime_manager.dart';

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
    String channel = 'projet_flutter_notif',
  });
}

/// Slack Incomming Webhook API
@LazySingleton(as: SlackRemoteDataSource)
class SlackRemoteDataSourceImpl implements SlackRemoteDataSource {
  final http.Client client;
  final DateTimeManager dateTimeManager;

  const SlackRemoteDataSourceImpl({
    @required this.client,
    @required this.dateTimeManager,
  });

  @override
  Future<String> report(
    String text, {
    Map<String, String> attachments,
    String channel = 'projet_flutter_notif',
  }) async {
    final _attachments = attachments?.entries
        ?.map((e) => {
              'fallback': e.key,
              'title': e.key,
              'text': e.value,
              'footer': 'Slack API',
            })
        ?.toList();

    final data = <String, dynamic>{
      'text': '*--Report ${dateTimeManager.now()}--*\n'
          '$text\n',
      if (_attachments != null) 'attachments': _attachments,
      'channel': channel, // Marc : DTXU7EU56
    };

    final response = await client.post(
      'https://slack.com/api/chat.postMessage',
      body: json.encode(data),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer ${ApiKeys.webhook}'
      },
    );

    return response.body;
  }
}
