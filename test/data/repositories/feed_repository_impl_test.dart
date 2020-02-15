import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_remote_data_source.dart';
import 'package:minitel_toolbox/data/models/twitter/feed_model.dart';
import 'package:minitel_toolbox/data/repositories/feed_repository_impl.dart';
import 'package:minitel_toolbox/domain/repositories/feed_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  FeedRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockLocalDataSource mockLocalDataSource;
  const tFeed = FeedModel(posts: []);

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = FeedRepositoryImpl(
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
        when(mockRemoteDataSource.fetchFeed()).thenAnswer((_) async => null);
        when(mockLocalDataSource.cacheFeed(any)).thenAnswer((_) async => null);
        // act
        await repository.get();
        // assert
        verify(mockNetworkInfo.result);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchFeed()).thenAnswer((_) async => tFeed);
          when(mockLocalDataSource.cacheFeed(any))
              .thenAnswer((_) async => null);
          // act
          final result = await repository.get();
          // assert
          verify(mockRemoteDataSource.fetchFeed());

          expect(result, equals(tFeed));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchFeed()).thenAnswer((_) async => tFeed);
          when(mockLocalDataSource.cacheFeed(any))
              .thenAnswer((_) async => null);
          // act
          await repository.get();
          // assert
          verify(mockLocalDataSource.cacheFeed(argThat(equals(tFeed))));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchFeed())
              .thenAnswer((_) async => throw ServerException());
          // act
          final call = repository.get;
          // assert
          expect(
            call(),
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
          when(mockLocalDataSource.fetchLastFeed())
              .thenAnswer((_) async => tFeed);
          // act
          final result = await repository.get();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.fetchLastFeed());
          expect(result, equals(tFeed));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.fetchLastFeed())
              .thenAnswer((_) async => throw CacheException());
          // act
          final call = repository.get;
          // assert
          expect(
            call(),
            throwsA(isInstanceOf<CacheException>()),
          );
        },
      );
    });
  });
}

class MockRemoteDataSource extends Mock implements TwitterRemoteDataSource {}

class MockLocalDataSource extends Mock implements TwitterLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
