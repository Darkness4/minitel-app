import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar_builder.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../../../fixtures/fixture_reader.dart';
import 'icalendar_local_data_source_test.mocks.dart';

class MockFile extends Mock implements File {
  @override
  bool existsSync() =>
      super.noSuchMethod(Invocation.method(#existsSync, []), returnValue: false)
          as bool;

  @override
  Stream<List<int>> openRead([int? start, int? end]) =>
      super.noSuchMethod(Invocation.method(#openRead, [start, end]),
          returnValue: const Stream<List<int>>.empty()) as Stream<List<int>>;

  @override
  IOSink openWrite(
          {FileMode mode = FileMode.write, Encoding encoding = utf8}) =>
      super.noSuchMethod(
          Invocation.method(#openWrite, [], {#mode: mode, #encoding: encoding}),
          returnValue: MockIOSink()) as IOSink;
}

@GenerateMocks([FileManager, IOSink])
void main() {
  late ICalendarLocalDataSource dataSource;
  late MockFile mockFile;
  late MockFileManager mockFileManager;
  late MockIOSink mockIOSink;

  setUp(() {
    mockFile = MockFile();
    mockIOSink = MockIOSink();
    mockFileManager = MockFileManager();

    when(mockFileManager.icalendarFile).thenAnswer((_) async => mockFile);
    dataSource = ICalendarLocalDataSourceImpl(
      fileManager: mockFileManager,
    );
    tz.initializeTimeZones();
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
        final builder = ParsedCalendarBuilder();
        await builder.fromStream(expectedICalendar.transform(utf8.decoder));
        final expectedParsedCalendarModel = builder.build();
        verify(mockFile.openRead());
        expect(result, equals(expectedParsedCalendarModel));
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
        expect(call, throwsA(isA<CacheException>()));
      },
    );
  });

  group('cacheICalendar', () {
    final tData = utf8.encode(fixture(
        'datasources/icalendar_data_source/773debe2a985c93f612e72894e4e11b900b64419.ics'));
    final tICalendar = Stream.value(tData).asBroadcastStream();

    test(
      'should call File.openWrite to cache the data',
      () async {
        // arrange
        when(mockFile.openWrite()).thenReturn(mockIOSink);
        when(mockIOSink.write(any)).thenReturn(null);
        when(mockIOSink.close()).thenAnswer((realInvocation) async => null);
        // act
        await dataSource.cacheICalendar(tICalendar);
        // assert
        verify(mockIOSink.add(tData));
      },
    );
  });
}
