import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/models/icalendar/parsed_calendar_model.dart';
import 'package:mockito/mockito.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  ICalendarLocalDataSource dataSource;
  MockFile mockFile;
  MockIOSink mockIOSink;

  setUp(() {
    mockFile = MockFile();
    mockIOSink = MockIOSink();
    dataSource = ICalendarLocalDataSourceImpl(
      file: mockFile,
    );
  });

  group('getParsedCalendar', () {
    test(
      'should return ParsedCalendarModel from File when there is one in the cache',
      () async {
        // arrange
        final tICalendar = Stream.value(utf8.encode(fixture(
            'datasources/icalendar_data_source/773debe2a985c93f612e72894e4e11b900b64419.ics')));
        when<bool>(mockFile.existsSync()).thenReturn(true);
        when(mockFile.openRead()).thenAnswer((_) => tICalendar);
        // act
        final result = await dataSource.getParsedCalendar();
        // assert
        final expectedICalendar = Stream.value(utf8.encode(fixture(
            'datasources/icalendar_data_source/773debe2a985c93f612e72894e4e11b900b64419.ics')));
        final expectedParsedCalendarModel = ParsedCalendarModel.parse(
            expectedICalendar.transform(utf8.decoder));
        verify(mockFile.openRead());
        expect(result, equals(await expectedParsedCalendarModel));
      },
    );

    test(
      'should throw a CacheExeption when there is not a cached value',
      () async {
        // arrange
        when<bool>(mockFile.existsSync()).thenReturn(false);
        // act
        final call = dataSource.getParsedCalendar();
        // assert
        expect(call, throwsA(const TypeMatcher<CacheException>()));
      },
    );
  });

  group('cacheICalendar', () {
    final tData = fixture(
        'datasources/icalendar_data_source/773debe2a985c93f612e72894e4e11b900b64419.ics');
    final tICalendar = Stream.value(tData).asBroadcastStream();

    test(
      'should call File.openWrite to cache the data',
      () async {
        // arrange
        when(mockFile.openWrite()).thenReturn(mockIOSink);
        when(mockIOSink.write(any)).thenReturn(null);
        when(mockIOSink.close()).thenReturn(null);
        // act
        await dataSource.cacheICalendar(tICalendar);
        // assert
        final String expectedString = tData;
        verify(mockIOSink.write(
          expectedString,
        ));
      },
    );
  });
}

class MockFile extends Mock implements File {}

class MockIOSink extends Mock implements IOSink {}
