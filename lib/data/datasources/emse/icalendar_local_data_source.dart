import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/core/files/file_manager.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';
import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar_builder.dart';

abstract class ICalendarLocalDataSource {
  /// Save iCalendar to cache
  Future<void> cacheICalendar(Stream<List<int>> data);

  /// Get a parsed calendar from cache
  Future<ParsedCalendar> getParsedCalendar();
}

@LazySingleton(as: ICalendarLocalDataSource)
class ICalendarLocalDataSourceImpl implements ICalendarLocalDataSource {
  final FileManager fileManager;

  const ICalendarLocalDataSourceImpl({required this.fileManager});

  /// Get the calendar from url and save the .ics (and the url)
  @override
  Future<void> cacheICalendar(Stream<List<int>> data) async {
    final sink = (await fileManager.icalendarFile).openWrite();

    await data.forEach(sink.add);
    await sink.close();
  }

  @override
  Future<ParsedCalendar> getParsedCalendar() async {
    // Use this line of code to inject a template.ics
    // await file
    //     .writeAsString(await rootBundle.loadString(AssetsPaths.TemplateICS));

    // Read the file
    final file = await fileManager.icalendarFile;
    if (file.existsSync()) {
      return file.openRead().transform(utf8.decoder).toParsedCalendar();
    } else {
      throw CacheException('No calendar in cache');
    }
  }
}

extension on Stream<String> {
  Future<ParsedCalendar> toParsedCalendar() async {
    final builder = ParsedCalendarBuilder();
    await builder.fromStream(this);
    return builder.build();
  }
}
