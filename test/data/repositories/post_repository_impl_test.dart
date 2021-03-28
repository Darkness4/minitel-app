import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/post_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';
import 'package:minitel_toolbox/domain/repositories/post_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_repository_impl_test.mocks.dart';

@GenerateMocks([
  NetworkInfo,
  Uri,
  DateTime
], customMocks: [
  MockSpec<TwitterRemoteDataSource>(as: #MockRemoteDataSource),
  MockSpec<TwitterLocalDataSource>(as: #MockLocalDataSource)
])
void main() {
  late PostRepository repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockLocalDataSource mockLocalDataSource;
  final tPosts = <Post>[
    Post(
      text: 'text',
      id_str: 'id_str',
      user_name: 'user_name',
      screen_name: 'screen_name',
      profile_image_url_https: MockUri(),
      url: MockUri(),
      created_at: MockDateTime(),
    ),
  ];

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = PostRepositoryImpl(
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

  group('fetchAll', () {
    test(
      'should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.result)
            .thenAnswer((_) async => ConnectivityResult.wifi);
        // act
        await repository.fetchAll();
        // assert
        verify(mockNetworkInfo.result);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchAllPosts())
              .thenAnswer((_) async => tPosts);
          // act
          final result = await repository.fetchAll();
          // assert
          verify(mockRemoteDataSource.fetchAllPosts());

          expect(result, equals(tPosts));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchAllPosts())
              .thenAnswer((_) async => tPosts);
          // act
          await repository.fetchAll();
          // assert
          verify(mockLocalDataSource.cacheAllPosts(argThat(equals(tPosts))));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchAllPosts())
              .thenAnswer((_) async => throw ServerException());
          // act
          final call = repository.fetchAll;
          // assert
          expect(
            call,
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
          when(mockLocalDataSource.fetchAllPosts())
              .thenAnswer((_) async => tPosts);
          // act
          final result = await repository.fetchAll();
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.fetchAllPosts());
          expect(result, equals(tPosts));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.fetchAllPosts())
              .thenAnswer((_) async => throw CacheException());
          // act
          final call = repository.fetchAll;
          // assert
          expect(
            call,
            throwsA(isInstanceOf<CacheException>()),
          );
        },
      );
    });
  });
}
