import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ICalendarRemoteDataSource {
  /// Get iCalendar data stream from network
  Stream<String> streamICalendar(String url);
}

class ICalendarRemoteDataSourceImpl implements ICalendarRemoteDataSource {
  final http.Client client;

  const ICalendarRemoteDataSourceImpl({this.client});

  /// HTTP GET the .ics from url
  @override
  Stream<String> streamICalendar(String url) async* {
    final response = await client.send(http.Request('GET', Uri.parse(url)));
    if (response.statusCode == 200) {
      yield* response.stream.toStringStream();
    } else {
      throw ServerException("Cannot fetch ICalendar: ${response.statusCode}");
    }
  }
}
