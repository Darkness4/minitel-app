import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/constants/app_constants.dart';
import 'package:minitel_toolbox/data/models/login_settings_model.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';

void main() {
  const LoginSettingsModel tLoginSettingsModel = LoginSettingsModel(
    rememberMe: false,
    autoLogin: false,
    uid: '',
    selectedTime: '4 hours',
    selectedUrl: MyIPAdresses.stormshieldIP,
    pswd: '',
  );
  const LoginSettings tLoginSettings = LoginSettings(
    rememberMe: false,
    autoLogin: false,
    uid: '',
    selectedTime: '4 hours',
    selectedUrl: MyIPAdresses.stormshieldIP,
    pswd: '',
  );

  test(
    'should be a subclass of LoginSettings entity',
    () async {
      // assert
      expect(tLoginSettingsModel, isA<LoginSettings>());
    },
  );

  group('fromEntity', () {
    test(
      'should return a valid model from Entity',
      () async {
        // act
        final result = LoginSettingsModel.fromEntity(tLoginSettings);
        // assert
        expect(result, equals(tLoginSettingsModel));
      },
    );
  });
}
