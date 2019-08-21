import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/models/github_api.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';

void main() {
  final VersionAPI _version = VersionAPI();
  test('Get latest release', () async {
    final LatestRelease version = await _version.getLatestVersion();
    print(version.toJson());

    expect(version.createdAt != null, true);
    expect(version.htmlUrl != null, true);
    expect(version.id != null, true);
    expect(version.name != null, true);
    expect(version.publishedAt != null, true);
    expect(version.tagName != null, true);
    expect(version.url != null, true);
  });
}
