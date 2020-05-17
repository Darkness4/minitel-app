import 'package:connectivity/connectivity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/github/github_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/github/github_remote_data_source.dart';
import 'package:minitel_toolbox/data/repositories/releases_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:minitel_toolbox/domain/repositories/releases_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  ReleasesRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockLocalDataSource mockLocalDataSource;
  const tListGithubReleaseModel = <GithubRelease>[
    GithubRelease(
      assets: [],
      assets_url: "assets_url",
      author: null,
      body: "body",
      created_at: null,
      draft: false,
      html_url: "html_url",
      id: 0,
      name: "name",
      node_id: "node_id",
      prerelease: false,
      published_at: null,
      tag_name: "tag_name",
      tarball_url: "tarball_url",
      target_commitish: "target_commitish",
      upload_url: "upload_url",
      url: "url",
      zipball_url: "zipball_url",
    ),
  ];
  const tRepo = "name/repo";

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ReleasesRepositoryImpl(
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
        // act
        await repository.get(tRepo);
        // assert
        verify(mockNetworkInfo.result);
      },
    );

    runTestsOnline(() {
      test(
        'should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchReleases(tRepo))
              .thenAnswer((_) async => tListGithubReleaseModel);
          // act
          final result = await repository.get(tRepo);
          // assert
          verify(mockRemoteDataSource.fetchReleases(tRepo));

          expect(result, equals(tListGithubReleaseModel));
        },
      );

      test(
        'should cache the data locally when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchReleases(tRepo))
              .thenAnswer((_) async => tListGithubReleaseModel);
          // act
          await repository.get(tRepo);
          // assert
          verify(mockLocalDataSource
              .cacheReleases(argThat(equals(tListGithubReleaseModel))));
        },
      );

      test(
        'should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.fetchReleases(tRepo))
              .thenAnswer((_) async => throw ServerException());
          // act
          final call = repository.get;
          // assert
          expect(
            call(tRepo),
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
          when(mockLocalDataSource.fetchLastReleases())
              .thenAnswer((_) async => tListGithubReleaseModel);
          // act
          final result = await repository.get(tRepo);
          // assert
          verifyZeroInteractions(mockRemoteDataSource);
          verify(mockLocalDataSource.fetchLastReleases());
          expect(result, equals(tListGithubReleaseModel));
        },
      );

      test(
        'should return CacheFailure when there is no cached data present',
        () async {
          // arrange
          when(mockLocalDataSource.fetchLastReleases())
              .thenAnswer((_) async => throw CacheException());
          // act
          final call = repository.get;
          // assert
          expect(
            call(tRepo),
            throwsA(isInstanceOf<CacheException>()),
          );
        },
      );
    });
  });
}

class MockRemoteDataSource extends Mock implements GithubRemoteDataSource {}

class MockLocalDataSource extends Mock implements GithubLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}
