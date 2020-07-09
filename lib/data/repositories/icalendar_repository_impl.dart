import 'package:connectivity/connectivity.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/network/network_info.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_local_data_source.dart';
import 'package:minitel_toolbox/data/datasources/emse/icalendar_remote_data_source.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/repositories/calendar_url_repository.dart';
import 'package:minitel_toolbox/domain/repositories/icalendar_repository.dart';

@LazySingleton(as: ICalendarRepository)
class ICalendarRepositoryImpl implements ICalendarRepository {
  final ICalendarLocalDataSource localDataSource;
  final ICalendarRemoteDataSource remoteDataSource;
  final CalendarURLRepository calendarURLRepository;
  final NetworkInfo networkInfo;

  const ICalendarRepositoryImpl({
    @required this.localDataSource,
    @required this.remoteDataSource,
    @required this.calendarURLRepository,
    @required this.networkInfo,
  });

  @override
  Future<ParsedCalendar> get parsedCalendar =>
      localDataSource.getParsedCalendar();

  @override
  Future<void> download({
    @required String username,
    @required String password,
  }) async {
    if (await networkInfo.result != ConnectivityResult.none) {
      final url = await calendarURLRepository.get(
        username: username,
        password: password,
      );
      final data = remoteDataSource.streamICalendar(url);
      return localDataSource.cacheICalendar(data);
    } else {
      throw ClientException("No Wi-Fi.");
    }
  }
}
