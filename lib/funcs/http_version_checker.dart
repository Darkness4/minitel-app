import 'dart:io';
import 'dart:convert';

Future<String> get _getLatestVersionAPI async {
  var status = "";

  var client = HttpClient();

  try {
    HttpClientRequest request = await client.getUrl(Uri.parse(
        "https://api.github.com/repos/Darkness4/minitel-app/releases/latest"));
    HttpClientResponse response = await request.close();
    status = await response.transform(Utf8Decoder()).join();
  } catch (e) {
    status = e.toString();
  }

  return status;
}

Future<String> getLatestVersion() async {
  var jsonString = await _getLatestVersionAPI;
  Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);
  return latestVersionJson["tag_name"];
}

Future<String> getLatestVersionURL() async {
  var jsonString = await _getLatestVersionAPI;
  Map<String, dynamic> latestVersionJson = jsonDecode(jsonString);
  return latestVersionJson["html_url"];
}
