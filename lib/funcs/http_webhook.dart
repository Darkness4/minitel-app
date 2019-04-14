import 'dart:io';
import 'dart:convert';

/// Report data to the Slack of Minitel
///
/// Send a POST data to the Webhook of the Slack of Minitel by using [HttpClientRequest].
///
/// You can use [report] like this:
///
/// ```
/// String status = await report("Description", title: "Title");
/// ```
Future<String> report(String text,
    {String title, String channel: "projet_flutter_notif"}) async {
  var status = "";

  if (text != "" && title != "") {
    var client = HttpClient();
    var out = "*--Report ${DateTime.now()}--*\n"
        "*$title*\n"
        "$text\n";
    var data = {
      'text': out,
      'username': 'Flutter Reporter Bot',
      'icon_url':
          'https://raw.githubusercontent.com/dart-lang/logos/master/flutter/logo%2Btext/vertical/default.png',
      'channel': channel, // Marc : DE8PA0Z1C
    };

    try {
      HttpClientRequest request = await client.postUrl(Uri.parse(
          'https://hooks.slack.com/services/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'));

      request.headers.contentType =
          ContentType("application", "json", charset: "utf-8");
      request.write(json.encode(data));
      HttpClientResponse response = await request.close();
      status = await response.transform(Utf8Decoder()).join();
    } catch (e) {
      status = e.toString();
    }
  } else {
    status = "Not enough information.";
  }

  return status;
}
