import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_local_data_source.dart';
import 'package:minitel_toolbox/data/models/twitter/feed_model.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  TwitterLocalDataSource dataSource;
  MockFile mockFile;

  setUp(() {
    mockFile = MockFile();
    dataSource = TwitterLocalDataSourceImpl(
      file: mockFile,
    );
  });

  group('fetchLastFeed', () {
    final tFeedModel = FeedModel.fromJson(
        json.decode(fixture('twitter_remote_data_source/feed_response.json'))
            as List<dynamic>);
    test(
      'should return FeedModel from File when there is one in the cache',
      () async {
        // arrange
        when(mockFile.existsSync()).thenReturn(true);
        when<String>(mockFile.readAsStringSync()).thenReturn(
            fixture('twitter_remote_data_source/feed_response.json'));
        // act
        final result = await dataSource.fetchLastFeed();
        // assert
        verify(mockFile.readAsStringSync());
        expect(result, equals(tFeedModel));
      },
    );

    test(
      'should throw a CacheException when there is not a cached value',
      () async {
        // arrange
        when(mockFile.readAsStringSync()).thenReturn(null);
        when(mockFile.existsSync()).thenReturn(false);
        // act
        final call = dataSource.fetchLastFeed;
        // assert
        expect(() => call(), throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('cacheFeed', () {
    final tFeedModel = FeedModel.fromJson(
        json.decode(fixture('twitter_remote_data_source/feed_response.json'))
            as List<dynamic>);

    test(
      'should call File to cache the data',
      () async {
        // act
        await dataSource.cacheFeed(tFeedModel);
        // assert
        final expectedJsonString = json.encode(tFeedModel);
        verify(mockFile.writeAsString(
          expectedJsonString,
        ));
      },
    );
  });
}

class MockFile extends Mock implements File {}
