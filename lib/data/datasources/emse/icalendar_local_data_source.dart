import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/icalendar/parsed_calendar_model.dart';

abstract class ICalendarLocalDataSource {
  /// Save iCalendar to cache
  Future<void> cacheICalendar(Stream<String> data);

  /// Get a parsed calendar from cache
  Future<ParsedCalendarModel> getParsedCalendar();
}

class ICalendarLocalDataSourceImpl implements ICalendarLocalDataSource {
  final File file;

  const ICalendarLocalDataSourceImpl({@required this.file});

  /// Get the calendar from url and save the .ics (and the url)
  @override
  Future<void> cacheICalendar(Stream<String> data) async {
    final IOSink sink = file.openWrite();

    await data.forEach(sink.write);
    await sink.close();
  }

  @override
  Future<ParsedCalendarModel> getParsedCalendar() async {
    // Use this line of code to inject a template.ics
    // await file
    //     .writeAsString(await rootBundle.loadString(AssetsPaths.TemplateICS));

    // Read the file
    if (file.existsSync()) {
      final Stream<String> calendarStream =
          file.openRead().transform(utf8.decoder);
      return ParsedCalendarModel.parse(calendarStream);
    } else {
      throw CacheException("No calendar in cache");
    }
  }
}
