import 'dart:io';

import 'package:minitel_toolbox/data/models/icalendar/parsed_calendar_model.dart';

abstract class ICalendarLocalDataSource {
  /// Save iCalendar to cache
  Future<void> cacheICalendar(Stream<String> data);

  /// Get a parsed calendar from cache
  Future<ParsedCalendarModel> get parsedCalendar;
}

class ICalendarLocalDataSourceImpl implements ICalendarLocalDataSource {
  final File file;

  const ICalendarLocalDataSourceImpl({this.file});

  /// Get the calendar from url and save the .ics (and the url)
  @override
  Future<void> cacheICalendar(Stream<String> data) async {
    final IOSink sink = file.openWrite();

    await data.forEach(sink.write);
    await sink.close();
  }

  @override
  Future<ParsedCalendarModel> get parsedCalendar =>
      ParsedCalendarModel.parse(file);
}
