import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/core/services/github_api.dart';

import '../mock_http_client.dart';
import 'github_api_responses.dart' show responseAllReleases, latestRelease;

void main() {
  const String repos = 'Darkness4/minitel-app';

  TestWidgetsFlutterBinding.ensureInitialized();

  group('Github API Tests', () {
    test('Get all releases from Github', () async {
      await HttpOverrides.runZoned(
        () async {
          final GithubAPI _githubAPI = GithubAPI();
          final List<GithubRelease> releases =
              await _githubAPI.fetchReleases(repos);

          expect(
              releases.first.id, equals(123456789)); // Check if mock is there
          expect(releases.first.html_url, contains(repos));
        },
        createHttpClient: (SecurityContext context) =>
            createMockHttpClient(context, <Uri, Uint8List>{
          Uri.parse("https://api.github.com/repos/$repos/releases"):
              utf8.encode(responseAllReleases),
        }),
      );
    });

    test('FAIL Get all releases from Github', () async {
      final GithubAPI _githubAPI = GithubAPI();
      try {
        await _githubAPI.fetchReleases("");
        throw Exception('Unexpected Result');
      } catch (e) {
        expect(e.toString(), contains("Failed to"));
      }
    });
  });
}
