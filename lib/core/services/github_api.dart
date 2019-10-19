import 'dart:convert';
import 'dart:io';

import 'package:minitel_toolbox/core/models/github/release.dart';

class GithubAPI {
  final HttpClient _client = HttpClient();

  /// [repo] = author/repo
  Future<List<GithubRelease>> fetchReleases(String repo) async {
    final HttpClientRequest request = await _client
        .getUrl(Uri.parse('https://api.github.com/repos/$repo/releases'));
    final HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      final Future<List<GithubRelease>> data = response
          .transform(utf8.decoder)
          .transform(json.decoder)
          .expand((Object data) =>
              List<Map<String, dynamic>>.from(data as List<dynamic>))
          .map((Map<String, dynamic> data) => GithubRelease.fromJson(data))
          .toList();
      return data;
    } else {
      throw Exception('Failed to load releases');
    }
  }
}
