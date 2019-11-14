import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/cache_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_local_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  CalendarURLLocalDataSource dataSource;
  MockSharedPreferences mockPrefs;

  setUp(() {
    mockPrefs = MockSharedPreferences();
    dataSource = CalendarURLLocalDataSourceImpl(
      prefs: mockPrefs,
    );
  });

  group('getLastCalendarURL', () {
    final tCalendarUrl =
        fixture('calendar_url_local_data_source/shared_preferences');
    test(
      'should return GithubUserModel from SharedPreferences when there is one in the cache',
      () async {
        // arrange
        when(mockPrefs.getString(any)).thenReturn(tCalendarUrl);
        // act
        final result = await dataSource.getLastCalendarURL();
        // assert
        verify(mockPrefs.getString(CacheKeys.calendarURL));
        expect(result, equals(tCalendarUrl));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when<dynamic>(mockPrefs.get(any)).thenReturn(null);
        // act
        final call = dataSource.getLastCalendarURL;
        // assert
        expect(call, throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('saveCalendarURL', () {
    final tCalendarUrl =
        fixture('calendar_url_local_data_source/shared_preferences');

    test(
      'should call SharedPreferences to cache the data',
      () async {
        // act
        await dataSource.saveCalendarURL(tCalendarUrl);
        // assert
        final expectedString = tCalendarUrl;
        verify(mockPrefs.setString(
          CacheKeys.calendarURL,
          expectedString,
        ));
      },
    );
  });
}

class MockSharedPreferences extends Mock implements SharedPreferences {}
