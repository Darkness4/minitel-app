import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/calendar_url/calendar_url_remote_data_source.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  CalendarURLRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;
  const String tUser = 'marc.nguyen';
  const String tPassword = 'abcdefgh';

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = CalendarURLRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(
      mockHttpClient.get(
          'https://cas.emse.fr/login?service=${Uri.encodeComponent("https://portail.emse.fr/ics/")}'),
    ).thenAnswer(
      (_) async => http.Response(
        fixture('datasources/calendar_url_remote_data_source/response0.html'),
        200,
        headers: Map<String, String>.from(json.decode(fixture(
                'datasources/calendar_url_remote_data_source/response0.json'))
            as Map<String, dynamic>),
      ),
    );

    final Map<String, String> data = {
      'username': 'marc.nguyen',
      'password': 'abcdefgh',
      'lt': 'LT-47000-PBHQEYqOvQgidUbfKaYJ2nVvlxGcXx-cas1.emse.fr',
      'execution': 'e1s1',
      '_eventId': 'submit',
    };

    when(
      mockHttpClient.post(
        'https://cas.emse.fr/login;jsessionid=2480F8BEBC9CA6A49A210B450AFEA2F9?service=${Uri.encodeComponent("https://portail.emse.fr/ics/")}',
        body: data,
        headers: anyNamed("headers"),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        fixture('datasources/calendar_url_remote_data_source/response1.html'),
        200,
        headers: Map<String, String>.from(json.decode(fixture(
                'datasources/calendar_url_remote_data_source/response1.json'))
            as Map<String, dynamic>),
      ),
    );

    when(mockHttpClient.send(argThat(const TypeMatcher<http.BaseRequest>())))
        .thenAnswer(
      (_) async => http.StreamedResponse(
        Stream.value(utf8.encode(fixture(
            'datasources/calendar_url_remote_data_source/response2.html'))),
        200,
        headers: Map<String, String>.from(json.decode(fixture(
                'datasources/calendar_url_remote_data_source/response2.json'))
            as Map<String, dynamic>),
      ),
    );

    when(
      mockHttpClient.get(
        "https://portail.emse.fr/ics/",
        headers: {
          HttpHeaders.cookieHeader:
              "PHPSESSID=ST-40612-FcvunQKSxT4c0Cp9f0i7-cas1emsefr"
        },
      ),
    ).thenAnswer((_) async => http.Response(
          fixture('datasources/calendar_url_remote_data_source/response3.html'),
          200,
          headers: Map<String, String>.from(json.decode(fixture(
                  'datasources/calendar_url_remote_data_source/response3.json'))
              as Map<String, dynamic>),
        ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
    when(mockHttpClient.post(any))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
    when(mockHttpClient.send(any)).thenAnswer((_) async =>
        http.StreamedResponse(
            Stream.value(utf8.encode('Something went wrong')), 404));
  }

  void setUpMockHttpClientBadLogin() {
    when(
      mockHttpClient.get(
          'https://cas.emse.fr/login?service=${Uri.encodeComponent("https://portail.emse.fr/ics/")}'),
    ).thenAnswer(
      (_) async => http.Response(
        fixture('datasources/calendar_url_remote_data_source/response0.html'),
        200,
        headers: Map<String, String>.from(json.decode(fixture(
                'datasources/calendar_url_remote_data_source/response0.json'))
            as Map<String, dynamic>),
      ),
    );

    final Map<String, String> data = {
      'username': 'marc.nguyen',
      'password': 'abcdefgh',
      'lt': 'LT-47000-PBHQEYqOvQgidUbfKaYJ2nVvlxGcXx-cas1.emse.fr',
      'execution': 'e1s1',
      '_eventId': 'submit',
    };

    when(
      mockHttpClient.post(
        'https://cas.emse.fr/login;jsessionid=2480F8BEBC9CA6A49A210B450AFEA2F9?service=${Uri.encodeComponent("https://portail.emse.fr/ics/")}',
        body: data,
        headers: anyNamed("headers"),
      ),
    ).thenAnswer(
      (_) async => http.Response(
        fixture('datasources/calendar_url_remote_data_source/response1.html'),
        200,
        headers: Map<String, String>.from(json.decode(fixture(
                'datasources/calendar_url_remote_data_source/response1.json'))
            as Map<String, dynamic>)
          ..remove(HttpHeaders.locationHeader),
      ),
    );
  }

  group('getCalendarURL', () {
    test(
      "should perform a GET CAS request, then a POST CAS, then a GET location, then a GET portail",
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.getCalendarURL(username: tUser, password: tPassword);
        // assert
        verify(mockHttpClient.get(
          'https://cas.emse.fr/login?service=${Uri.encodeComponent("https://portail.emse.fr/ics/")}',
          headers: anyNamed("headers"),
        ));
        verify(mockHttpClient.post(
          'https://cas.emse.fr/login;jsessionid=2480F8BEBC9CA6A49A210B450AFEA2F9?service=${Uri.encodeComponent("https://portail.emse.fr/ics/")}',
          body: anyNamed("body"),
          encoding: anyNamed("encoding"),
          headers: anyNamed("headers"),
        ));
        final verification = verify(
          mockHttpClient
              .send(captureThat(const TypeMatcher<http.BaseRequest>())),
        );
        final http.Request capturedRequest =
            verification.captured.first as http.Request;
        expect(
          capturedRequest.url.toString(),
          equals(
            "https://portail.emse.fr/ics/?ticket=ST-40612-FcvunQKSxT4c0Cp9f0i7-cas1.emse.fr",
          ),
        );
        verify(
          mockHttpClient.get(
            "https://portail.emse.fr/ics/",
            headers: anyNamed("headers"),
          ),
        );
      },
    );

    test(
      'should return [calendar URL] when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        const String tCalendarURL =
            'https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics';
        // act
        final String result = await dataSource.getCalendarURL(
            username: tUser, password: tPassword);
        // assert
        expect(result, equals(tCalendarURL));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getCalendarURL;
        // assert
        expect(() => call(username: tUser, password: tPassword),
            throwsA(const TypeMatcher<ServerException>()));
      },
    );

    test(
      'should throw a CLientException when there is a Bad login',
      () async {
        // arrange
        setUpMockHttpClientBadLogin();
        // act
        final call = dataSource.getCalendarURL;
        // assert
        expect(() => call(username: tUser, password: tPassword),
            throwsA(const TypeMatcher<ClientException>()));
      },
    );
  });
}

class MockHttpClient extends Mock implements http.Client {}
