import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/funcs/http_version_checker.dart';

void main() {
  test('Get latest release version', () async {
    var version = await getLatestVersion();
    print(version);

    expect(version, contains('.'));
  });

  test('Get latest release URL', () async {
    var url = await getLatestVersionURL();
    print(url);

    expect(url, contains('https'));
  });
}
