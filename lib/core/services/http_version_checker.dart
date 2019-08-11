import 'dart:convert';
import 'dart:io';

/// HTTP Requests for github API // TODO: Convert to a similar API
class VersionAPI {
  final _client = HttpClient();

  /// Get the latest version of the app from Github Source
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

  /// Get the tag name from Github source.
  Future<String> getLatestVersion() async {
    var jsonString = await _latestVersionAPI;
    Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);

    return latestVersionJson["tag_name"];
  }

  /// Get the url from Github source.
  Future<String> getLatestVersionURL() async {
    var jsonString = await _latestVersionAPI;
    Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);
    return latestVersionJson["html_url"];
  }
}
