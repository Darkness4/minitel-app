import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/calendar_url_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  CalendarURLRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockLocalDataSource mockLocalDataSource;
  const tUser = 'User';
  const tPswd = 'Pwsd';
  const tRemoteUrl = 'https://localhost/';

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = CalendarURLRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
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

  group('get', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.wifi);
        when(mockRemoteDataSource.getCalendarURL(
          username: anyNamed('username'),
          password: anyNamed('password'),
        )).thenAnswer((_) async => null);
        when(mockLocalDataSource.saveCalendarURL(any))
            .thenAnswer((_) async => null);
        // act
        await repository.get(username: tUser, password: tPswd);
        // assert
        verify(mockNetworkInfo.result);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getCalendarURL(
            username: tUser,
            password: tPswd,
          )).thenAnswer((_) async => tRemoteUrl);
          when(mockLocalDataSource.saveCalendarURL(any))
              .thenAnswer((_) async => null);
          // act
          final result = await repository.get(
            username: tUser,
            password: tPswd,
          );
          // assert
          verify(mockRemoteDataSource.getCalendarURL(
            username: tUser,
            password: tPswd,
          ));

          expect(result, equals(tRemoteUrl));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getCalendarURL(
            username: tUser,
            password: tPswd,
          )).thenAnswer((_) async => tRemoteUrl);
          when(mockLocalDataSource.saveCalendarURL(any))
              .thenAnswer((_) async => null);
          // act
          await repository.get(
            username: tUser,
            password: tPswd,
          );
          // assert
          verify(
              mockLocalDataSource.saveCalendarURL(argThat(equals(tRemoteUrl))));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getCalendarURL(
            username: anyNamed('username'),
            password: anyNamed('password'),
          )).thenAnswer((_) async => throw ServerException());
          // act
          final call = repository.get;
          // assert
          expect(
            call(
              username: tUser,
              password: tPswd,
            ),
            throwsA(isInstanceOf<ServerException>()),
          );
        },
      );
    });

    runTestsOffline(() {
      test(
        'should return last locally cached data when the cached data is present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastCalendarURL())
              .thenAnswer((_) async => tRemoteUrl);
          // act
          final result = await repository.get(
            username: tUser,
            password: tPswd,
          );
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.getLastCalendarURL());
          expect(result, equals(tRemoteUrl));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.getLastCalendarURL())
              .thenAnswer((_) async => throw CacheException());
          // act
          final call = repository.get;
          // assert
          expect(
            call(
              username: tUser,
              password: tPswd,
            ),
            throwsA(isInstanceOf<CacheException>()),
          );
        },
      );
    });
  });

  group('isSaved', () {
    test('return true when there is one in cache', () async {
      // arrange
      when(mockLocalDataSource.getLastCalendarURL())
          .thenAnswer((_) async => tRemoteUrl);
      // act
      final result = await repository.isSaved;
      // assert
      verify(mockLocalDataSource.getLastCalendarURL());
      expect(result, true);
    });

    test('return false when there is none in cache', () async {
      // arrange
      when(mockLocalDataSource.getLastCalendarURL())
          .thenAnswer((_) async => throw CacheException());
      // act
      final result = await repository.isSaved;
      // assert
      expect(result, false);
    });
  });
}

class MockRemoteDataSource extends Mock implements CalendarURLRemoteDataSource {
}

class MockLocalDataSource extends Mock implements CalendarURLLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
