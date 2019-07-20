import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/services/http_version_checker.dart';

void main() {
  final _version = VersionAPI();
  test('Get latest release version', () async {
    var version = await _version.getLatestVersion();
    print(version);

    expect(version, contains('.'));
  });

  test('Get latest release URL', () async {
    var url = await _version.getLatestVersionURL();
    print(url);

    expect(url, contains('https'));
  });
}
