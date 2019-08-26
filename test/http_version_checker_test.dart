import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/models/github/release.dart';
import 'package:minitel_toolbox/core/services/github_api.dart';

void main() {
  final GithubAPI _githubAPI = GithubAPI();
  test('Get all releases from Github', () async {
    final List<GithubRelease> releases =
        await _githubAPI.fetchReleases("Darkness4/minitel-app");

    expect(releases.first.html_url, contains("Darkness4/minitel-app"));
  });

  test('Get latest release from Github', () async {
    final GithubRelease release =
        await _githubAPI.fetchLatestRelease("Darkness4/minitel-app");

    expect(release.html_url, contains("Darkness4/minitel-app"));
  });
}
