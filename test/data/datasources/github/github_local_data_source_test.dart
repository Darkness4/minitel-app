import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/github/github_local_data_source.dart';
import 'package:minitel_toolbox/data/models/github/release_model.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  GithubLocalDataSource dataSource;
  MockFile mockFile;

  setUp(() {
    mockFile = MockFile();
    dataSource = GithubLocalDataSourceImpl(
      file: mockFile,
    );
  });

  group('fetchLastReleases', () {
    final tListGithubReleaseModel = List<
            Map<String, dynamic>>.from(json.decode(fixture(
                'datasources/github_remote_data_source/releases_response.json'))
            as List<dynamic>)
        .map((Map<String, dynamic> data) => GithubReleaseModel.fromJson(data))
        .toList();
    test(
      'should return ListGithubRelease from File when there is one in the cache',
      () async {
        // arrange
        when(mockFile.existsSync()).thenReturn(true);
        when<String>(mockFile.readAsStringSync()).thenReturn(fixture(
            'datasources/github_remote_data_source/releases_response.json'));
        // act
        final result = await dataSource.fetchLastReleases();
        // assert
        verify(mockFile.readAsStringSync());
        expect(result, equals(tListGithubReleaseModel));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when(mockFile.readAsStringSync()).thenReturn(null);
        when(mockFile.existsSync()).thenReturn(false);
        // act
        final call = dataSource.fetchLastReleases;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('cacheReleases', () {
    final tListGithubReleaseModel = List<
            Map<String, dynamic>>.from(json.decode(fixture(
                'datasources/github_remote_data_source/releases_response.json'))
            as List<dynamic>)
        .map((Map<String, dynamic> data) => GithubReleaseModel.fromJson(data))
        .toList();

    test(
      'should call File to cache the data',
      () async {
        // act
        await dataSource.cacheReleases(tListGithubReleaseModel);
        // assert
        final expectedJsonString = json.encode(tListGithubReleaseModel
            .map((GithubReleaseModel release) => release.toJson())
            .toList());
        verify(mockFile.writeAsString(
          expectedJsonString,
        ));
      },
    );
  });
}

class MockFile extends Mock implements File {}
