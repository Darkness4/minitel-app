import 'package:flutter/foundation.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ICalendarRemoteDataSource {
  /// Get iCalendar data stream from network
  Stream<String> streamICalendar(String url);
}

class ICalendarRemoteDataSourceImpl implements ICalendarRemoteDataSource {
  final http.Client client;

  const ICalendarRemoteDataSourceImpl({@required this.client});

  /// HTTP GET the .ics from url
  @override
  Stream<String> streamICalendar(String url) async* {
    try {
      final response = await client.send(http.Request('GET', Uri.parse(url)));
      if (response.statusCode == 200) {
        yield* response.stream.toStringStream();
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
