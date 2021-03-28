import 'package:minitel_toolbox/domain/entities/icalendar/parsed_calendar.dart';

abstract class ICalendarRepository {
  Future<ParsedCalendar> get parsedCalendar;

  Future<void> download({
    required String username,
    required String password,
  });
}
