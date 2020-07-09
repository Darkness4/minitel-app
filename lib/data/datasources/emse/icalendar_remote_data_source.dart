import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ICalendarRemoteDataSource {
  /// Get iCalendar data stream from network
  Stream<List<int>> streamICalendar(String url);
}

@LazySingleton(as: ICalendarRemoteDataSource)
class ICalendarRemoteDataSourceImpl implements ICalendarRemoteDataSource {
  final http.Client client;

  const ICalendarRemoteDataSourceImpl({@required this.client});

  /// HTTP GET the .ics from url
  @override
  Stream<List<int>> streamICalendar(String url) async* {
    try {
      final response = await client.send(http.Request('GET', Uri.parse(url)));
      if (response.statusCode == HttpStatus.ok) {
        yield* response.stream;
      } else {
        throw ServerException(
            "Cannot fetch ICalendar: ${response.statusCode} ${response.reasonPhrase}");
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
