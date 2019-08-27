import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';

class GithubAPI {
  @visibleForTesting
  final HttpClient client = HttpClient();

  /// [repo] = author/repo
  Future<List<GithubRelease>> fetchReleases(String repo) async {
    final HttpClientRequest request = await client
        .getUrl(Uri.parse('https://api.github.com/repos/$repo/releases'));
    final HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      final String data = await response.transform(utf8.decoder).join();
      final List<Map<String, dynamic>> map =
          List<Map<String, dynamic>>.from(json.decode(data));
      return map
          .map(
              (Map<String, dynamic> release) => GithubRelease.fromJson(release))
          .toList();
    } else {
      throw Exception('Failed to load releases');
    }
  }

  /// [repo] = author/repo
  Future<GithubRelease> fetchLatestRelease(String repo) async {
    final HttpClientRequest request = await client.getUrl(
        Uri.parse('https://api.github.com/repos/$repo/releases/latest'));
    final HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      final String data = await response.transform(utf8.decoder).join();
      return GithubRelease.fromJson(json.decode(data));
    } else {
      throw Exception('Failed to load latest release');
    }
  }
}
