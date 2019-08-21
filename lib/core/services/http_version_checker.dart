import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/models/github_api.dart';

/// HTTP Requests for github API
class VersionAPI {
  final HttpClient _client = HttpClient();

  /// Get the latest version of the app from Github Source
  Future<LatestRelease> getLatestVersion() async {
    final HttpClientRequest request = await _client.getUrl(Uri.parse(
        "https://api.github.com/repos/Darkness4/minitel-app/releases/latest"));
    final HttpClientResponse response = await request.close();
    if (response.statusCode == 200) {
      final String data =
          await response.cast<List<int>>().transform(utf8.decoder).join();
      return LatestRelease.fromJson(json.decode(data));
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
