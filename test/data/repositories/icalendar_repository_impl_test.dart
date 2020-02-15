import 'package:flutter_test/flutter_test.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/data/models/icalendar/parsed_calendar_model.dart';
import 'package:minitel_toolbox/data/repositories/icalendar_repository_impl.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';
import 'package:mockito/mockito.dart';

void main() {
  ICalendarRepository repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockCalendarURLRepository mockCalendarURLRepository;
  final tICalendar = Stream.value("ICalendar");
  const tUser = "user";
  const tPswd = "pswd";
  const tUrl = "https://localhost/";

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockCalendarURLRepository = MockCalendarURLRepository();
    repository = ICalendarRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      calendarURLRepository: mockCalendarURLRepository,
    );
  });

  group('download', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        // arrange
        when(mockCalendarURLRepository.get(
          username: tUser,
          password: tPswd,
        )).thenAnswer((_) async => tUrl);
        when(mockRemoteDataSource.streamICalendar(tUrl))
            .thenAnswer((_) => tICalendar);
        when(mockLocalDataSource.cacheICalendar(any))
            .thenAnswer((_) async => null);
        // act
        await repository.download(
          password: tPswd,
          username: tUser,
        );
        // assert
        verify(mockCalendarURLRepository.get(
          username: tUser,
          password: tPswd,
        ));
        verify(mockRemoteDataSource.streamICalendar(tUrl));
        verify(mockLocalDataSource.cacheICalendar(tICalendar));
      },
    );
  });

  group('parsedCalendar', () {
    const ParsedCalendarModel tParsedCalendarModel = ParsedCalendarModel();
    const ParsedCalendar tParsedCalendar = ParsedCalendarModel();
    test(
      'should call localDataSource',
      () async {
        // arrange
        when(mockLocalDataSource.getParsedCalendar())
            .thenAnswer((_) async => tParsedCalendarModel);
        // act
        final result = await repository.parsedCalendar;

        // assert
        verify(mockLocalDataSource.getParsedCalendar());
        expect(result, equals(tParsedCalendar));
      },
    );
  });
}

class MockRemoteDataSource extends Mock implements ICalendarRemoteDataSource {}

class MockLocalDataSource extends Mock implements ICalendarLocalDataSource {}

class MockCalendarURLRepository extends Mock implements CalendarURLRepository {}
