import 'dart:convert';
import 'dart:io';

class WebhookAPI {
  static const String _webhook =
      "aHR0cHM6Ly9ob29rcy5zbGFjay5jb20vc2VydmljZXMvVDlTNFhMQzhHL0JHV1NHS1lKVS94RTFzQzdJNEc0MWdDMnNMYXlSZENkM1U=";

  final _client = HttpClient();

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
      {String title,
      String channel: "projet_flutter_notif",
      String botName: "Flutter Reporter Bot"}) async {
    var status = "";

    if (text != "" && title != "") {
      var out = "*--Report ${DateTime.now()}--*\n"
          "*$title*\n"
          "$text\n";
      var data = {
        'text': out,
        'username': botName,
        'icon_url':
            'https://raw.githubusercontent.com/dart-lang/logos/master/flutter/logo%2Btext/vertical/default.png',
        'channel': channel, // Marc : DE8PA0Z1C
      };

      try {
        HttpClientRequest request = await _client
            .postUrl(Uri.parse(utf8.decode(base64.decode(_webhook))));

        request.headers.contentType =
            ContentType("application", "json", charset: "utf-8");
        request.write(json.encode(data));
        HttpClientResponse response = await request.close();
        status =
            await response.cast<List<int>>().transform(utf8.decoder).join();
      } catch (e) {
        status = e.toString();
      }
    } else {
      status = "Not enough information.";
    }

    return status;
  }
}
