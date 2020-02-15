import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/github/github_remote_data_source.dart';
import 'package:minitel_toolbox/data/models/github/release_model.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  GithubRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;
  const String tRepo = 'Darkness4/minitel-app';

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = GithubRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(
      argThat(startsWith('https://api.github.com/repos/')),
    )).thenAnswer((_) async => http.Response(
          fixture(
              'datasources/github_remote_data_source/releases_response.json'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/github_remote_data_source/releases_header.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('fetchReleases', () {
    final tListGithubReleaseModel = List<
            Map<String, dynamic>>.from(json.decode(fixture(
                'datasources/github_remote_data_source/releases_response.json'))
            as List<dynamic>)
        .map((Map<String, dynamic> data) => GithubReleaseModel.fromJson(data))
        .toList();

    test(
      "should perform a GET request on a URL with tRepo being the endpoint",
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.fetchReleases(tRepo);
        // assert
        verify(mockHttpClient.get(
          'https://api.github.com/repos/$tRepo/releases',
        ));
      },
    );

    test(
      'should return ListGithubRelease when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.fetchReleases(tRepo);
        // assert
        expect(result, equals(tListGithubReleaseModel));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.fetchReleases;
        // assert
        expect(() => call(tRepo), throwsA(isA<ServerException>()));
      },
    );
  });
}

class MockHttpClient extends Mock implements http.Client {}
