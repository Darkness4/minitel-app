import 'package:auto_login_flutter/funcs/http_version_checker.dart';
import 'package:flutter_test/flutter_test.dart';

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
