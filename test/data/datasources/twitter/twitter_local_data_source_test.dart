import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'twitter_local_data_source_test.mocks.dart';

@GenerateMocks([FileManager])
void main() {
  late TwitterLocalDataSource dataSource;
  late MockFile mockFile;
  late MockFileManager mockFileManager;

  setUp(() {
    mockFile = MockFile();
    mockFileManager = MockFileManager();

    when(mockFileManager.feedFile).thenAnswer((_) async => mockFile);
    dataSource = TwitterLocalDataSourceImpl(
      fileManager: mockFileManager,
    );
  });

  group('fetchAllPosts', () {
    final tPosts = (json.decode(fixture(
                'datasources/twitter_remote_data_source/feed_response.json'))
            as List<dynamic>)
        .map((dynamic data) => Post.fromMap(data as Map<String, dynamic>))
        .toList();
    test(
      'should return FeedModel from File when there is one in the cache',
      () async {
        // arrange
        when(mockFile.existsSync()).thenReturn(true);
        when<String>(mockFile.readAsStringSync()).thenReturn(fixture(
            'datasources/twitter_remote_data_source/feed_response.json'));
        // act
        final result = await dataSource.fetchAllPosts();
        // assert
        verify(mockFile.readAsStringSync());
        expect(result, equals(tPosts));
      },
    );

    test(
      'should throw a CacheException when there is not a cached value',
      () async {
        // arrange
        when(mockFile.readAsStringSync()).thenReturn('');
        when(mockFile.existsSync()).thenReturn(false);
        // act
        final call = dataSource.fetchAllPosts;
        // assert
        expect(() => call(), throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheFeed', () {
    final tPosts = (json.decode(fixture(
                'datasources/twitter_remote_data_source/feed_response.json'))
            as List<dynamic>)
        .map((dynamic data) => Post.fromMap(data as Map<String, dynamic>))
        .toList();

    test(
      'should call File to cache the data',
      () async {
        // act
        await dataSource.cacheAllPosts(tPosts);
        // assert
        final expectedJsonString =
            json.encode(tPosts.map((Post post) => post.toJson()).toList());
        verify(mockFile.writeAsString(
          expectedJsonString,
        ));
      },
    );
  });
}

class MockFile extends Mock implements File {}
