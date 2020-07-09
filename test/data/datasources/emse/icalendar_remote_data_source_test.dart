import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  ICalendarRemoteDataSource dataSource;
  MockHttpClient mockHttpClient;
  const tURL =
      'https://portail.emse.fr/ics/773debe2a985c93f612e72894e4e11b900b64419.ics';

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ICalendarRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.send(any))
        .thenAnswer((_) async => http.StreamedResponse(
              Stream.value(utf8.encode(fixture(
                  'datasources/icalendar_data_source/773debe2a985c93f612e72894e4e11b900b64419.ics'))),
              200,
            ));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.send(any)).thenAnswer((_) async =>
        http.StreamedResponse(
            Stream.value(utf8.encode('Something went wrong')), 404));
  }

  void setUpMockHttpClientFailure() {
    when(mockHttpClient.send(any))
        .thenAnswer((_) async => throw Exception('Mock error'));
  }

  group('streamICalendar', () {
    test(
      'should perform a GET request',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        await dataSource.streamICalendar(tURL).drain<String>();
        // assert
        final verification = verify(
          mockHttpClient.send(captureThat(isA<http.BaseRequest>())),
        );
        final capturedRequest = verification.captured.first as http.Request;
        expect(capturedRequest.url.toString(), equals(tURL));
      },
    );

    test(
      'should return [icalendar] when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        final tICalendar = fixtureBytes(
            'datasources/icalendar_data_source/773debe2a985c93f612e72894e4e11b900b64419.ics');
        // act
        final result = await dataSource.streamICalendar(tURL).fold<List<int>>(
            <int>[], (previous, element) => previous + element);
        // assert
        expect(result, equals(tICalendar));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.streamICalendar;
        // assert
        expect(
            () => call(tURL).drain<String>(), throwsA(isA<ServerException>()));
      },
    );

    test(
      'should throw a ServerException when Client crash',
      () async {
        // arrange
        setUpMockHttpClientFailure();
        // act
        final call = dataSource.streamICalendar;
        // assert
        expect(
            () => call(tURL).drain<String>(), throwsA(isA<ServerException>()));
      },
    );
  });
}

class MockHttpClient extends Mock implements http.Client {}
