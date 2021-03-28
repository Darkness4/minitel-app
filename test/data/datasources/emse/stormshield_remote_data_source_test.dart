import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/emse/stormshield_remote_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';
import 'stormshield_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late StormshieldRemoteDataSource dataSource;
  late MockClient mockHttpClient;
  const tUser = 'marc.nguyen';
  const tPassword = 'abcdefgh';
  const tSelectedUrl = '1.1.1.1';
  const tSelectedTime = 240;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = StormshieldRemoteDataSourceImpl(
      client: mockHttpClient,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(
      mockHttpClient.post(Uri.https(tSelectedUrl, 'auth/login.html')),
    ).thenAnswer((_) async => http.Response(
          fixture(
              'datasources/stormshield_remote_data_source/response_fetch.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/stormshield_remote_data_source/response_fetch.json'))
              as Map<String, dynamic>),
        ));

    when(
      mockHttpClient.post(
        Uri.https(tSelectedUrl, 'auth/plain.html'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture(
              'datasources/stormshield_remote_data_source/response_login.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/stormshield_remote_data_source/response_login.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
    when(mockHttpClient.post(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
    when(mockHttpClient.post(
      any,
      body: anyNamed('body'),
      headers: anyNamed('headers'),
    )).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  void setUpMockHttpClientBadLogin() {
    when(
      mockHttpClient.post(any),
    ).thenAnswer((_) async => http.Response(
          fixture(
              'datasources/stormshield_remote_data_source/response_fetch.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/stormshield_remote_data_source/response_fetch.json'))
              as Map<String, dynamic>),
        ));

    when(
      mockHttpClient.post(
        Uri.parse('https://$tSelectedUrl/auth/plain.html'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/stormshield_remote_data_source/failed.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/stormshield_remote_data_source/response_login.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientNotLoggedIn() {
    when(
      mockHttpClient.post(Uri.parse('https://$tSelectedUrl/auth/login.html')),
    ).thenAnswer((_) async => http.Response(
          fixture(
              'datasources/stormshield_remote_data_source/not_logged_in.html'),
          200,
          headers: {},
        ));

    when(
      mockHttpClient.post(
        Uri.parse('https://$tSelectedUrl/auth/plain.html'),
        body: anyNamed('body'),
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture(
              'datasources/stormshield_remote_data_source/response_login.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/stormshield_remote_data_source/response_login.json'))
              as Map<String, dynamic>),
        ));
  }

  group('login', () {
    test(
      'should perform a POST request',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.login(
          uid: tUser,
          pswd: tPassword,
          selectedTime: tSelectedTime,
          selectedUrl: tSelectedUrl,
        );
        // assert
        verify(mockHttpClient.post(
          argThat(equals(Uri.https(tSelectedUrl, 'auth/plain.html'))),
          body: {
            'uid': tUser,
            'time': tSelectedTime.toString(),
            'pswd': tPassword,
          },
          headers: anyNamed('headers'),
        ));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.login;
        // assert
        expect(
            () => call(
                  uid: tUser,
                  pswd: tPassword,
                  selectedTime: tSelectedTime,
                  selectedUrl: tSelectedUrl,
                ),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ClientException when Bad Login',
      () async {
        // arrange
        setUpMockHttpClientBadLogin();
        // act
        final call = dataSource.login;
        // assert
        expect(
            () => call(
                  uid: tUser,
                  pswd: tPassword,
                  selectedTime: tSelectedTime,
                  selectedUrl: tSelectedUrl,
                ),
            throwsA(isA<ClientException>()));
      },
    );
  });

  group('fetchStatus', () {
    test(
      'should perform a GET request on a URL with tSelectedUrl being the endpoint',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.fetchStatus(tSelectedUrl);
        // assert
        verify(await mockHttpClient
            .post(Uri.parse('https://$tSelectedUrl/auth/login.html')));
      },
    );

    test(
      'should return [status] when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.fetchStatus(tSelectedUrl);
        // assert
        expect(result, equals('13424'));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.fetchStatus;
        // assert
        expect(() => call(tSelectedUrl), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a NotLoggedInException when Not Logged in',
      () async {
        // arrange
        setUpMockHttpClientNotLoggedIn();
        // act
        final call = dataSource.fetchStatus;
        // assert
        expect(() => call(tSelectedUrl), throwsA(isA<NotLoggedInException>()));
      },
    );
  });
}
