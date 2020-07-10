import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';

void main() {
  group('get props', () {
    test(
      'should return work with equals',
      () async {
        // arrange
        // ignore: prefer_const_constructors
        final tLoginSettings = LoginSettings(
          autoLogin: true,
          pswd: 'pswd',
          rememberMe: false,
          selectedTime: '4 hours',
          selectedUrl: '10.163.0.2',
          uid: 'uid',
        );
        // assert
        // ignore: prefer_const_constructors
        final expectedSettings = LoginSettings(
          autoLogin: true,
          pswd: 'pswd',
          rememberMe: false,
          selectedTime: '4 hours',
          selectedUrl: '10.163.0.2',
          uid: 'uid',
        );
        expect(
          tLoginSettings,
          equals(expectedSettings),
        );
      },
    );
  });
}
