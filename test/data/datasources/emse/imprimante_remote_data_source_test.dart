import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/cookies/cookie_manager.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';
import 'package:minitel_toolbox/data/datasources/emse/imprimante_remote_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:ntlm/ntlm.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  ImprimanteRemoteDataSource dataSource;
  MockNTLMClient mockNTLMClient;
  MockListCookies mockListCookies;
  MockCookieManager mockCookieManager;
  const tUser = 'marc.nguyen';
  const tPassword = 'abcdefgh';

  setUp(() {
    mockNTLMClient = MockNTLMClient();
    mockListCookies = MockListCookies();
    mockCookieManager = MockCookieManager();

    when(mockCookieManager.imprimanteCookies).thenReturn(mockListCookies);
    dataSource = ImprimanteRemoteDataSourceImpl(
      ntlmClient: mockNTLMClient,
      cookieManager: mockCookieManager,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(
      mockNTLMClient.get('http://192.168.130.2/watchdoc/'),
    ).thenAnswer((_) async => Response(
          fixture('datasources/imprimante_remote_data_source/response0.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/imprimante_remote_data_source/response0.json'))
              as Map<String, dynamic>),
        ));
    when(mockListCookies.addAll(any)).thenReturn(null);
  }

  void setUpMockHttpClientFailure404() {
    when(mockNTLMClient.get(any))
        .thenAnswer((_) async => Response('Something went wrong', 404));
  }

  void setUpMockHttpClientFailure() {
    when(mockNTLMClient.get(any))
        .thenAnswer((_) async => throw Exception('Mock error'));
  }

  group('login', () {
    test(
      'should perform a GET request',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.login(username: tUser, password: tPassword);
        // assert
        verify(mockNTLMClient.get(
          'http://192.168.130.2/watchdoc/',
          headers: anyNamed('headers'),
        ));
      },
    );

    test(
      'should return [cookie] when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final cookies =
            await dataSource.login(username: tUser, password: tPassword);
        // assert
        final headers = Map<String, String>.from(json.decode(fixture(
                'datasources/imprimante_remote_data_source/response0.json'))
            as Map<String, dynamic>);

        final verification =
            verify(mockListCookies.addAll(captureThat(isA<List<Cookie>>())));
        final actualCookies = verification.captured.first as List<Cookie>;
        final expectedCookies = headers.parseSetCookie();
        expect(cookies, equals(mockListCookies));
        expect(actualCookies.map((e) => e.toString()),
            equals(expectedCookies.map((e) => e.toString())));
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
        expect(() => call(username: tUser, password: tPassword),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ServerException when Client crash',
      () async {
        // arrange
        setUpMockHttpClientFailure();
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(username: tUser, password: tPassword),
            throwsA(isA<ServerException>()));
      },
    );
  });
}

class MockCookieManager extends Mock implements CookieManager {}

class MockListCookies extends Mock implements List<Cookie> {}

class MockNTLMClient extends Mock implements NTLMClient {}
