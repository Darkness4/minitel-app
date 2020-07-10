import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/settings/login_settings_data_source.dart';
import 'package:minitel_toolbox/domain/entities/login_settings.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  LoginSettingsDataSource dataSource;
  MockSharedPreferences mockSharedPreferences;
  MockFlutterSecureStorage mockFlutterSecureStorage;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    mockFlutterSecureStorage = MockFlutterSecureStorage();
    dataSource = LoginSettingsDataSourceImpl(
      prefs: mockSharedPreferences,
      storage: mockFlutterSecureStorage,
    );
  });

  group('clear', () {
    test('should execute', () async {
      // arrange
      when(mockSharedPreferences.remove(any)).thenAnswer((_) async => true);
      when(mockFlutterSecureStorage.delete(key: anyNamed('key')))
          .thenAnswer((_) async => null);
      // act
      await dataSource.clear();
      // assert
      verify(mockSharedPreferences.remove('rememberMe'));
      verify(mockSharedPreferences.remove('autoLogin'));
      verify(mockSharedPreferences.remove('uid'));
      verify(mockSharedPreferences.remove('selectedTime'));
      verify(mockSharedPreferences.remove('selectedUrl'));
      verify(mockFlutterSecureStorage.delete(key: 'pswd'));
    });
  });

  group('load', () {
    test(
      'should return LoginSettingsModel from SharedPreferences and FlutterSecureStorage when there is one',
      () async {
        // arrange
        const tAutoLogin = true;
        const tRememberMe = true;
        const tSelectedTime = '4 hours';
        const tSelectedUrl = '10.163.0.2';
        const tUid = 'uid';
        const tPwsd = 'pswd';
        const tLoginSettingsModel = LoginSettings(
          autoLogin: tAutoLogin,
          pswd: tPwsd,
          rememberMe: tRememberMe,
          selectedTime: tSelectedTime,
          selectedUrl: tSelectedUrl,
          uid: tUid,
        );
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getBool('autoLogin')).thenReturn(tAutoLogin);
        when(mockSharedPreferences.getBool('rememberMe'))
            .thenReturn(tRememberMe);
        when(mockSharedPreferences.getString('selectedTime'))
            .thenReturn(tSelectedTime);
        when(mockSharedPreferences.getString('selectedUrl'))
            .thenReturn(tSelectedUrl);
        when(mockSharedPreferences.getString('uid')).thenReturn(tUid);
        when(mockFlutterSecureStorage.read(key: 'pswd'))
            .thenAnswer((_) async => tPwsd);
        // act
        final result = await dataSource.load();
        // assert
        verify(mockSharedPreferences.containsKey(any));
        verify(mockSharedPreferences.getBool('autoLogin'));
        verify(mockSharedPreferences.getBool('rememberMe'));
        verify(mockSharedPreferences.getString('selectedTime'));
        verify(mockSharedPreferences.getString('selectedUrl'));
        verify(mockSharedPreferences.getString('uid'));
        verify(mockFlutterSecureStorage.read(key: 'pswd'));
        expect(result, equals(tLoginSettingsModel));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(false);
        // act
        final call = dataSource.load;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('save', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        const tAutoLogin = true;
        const tRememberMe = true;
        const tSelectedTime = '4 hours';
        const tSelectedUrl = '10.163.0.2';
        const tUid = 'uid';
        const tPwsd = 'pswd';
        const tLoginSettingsModel = LoginSettings(
          autoLogin: tAutoLogin,
          pswd: tPwsd,
          rememberMe: tRememberMe,
          selectedTime: tSelectedTime,
          selectedUrl: tSelectedUrl,
          uid: tUid,
        );

        when(mockSharedPreferences.setString(any, any))
            .thenAnswer((_) async => true);
        when(mockSharedPreferences.setBool(any, any))
            .thenAnswer((_) async => true);
        when(mockFlutterSecureStorage.write(
                key: anyNamed('key'), value: anyNamed('value')))
            .thenAnswer((_) async => null);
        // act
        await dataSource.save(tLoginSettingsModel);
        // assert
        verify(mockSharedPreferences.setBool('rememberMe', tRememberMe));
        verify(mockSharedPreferences.setBool('autoLogin', tAutoLogin));
        verify(mockSharedPreferences.setString('uid', tUid));
        verify(mockSharedPreferences.setString('selectedTime', tSelectedTime));
        verify(mockSharedPreferences.setString('selectedUrl', tSelectedUrl));
        verify(mockFlutterSecureStorage.write(key: 'pswd', value: tPwsd));
      },
    );
  });
}

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}
