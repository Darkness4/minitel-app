import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/cookies/cookie_manager.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/utils/cookie_utils.dart';
import 'package:minitel_toolbox/data/datasources/emse/portail_emse_remote_data_source.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  PortailEMSERemoteDataSource dataSource;
  MockHttpClient mockHttpClient;
  MockListCookies mockListCookies;
  MockCookieManager mockCookieManager;
  const tUser = 'marc.nguyen';
  const tPassword = 'abcdefgh';

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockListCookies = MockListCookies();
    mockCookieManager = MockCookieManager();

    when(mockCookieManager.portailCookies).thenReturn(mockListCookies);
    dataSource = PortailEMSERemoteDataSourceImpl(
      client: mockHttpClient,
      cookieManager: mockCookieManager,
    );
  });

  void setUpMockHttpClientSuccess200() {
    when(mockListCookies.addAll(any)).thenReturn(null);

    when(
      mockHttpClient.get(
        'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response0.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response0.json'))
              as Map<String, dynamic>),
        ));

    when(mockHttpClient.send(any)).thenAnswer((realInvocation) async {
      final request = realInvocation.positionalArguments[0] as http.Request;

      if (request.method == 'POST' &&
          request.url.toString() ==
              'https://cas.emse.fr/login;jsessionid=28F55541F17E7697C445DE5CB8366B59?service=https%3A%2F%2Fportail.emse.fr%2Flogin') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response1.html'))),
          302,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response1.json'))
              as Map<String, dynamic>),
        );
      } else if (request.method == 'GET' &&
          request.url.toString() ==
              'https://portail.emse.fr/login?ticket=ST-44381-5FcocqYP4qcebfFMsvso-cas1.emse.fr') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response2.html'))),
          302,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response2.json'))
              as Map<String, dynamic>),
        );
      } else {
        return null;
      }
    });

    when(
      mockHttpClient.get(
        'https://portail.emse.fr/login',
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response3.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response3.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientBadLogin() {
    when(mockListCookies.addAll(any)).thenReturn(null);

    when(
      mockHttpClient.get(
        'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response0.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response0.json'))
              as Map<String, dynamic>),
        ));

    when(mockHttpClient.send(any)).thenAnswer((realInvocation) async {
      final request = realInvocation.positionalArguments[0] as http.Request;

      if (request.method == 'POST' &&
          request.url.toString() ==
              'https://cas.emse.fr/login;jsessionid=28F55541F17E7697C445DE5CB8366B59?service=https%3A%2F%2Fportail.emse.fr%2Flogin') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response1.html'))),
          302,
          headers: {HttpHeaders.setCookieHeader: ''},
        );
      } else if (request.method == 'GET' &&
          request.url.toString() ==
              'https://portail.emse.fr/login?ticket=ST-44381-5FcocqYP4qcebfFMsvso-cas1.emse.fr') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response2.html'))),
          302,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response2.json'))
              as Map<String, dynamic>),
        );
      } else {
        return null;
      }
    });

    when(
      mockHttpClient.get(
        'https://portail.emse.fr/login',
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response3.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response3.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientFailure404Case1() {
    when(mockHttpClient.get(
      'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
    )).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  void setUpMockHttpClientFailure404Case2() {
    when(mockListCookies.addAll(any)).thenReturn(null);

    when(
      mockHttpClient.get(
        'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response0.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response0.json'))
              as Map<String, dynamic>),
        ));
    when(mockHttpClient.send(any)).thenAnswer((realInvocation) async {
      final request = realInvocation.positionalArguments[0] as http.Request;

      if (request.method == 'POST' &&
          request.url.toString() ==
              'https://cas.emse.fr/login;jsessionid=28F55541F17E7697C445DE5CB8366B59?service=https%3A%2F%2Fportail.emse.fr%2Flogin') {
        return http.StreamedResponse(
            Stream.value(utf8.encode('Something went wrong')), 404);
      } else {
        return null;
      }
    });
  }

  void setUpMockHttpClientFailure404Case3() {
    when(mockListCookies.addAll(any)).thenReturn(null);

    when(
      mockHttpClient.get(
        'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response0.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response0.json'))
              as Map<String, dynamic>),
        ));
    when(mockHttpClient.send(any)).thenAnswer((realInvocation) async {
      final capturedRequest =
          realInvocation.positionalArguments[0] as http.Request;
      if (capturedRequest.method == 'POST' &&
          capturedRequest.url.toString() ==
              'https://cas.emse.fr/login;jsessionid=28F55541F17E7697C445DE5CB8366B59?service=https%3A%2F%2Fportail.emse.fr%2Flogin') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response1.html'))),
          302,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response1.json'))
              as Map<String, dynamic>),
        );
      } else if (capturedRequest.method == 'GET' &&
          capturedRequest.url.toString() ==
              'https://portail.emse.fr/login?ticket=ST-44381-5FcocqYP4qcebfFMsvso-cas1.emse.fr') {
        return http.StreamedResponse(
            Stream.value(utf8.encode('Something went wrong')), 404);
      }
      return null;
    });
  }

  void setUpMockHttpClientFailure404Case4() {
    when(mockListCookies.addAll(any)).thenReturn(null);

    when(
      mockHttpClient.get(
        'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/portail_emse_remote_data_source/response0.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response0.json'))
              as Map<String, dynamic>),
        ));

    when(mockHttpClient.send(any)).thenAnswer((realInvocation) async {
      final request = realInvocation.positionalArguments[0] as http.Request;

      if (request.method == 'POST' &&
          request.url.toString() ==
              'https://cas.emse.fr/login;jsessionid=28F55541F17E7697C445DE5CB8366B59?service=https%3A%2F%2Fportail.emse.fr%2Flogin') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response1.html'))),
          302,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response1.json'))
              as Map<String, dynamic>),
        );
      } else if (request.method == 'GET' &&
          request.url.toString() ==
              'https://portail.emse.fr/login?ticket=ST-44381-5FcocqYP4qcebfFMsvso-cas1.emse.fr') {
        return http.StreamedResponse(
          Stream.value(utf8.encode(fixture(
              'datasources/portail_emse_remote_data_source/response2.html'))),
          302,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/portail_emse_remote_data_source/response2.json'))
              as Map<String, dynamic>),
        );
      } else {
        return null;
      }
    });

    when(
      mockHttpClient.get(
        'https://portail.emse.fr/login',
        headers: anyNamed('headers'),
      ),
    ).thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('login', () {
    test(
      'should perform a suite of requests',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.login(username: tUser, password: tPassword);
        // assert
        verify(mockHttpClient.get(
          'https://cas.emse.fr//login?service=https%3A%2F%2Fportail.emse.fr%2Flogin',
          headers: anyNamed('headers'),
        ));
        verify(
          mockHttpClient.send(any),
        );
      },
    );

    test(
      'should return [Cookies] when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result =
            await dataSource.login(username: tUser, password: tPassword);
        // assert
        final verification = verify(mockListCookies.addAll(captureAny));
        final actualCookies =
            (verification.captured.first as Iterable<Cookie>).toList();
        final expectedCookies = <Cookie>[];
        expectedCookies.addAll(Map<String, String>.from(json.decode(fixture(
                    'datasources/portail_emse_remote_data_source/response0.json'))
                as Map<String, dynamic>)
            .parseSetCookie());
        expectedCookies.addAll(Map<String, String>.from(json.decode(fixture(
                    'datasources/portail_emse_remote_data_source/response1.json'))
                as Map<String, dynamic>)
            .parseSetCookie());
        expectedCookies.addAll(Map<String, String>.from(json.decode(fixture(
                    'datasources/portail_emse_remote_data_source/response2.json'))
                as Map<String, dynamic>)
            .parseSetCookie());
        expectedCookies.addAll(Map<String, String>.from(json.decode(fixture(
                    'datasources/portail_emse_remote_data_source/response3.json'))
                as Map<String, dynamic>)
            .parseSetCookie());
        expect(expectedCookies.map((e) => e.toString()).toList(),
            containsAll(actualCookies.map<String>((e) => e.toString())));
        expect(result, equals(mockListCookies));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other in CASE 1',
      () async {
        // arrange
        setUpMockHttpClientFailure404Case1();
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(username: tUser, password: tPassword),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other in CASE 2',
      () async {
        // arrange
        setUpMockHttpClientFailure404Case2();
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(username: tUser, password: tPassword),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other in CASE 3',
      () async {
        // arrange
        setUpMockHttpClientFailure404Case3();
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(username: tUser, password: tPassword),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other in CASE 4',
      () async {
        // arrange
        setUpMockHttpClientFailure404Case4();
        // act
        final call = dataSource.login;
        // assert
        expect(() => call(username: tUser, password: tPassword),
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
        expect(() => call(username: tUser, password: tPassword),
            throwsA(isA<ClientException>()));
      },
    );
  });
}

class MockCookieManager extends Mock implements CookieManager {}

class MockHttpClient extends Mock implements http.Client {}

class MockListCookies extends Mock implements List<Cookie> {}
