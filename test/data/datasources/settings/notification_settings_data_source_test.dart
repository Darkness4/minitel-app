import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/cache_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/settings/notification_settings_data_source.dart';
import 'package:minitel_toolbox/data/models/notifications_model.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  NotificationSettingsDataSource dataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = NotificationSettingsDataSourceImpl(
      prefs: mockSharedPreferences,
    );
  });

  group('loadNotificationSettings', () {
    test(
      'should return NotificationSettingsModel from SharedPreferences when there is one',
      () async {
        // arrange
        const tEarly = 1;
        const tRange = 2;
        const tEnabled = true;
        const tNotificationSettingsModel = NotificationSettingsModel(
          early: Duration(minutes: tEarly),
          range: Duration(days: tRange),
          enabled: tEnabled,
        );
        when(mockSharedPreferences.containsKey(any)).thenReturn(true);
        when(mockSharedPreferences.getInt(CacheKeys.early)).thenReturn(tEarly);
        when(mockSharedPreferences.getInt(CacheKeys.range)).thenReturn(tRange);
        when(mockSharedPreferences.getBool(CacheKeys.enabled))
            .thenReturn(tEnabled);
        // act
        final result = dataSource.loadNotificationSettings();
        // assert
        verify(mockSharedPreferences.getInt(CacheKeys.early));
        verify(mockSharedPreferences.getInt(CacheKeys.range));
        verify(mockSharedPreferences.getBool(CacheKeys.enabled));
        expect(result, equals(tNotificationSettingsModel));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockSharedPreferences.containsKey(any)).thenReturn(false);
        // act
        final call = dataSource.loadNotificationSettings;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('saveNotificationSettings', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        // arrange
        const tEarly = 1;
        const tRange = 2;
        const tEnabled = true;
        const tNotificationSettingsModel = NotificationSettingsModel(
          early: Duration(minutes: tEarly),
          range: Duration(days: tRange),
          enabled: tEnabled,
        );

        when(mockSharedPreferences.setInt(any, any))
            .thenAnswer((_) async => true);
        when(mockSharedPreferences.setBool(any, any))
            .thenAnswer((_) async => true);
        // act
        await dataSource.saveNotificationSettings(tNotificationSettingsModel);
        // assert
        verify(mockSharedPreferences.setInt(CacheKeys.early, tEarly));
        verify(mockSharedPreferences.setInt(CacheKeys.range, tRange));
        verify(mockSharedPreferences.setBool(CacheKeys.enabled, tEnabled));
      },
    );
  });
}

class MockSharedPreferences extends Mock implements SharedPreferences {}
