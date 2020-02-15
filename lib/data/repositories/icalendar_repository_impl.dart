import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

class ICalendarRepositoryImpl implements ICalendarRepository {
  final ICalendarLocalDataSource localDataSource;
  final ICalendarRemoteDataSource remoteDataSource;
  final CalendarURLRepository calendarURLRepository;

  const ICalendarRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.calendarURLRepository,
  });

  @override
  Future<ParsedCalendar> get parsedCalendar =>
      localDataSource.getParsedCalendar();

  @override
  Future<void> download({
    @required String username,
    @required String password,
  }) async {
    final String url =
        await calendarURLRepository.get(username: username, password: password);
    final Stream<String> data = remoteDataSource.streamICalendar(url);
    return localDataSource.cacheICalendar(data);
  }
}
