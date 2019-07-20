import 'dart:io';
import 'dart:convert';

/// HTTP Requests for github API
class VersionAPI {
  final _client = HttpClient();

  Future<String> get _latestVersionAPI async {
    var status = "";

    try {
      HttpClientRequest request = await _client.getUrl(Uri.parse(
          "https://api.github.com/repos/Darkness4/minitel-app/releases/latest"));
      HttpClientResponse response = await request.close();
      status = await response.cast<List<int>>().transform(utf8.decoder).join();
    } catch (e) {
      status = e.toString();
    }

    return status;
  }

  Future<String> getLatestVersion() async {
    var jsonString = await _latestVersionAPI;
    Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);

    return latestVersionJson["tag_name"];
  }

  Future<String> getLatestVersionURL() async {
    var jsonString = await _latestVersionAPI;
    Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);
    return latestVersionJson["html_url"];
  }
}
