import 'dart:io';
import 'dart:convert';

/// HTTP Requests for github API
class Version {
  static Future<String> get _latestVersionAPI async {
    var status = "";
    var client = HttpClient();

    try {
      HttpClientRequest request = await client.getUrl(Uri.parse(
          "https://api.github.com/repos/Darkness4/minitel-app/releases/latest"));
      HttpClientResponse response = await request.close();
      status = await response.cast<List<int>>().transform(utf8.decoder).join();
    } catch (e) {
      status = e.toString();
    }

    return status;
  }

  static Future<String> getLatestVersion() async {
    var jsonString = await _latestVersionAPI;
    Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);

    return latestVersionJson["tag_name"];
  }

  static Future<String> getLatestVersionURL() async {
    var jsonString = await _latestVersionAPI;
    Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);
    return latestVersionJson["html_url"];
  }
}
