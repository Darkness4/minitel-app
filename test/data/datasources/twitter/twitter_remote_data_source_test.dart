import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/constants/api_keys.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/twitter/twitter_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/twitter/post.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'twitter_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late TwitterRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;
  late StringBuffer tokenBuffer;

  setUp(() {
    mockHttpClient = MockClient();
    tokenBuffer = StringBuffer();
    dataSource = TwitterRemoteDataSourceImpl(
      client: mockHttpClient,
      tokenBuffer: tokenBuffer,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.post(
      Uri.parse('https://api.twitter.com/oauth2/token'),
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response(
          json.encode({'access_token': 'token'}),
          200,
        ));
    when(mockHttpClient.get(
      argThat(startsWith(
          'https://api.twitter.com/1.1/statuses/user_timeline.json')),
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response(
          fixture('datasources/twitter_remote_data_source/feed_response.json'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/twitter_remote_data_source/feed_header.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(
      any,
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response('Something went wrong', 404));
    when(mockHttpClient.post(
      any,
      headers: anyNamed('headers'),
      body: anyNamed('body'),
    )).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('fetchFeed', () {
    final tPosts = (json.decode(fixture(
                'datasources/twitter_remote_data_source/feed_response.json'))
            as List<dynamic>)
        .map((dynamic data) => Post.fromMap(data as Map<String, dynamic>))
        .toList();

    test(
      'should perform a GET request',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.fetchAllPosts();
        // assert
        verify(mockHttpClient.get(
          argThat(startsWith(
              'https://api.twitter.com/1.1/statuses/user_timeline.json')),
          headers: {
            HttpHeaders.authorizationHeader: 'Bearer token',
          },
        ));
      },
    );

    test(
      'should return FeedModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.fetchAllPosts();
        // assert
        expect(result, equals(tPosts));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.fetchAllPosts;
        // assert
        expect(call, throwsA(isA<ServerException>()));
      },
    );
  });

  group('getBearerToken', () {
    test(
      'should perform a POST request',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.getBearerToken();
        // assert
        final authorization = base64.encode(
            utf8.encode('${ApiKeys.consumerKey}:${ApiKeys.consumerSecret}'));
        verify(mockHttpClient.post(
          Uri.parse('https://api.twitter.com/oauth2/token'),
          headers: {
            HttpHeaders.authorizationHeader: 'Basic $authorization',
          },
          body: {'grant_type': 'client_credentials'},
        ));
      },
    );

    test(
      'should return FeedModel when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getBearerToken();
        // assert
        expect(result, equals('token'));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getBearerToken;
        // assert
        expect(call, throwsA(isA<ServerException>()));
      },
    );
  });
}
