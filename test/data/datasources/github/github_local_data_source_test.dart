import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:minitel_toolbox/data/datasources/github/github_local_data_source.dart';
import 'package:minitel_toolbox/domain/entities/github/release.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'github_local_data_source_test.mocks.dart';

class MockFile extends Mock implements File {
  @override
  bool existsSync() =>
      super.noSuchMethod(Invocation.method(#existsSync, []), returnValue: false)
          as bool;

  @override
  String readAsStringSync({Encoding encoding = utf8}) =>
      super.noSuchMethod(Invocation.method(#readAsStringSync, []),
          returnValue: '') as String;

  @override
  Future<File> writeAsString(String? contents,
          {FileMode mode = FileMode.write,
          Encoding encoding = utf8,
          bool flush = false}) =>
      super.noSuchMethod(
          Invocation.method(#writeAsString, [contents],
              {#mode: mode, #encoding: encoding, #flush: flush}),
          returnValue: Future.value(this)) as Future<File>;
}

@GenerateMocks([FileManager])
void main() {
  late GithubLocalDataSource dataSource;
  late MockFile mockFile;
  late MockFileManager mockFileManager;

  setUp(() {
    mockFile = MockFile();
    mockFileManager = MockFileManager();

    when(mockFileManager.releasesFile).thenAnswer((_) async => mockFile);
    when(mockFile.writeAsString(any)).thenAnswer((_) async => mockFile);
    dataSource = GithubLocalDataSourceImpl(
      fileManager: mockFileManager,
    );
  });

  group('fetchLastReleases', () {
    final tListGithubReleaseModel = List<
            Map<String, dynamic>>.from(json.decode(fixture(
                'datasources/github_remote_data_source/releases_response.json'))
            as List<dynamic>)
        .map((Map<String, dynamic> data) => GithubRelease.fromJson(data))
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
        when(mockFile.readAsStringSync()).thenReturn('');
        when(mockFile.existsSync()).thenReturn(false);
        // act
        final call = dataSource.fetchLastReleases;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheReleases', () {
    final tListGithubReleaseModel = List<
            Map<String, dynamic>>.from(json.decode(fixture(
                'datasources/github_remote_data_source/releases_response.json'))
            as List<dynamic>)
        .map((Map<String, dynamic> data) => GithubRelease.fromJson(data))
        .toList();

    test(
      'should call File to cache the data',
      () async {
        // act
        await dataSource.cacheReleases(tListGithubReleaseModel);
        // assert
        final expectedJsonString = json.encode(tListGithubReleaseModel
            .map((GithubRelease release) => release.toJson())
            .toList());
        verify(mockFile.writeAsString(
          expectedJsonString,
        ));
      },
    );
  });
}
