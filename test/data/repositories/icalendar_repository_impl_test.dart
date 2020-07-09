import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/icalendar_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  ICalendarRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockCalendarURLRepository mockCalendarURLRepository;
  MockNetworkInfo mockNetworkInfo;
  final tICalendar = Stream.value(utf8.encode("ICalendar"));
  const tUser = "user";
  const tPswd = "pswd";
  const tUrl = "https://localhost/";

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockCalendarURLRepository = MockCalendarURLRepository();
    mockNetworkInfo = MockNetworkInfo();
    repository = ICalendarRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      calendarURLRepository: mockCalendarURLRepository,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.wifi);
      });

      body();
    });
  }

  void runTestsOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.none);
      });

      body();
    });
  }

  group('download', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.wifi);
        // act
        await repository.download(username: tUser, password: tPswd);
        // assert
        verify(mockNetworkInfo.result);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockCalendarURLRepository.get(
            username: tUser,
            password: tPswd,
          )).thenAnswer((_) async => tUrl);
          when(mockRemoteDataSource.streamICalendar(tUrl))
              .thenAnswer((_) => tICalendar);
          // act
          await repository.download(
            password: tPswd,
            username: tUser,
          );
          // assert
          verify(mockCalendarURLRepository.get(
            username: tUser,
            password: tPswd,
          ));
          verify(mockRemoteDataSource.streamICalendar(tUrl));
          verify(mockLocalDataSource.cacheICalendar(tICalendar));
        },
      );
    });
  });

  runTestsOffline(() {
    test(
      'should throw a ClientException',
      () async {
        // act
        final call = repository.download;
        // assert

        expect(() => call(username: tUser, password: tPswd),
            throwsA(isInstanceOf<ClientException>()));
        verifyZeroInteractions(mockRemoteDataSource);
        verifyZeroInteractions(mockLocalDataSource);
      },
    );
  });

  group('parsedCalendar', () {
    const ParsedCalendar tParsedCalendarModel = ParsedCalendar(
      calscale: "calscale",
      events: [],
      prodID: "prodID",
      timezone: null,
      version: "version",
    );
    const ParsedCalendar tParsedCalendar = tParsedCalendarModel;
    test(
      'should call localDataSource',
      () async {
        // arrange
        when(mockLocalDataSource.getParsedCalendar())
            .thenAnswer((_) async => tParsedCalendarModel);
        // act
        final result = await repository.parsedCalendar;

        // assert
        verify(mockLocalDataSource.getParsedCalendar());
        expect(result, equals(tParsedCalendar));
      },
    );
  });
}

class MockRemoteDataSource extends Mock implements ICalendarRemoteDataSource {}

class MockLocalDataSource extends Mock implements ICalendarLocalDataSource {}

class MockCalendarURLRepository extends Mock implements CalendarURLRepository {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
